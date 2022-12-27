Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3857C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797F840550;
	Tue, 27 Dec 2022 21:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797F840550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qohMIxvY2MmO; Tue, 27 Dec 2022 21:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C2C1404C0;
	Tue, 27 Dec 2022 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2C1404C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5011BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44A8040386
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A8040386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30p4zz2QzxvJ for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:33:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 076694018F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 076694018F
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:33:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 262FD20002;
 Tue, 27 Dec 2022 21:33:30 +0000 (UTC)
Date: Tue, 27 Dec 2022 22:33:29 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221227223329.7c1d988c@windsurf>
In-Reply-To: <20221223171351.24867-1-fontaine.fabrice@gmail.com>
References: <20221223171351.24867-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672176810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IgJHS3uRU7OZRQ7Q2b4OhxgUDUI3hx8ilr1pQ7yWlZ0=;
 b=O/89w+MXwyW9HBFV9x4Fg93EPZMx0/3Yw4QrWaPCTqHep7p2LfseJscKZ31zD1gVIWYSc2
 lagIa9QG2fp4ruv4x2bSvzh70uoGCf14Fb2zyGp3Fz1WF48ZvDuF88/QgKCpEuZS6TscBv
 OH/F7hmDbN2VMCa2UJld+2lALH6ScCYHA/IlRSV7XcNgTl9DMmzdbfsNwjPBT+eWyw1ieb
 33e/pCu8FXZqAYZNMQTTB5dQsbM/3OxM/EpHpcL/cAqI/lOTwdMZNjC+DVAMrXEQjlkffk
 zwAyLrQZhk39MaQfUQLHlY3V6HykW3fqmuHsJBbC0rdm4wMuGpeQFUyON8OzSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/89w+MX
Subject: Re: [Buildroot] [PATCH 1/1] package/libvncserver: bump to version
 0.9.14
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Dec 2022 18:13:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - examples and tests can be disabled since
>   https://github.com/LibVNC/libvncserver/commit/0b8990784a81823eecc9089263ac1966d17bf399
> 
> https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.14
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...enssl.c-fix-build-with-libressl-3.5..patch | 66 -------------------
>  ...ee-vncRec-memory-in-rfbClientCleanup.patch | 28 --------
>  package/libvncserver/libvncserver.hash        |  2 +-
>  package/libvncserver/libvncserver.mk          |  9 ++-
>  4 files changed, 5 insertions(+), 100 deletions(-)
>  delete mode 100644 package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
>  delete mode 100644 package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch

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
