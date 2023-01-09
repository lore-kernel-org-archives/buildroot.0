Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454AEC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 19:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D76F415E2;
	Mon,  9 Jan 2023 19:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D76F415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5hVQgGIK34Z; Mon,  9 Jan 2023 19:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F59415D3;
	Mon,  9 Jan 2023 19:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F59415D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 323871BF289
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 19:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13F2560A9F
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 19:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F2560A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqfURaK3W06Y for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 19:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 819D060A65
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 819D060A65
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 19:21:17 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id DF4FB24048B
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 20:21:14 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4NrP1j2hnZz6tnF;
 Mon,  9 Jan 2023 20:21:13 +0100 (CET)
Message-ID: <c81e4acd-265b-ce85-6ee5-fd1aac0edf49@posteo.de>
Date: Mon,  9 Jan 2023 19:21:13 +0000
MIME-Version: 1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-4-james.hilliard1@gmail.com>
 <20230108222926.GJ151997@scaer>
From: Dominik Michael Rauh <dmrauh@posteo.de>
In-Reply-To: <20230108222926.GJ151997@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1673292074; bh=EFN9ImTMZiPl1k8Zg3B/fuHb83pR/siKdAwmcEW7OvY=;
 h=Date:Subject:To:Cc:From:From;
 b=pubCRjPF9DVTC12VWveNuttvApr9CAfGqlLja5Ao+ghhCXAMRe2249DFkHFo3zSVw
 rnGc0vAvd/nuN6WZcJSO1Crf2VQaDJ4DJSjCtIPZeLDW6WlavSGJWaSJgnd2EKs7mS
 r5CTZW0y1sbcG3yaI25fvdBed1hRYKmCWrwmpDcWC90hFOKg2TM6/wZcqXi2kJ1g3o
 5m5mWRUhA9YQ7Ng2PSLTOzoD2bqJyClW2s8uvyjDUkCpc0bn9hrcBHO1A3+oTIaSgs
 KkGrRDcf7b4aBQ2P4T2Oa1NZeUE8XrBP6MLV0/Wc9hrZ2nt/s9tjUB6izhfOQf+dtb
 1cd8uzWe5IaAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=pubCRjPF
Subject: Re: [Buildroot] [PATCH 4/4] package/ccache: bump to version 4.7.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?Q?Anders_F_Bj=c3=b6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, James, All,

On 08.01.23 23:29, Yann E. MORIN wrote:

> Dominik and Anders made hiredis an optional dependency. Given that
> hiredis builds very, very fast (just about 3s here), I wonder if that
> really makes sense to make it optional; hiredis has no dependency that
> are not dependencies of ccache, so there is no hidden overhead.
> 
> If hiredis support is compiled in, does that make it mandatory to use a
> hiredis server, or does ccache still uses local files by default?
> 
> If the latter, then I think a mandatory dependency is OK.
> 
> Dominik, Anders, did you make it a optional because of a previous review
> by Thomas asking so?

The decision to make hiredis support optional was only based on the fact 
that, well, it is purely optional :)

In hindsight I agree to enable the hiredis backend by default since
hiredis builds very quickly and does not pull in additional dependencies!

Maybe the more interesting question is whether it is really advisable to
still build ccache as part of Buildroot since, in contrast to hiredis,
building cmake, which is required by ccache, takes significantly longer 
and consumes much more resources.

On 07.08.22 14:39, Thomas Petazzoni wrote:

 > A possible alternative we could explore is to no longer build ccache
 > ourselves and rely on ccache being provided by the host distribution.
 > Of course, raises the question of which ccache version is available on
 > the host, and how to tweak its configuration to match the needs of
 > Buildroot.

Best regards,
Dominik

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
