Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B606EEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C7B820C5;
	Mon, 10 Jul 2023 17:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C7B820C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGDTda0FxLsy; Mon, 10 Jul 2023 17:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2A782032;
	Mon, 10 Jul 2023 17:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB2A782032
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E32E91BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC68040B58
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC68040B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqdeXNBUExoI for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:34:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0AD340A84
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0AD340A84
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:34:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66E5A2000F;
 Mon, 10 Jul 2023 17:34:40 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:34:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710193439.5ee0f9fc@windsurf>
In-Reply-To: <20230704061944.496211-1-bernd@kuhls.net>
References: <20230704061944.496211-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nhz/8rp6fPvydql8yiJFq5hC5PIqjKZlTcZcXTu8Qr0=;
 b=epsUon9Oj8JGQpmPJHmO005yPedrEsSqwpDlkOQ5v7G+k/qP+C78yKtUG8Myb6x7bVUxEu
 eWUDejVNe4mce0oa7lq8Z8ulHlHrw0l2kjKY3TMbDTftOCfgKNC7Y4wih6qgEJ7IYFOuoH
 AP5pBUPUSmaJE7BldcOMOH+7+CIElh/lgqYQmFe4TMoVak0t0bDcyn+WrHwO3WdGiEYe32
 wv6DDcZBccJa+5gaviTMROODsyiXjNQtDjY8FsUy8wnxyJPGk9HGBAudWW42KDiDLsJtBs
 83B/AlZsc0O0lqyNxMR6e1LreHrHWkNWM6mk71+XEqvVcGL7KINRoq46ZRaBww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=epsUon9O
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix cross build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jul 2023 08:19:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fix build error introduced by bumping bluez5_utils to 5.68 with buildroot
> commit 7cac499ec46655a491e59b5bbc2a83a2137099bd due to upstream commit
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/configure.ac?id=1106b28be85ac9586d1758839226e163e9030ee2
> 
> Fixes:
> http://autobuild.buildroot.net/results/564/564952e0f9c7f69ef266d7df455ca033fb52d9f7/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-configure-Check-ell-path.patch       | 35 +++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk          |  2 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/bluez5_utils/0001-configure-Check-ell-path.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
