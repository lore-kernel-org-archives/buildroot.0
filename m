Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D78CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1395184730;
	Wed, 17 Sep 2025 21:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_imyPP7-anK; Wed, 17 Sep 2025 21:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 672F48472B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672F48472B;
	Wed, 17 Sep 2025 21:01:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF21EAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC4FA407E4
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWL_LCzOpRNT for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 21:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49E7E407D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E7E407D2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49E7E407D2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 21:01:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F3170780333;
 Wed, 17 Sep 2025 23:01:14 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 23:01:14 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 23:01:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?R=C3=A9mi_R=C3=A9rolle?=
 <remi.rerolle@gmail.com>
In-Reply-To: <20250908183816.3689041-1-thomas.petazzoni@bootlin.com>
References: <20250908183816.3689041-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bd757a7940086167856b1811cfda383e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758142877;
 bh=k4mdXsOrPNhrbGWf3pkHBKLErre3XuENb8I4UdQl1q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e3IWBt+AIjW8JJXF+cqZk7W/T4y9OrcTHgNQUg6Rry8P1rc6MxOvldr3FchsgqGkE
 /MXk9J+kkL5XfyVUOrqzKcsa8/3eWAmAui9hsY/Jxe2r6JEKODDcwIDaLguOYIzGva
 LnAmArFYCRyxo3uGLj3uOFrCPw4IF8ye9liDy+JyQPeQpXZn8S2qfbZsOt4iXDSS7t
 CYnxdpRdVwrrIUYKoy/gfoCiUxcWDyFFJTF/QwEPta0tlk9eHgGsi8FpSs49FRR/+X
 uFNkd2By3/s87Fy6brbUNuvxlWmWWxU+97h2pq4HqcMAVvxbMdyrRDnDHUwCwtYBnU
 qy0UHAMXgSMnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e3IWBt+A
Subject: Re: [Buildroot] [PATCH] package/libfreeimage: fix build with GCC
 14.x
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

On 08/09/2025 20:38, Thomas Petazzoni via buildroot wrote:
> Take two patches from the Debian jxrlib package, and integrate them to
> fix the build of the bundled jxrlib library found in the libfreeimage
> package.
> 
> libfreeimage isn't exactly well maintained: its last version 3.18.0 is
> quite old (July 2018), there's a fairly large number of tickets in the
> bug tracker claiming to be CVE
> reports (https://sourceforge.net/p/freeimage/bugs/), it is still using
> SVN as the version control system.
> 
> However, it is used as an optional dependency for CEGUI, and a
> mandatory dependency for Ogre. However, it no longer seems to be a
> dependency for more recent versions of Ogre. But in any case it cannot
> simply be dropped.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/452462285bf93b13f092fb41696952f415e75b2f/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

For info, I fixed the DOS-newlines in the patches, which I believe
were correct when you sent the patch but were removed by the mailing
list.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
