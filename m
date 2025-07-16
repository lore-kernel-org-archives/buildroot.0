Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6191C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 564B260DC7;
	Wed, 16 Jul 2025 18:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDFAHFxC91KW; Wed, 16 Jul 2025 18:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E4A614C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E4A614C3;
	Wed, 16 Jul 2025 18:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1365311AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 058BF40CED
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fltseQ_EL6N for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 177764017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177764017A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 177764017A
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:41:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C3A8619F54D;
 Wed, 16 Jul 2025 20:41:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 16 Jul 2025 20:41:13 +0200
MIME-Version: 1.0
Date: Wed, 16 Jul 2025 20:41:13 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
 <e3682b2190a8db8a5e815cb0d76835700fde43fb.1752524763.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <eda07754ff0ec104ef4506ba6549d2d2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752691274;
 bh=aHvDwSFiK8qYjuMtCMMsV+L3JqqK0nKzcCz1RLMREFA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EshdTTZmAi62WW/As5EdxpCht5bt3w5VO03vYg2SdtMOCRasJm44q1NI9vbU9U2Vb
 Fs5U+enPqPfNq3dqB8y4QX+H6td1vxBLuYHItHCSfnuiso1p5FDEAWGG6gHFGL0KTc
 2kf5qjwJzg4MbvZ6fJVkXeb//6E3WPyRWCc9Msdrf+EAbHBri0Fw9OYrTsrvMoacsK
 nUiaY1hPnBpePhDz3ZZRYiDba7AfVFSUrJNrKTtbPdyWAK70IZDManFoeFHXUZ4RTZ
 6c3XntozDZhZhzEiHNfLOuVo5zXgHLrMbxZ5SYZJWFbogd97xIm6PXvh0non7wt7W7
 2iC8PIsghn4Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EshdTTZm
Subject: Re: [Buildroot] [PATCH 01/13] support/testing: add a crun-based
 runtime test for docker-compoe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 14/07/2025 22:25, Yann E. MORIN via buildroot wrote:
> Via the docker-compose runtime test,m we can exercise the full suite of
> the docker-related packages: docker-compose, of course, but also
> docker-engine, which in turn allows exercising containerd. The latter
> by defualt uses runc as the container runtime, but can alternatively 
> use
> crun.
> 
> Extend the docker-compose runtime test with a variant that enables 
> crun.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

I applied this series to master, thanks.

I fixed few minor typos and added links to release notes,
when available. While doing so, I noticed that podman 5.5.2 was
fixing CVE-2025-6032, so I marked to bump as a security fix.
See:
https://gitlab.com/buildroot.org/buildroot/-/commits/413b9774a4bceda35c4e0c67f4d5aea78ee38924

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
