Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EA6CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 07:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD0C6069F;
	Thu,  4 Sep 2025 07:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaxfbGZ6tn98; Thu,  4 Sep 2025 07:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6399F60826
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6399F60826;
	Thu,  4 Sep 2025 07:24:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB46106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06F8E42460
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbES5xxUvbYk for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 07:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AF6242458
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF6242458
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AF6242458
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 07:24:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 462C51A0996;
 Thu,  4 Sep 2025 07:24:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16CF4606BB;
 Thu,  4 Sep 2025 07:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8B4D1C22DB04; 
 Thu,  4 Sep 2025 09:24:08 +0200 (CEST)
Date: Thu, 4 Sep 2025 09:24:03 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250904092403.5337e110@windsurf>
In-Reply-To: <d4bf892c-8d46-4749-97d6-889bb49479db@smile.fr>
References: <20250823204043.244589-1-thomas.petazzoni@bootlin.com>
 <d4bf892c-8d46-4749-97d6-889bb49479db@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756970662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wGc4Vlkiiu5QUqx0CnM5e1uX7ki1MH5ExOw9hxKWF/k=;
 b=qQHwpxGFD+TlwZvHZj6DOxqczFi9UdFCAgpdv/SIDCiJ/ghwsftOWHCN8gCj1syq4fFdyO
 lSay2fMBbvY3n+VCUmsBmn3KbBGfMJsba3Cu/l9eRg1JyJX5TtsDr/OPUVnYaqP4E/ScvS
 3NCDQN3MDa1Noa5JSCGSCoLXL23YzHzWJhyIfH2SLvu2hN3N2tQ8fLxhEDOpCs7MdXpqE2
 GeimefvvChXsPG2bVjPN2K+QdPjq0IC46aHA9cUepgGxirDLaN6ni5NVgWEjvIOor4CbO/
 KkEhqJDI0PjV49Wy3EqFwg8tARo2E0+rbFUTUsjKeVHIrtedGpKUnzLxteJDvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qQHwpxGF
Subject: Re: [Buildroot] [PATCH] package/wayland: tweak wayland-scanner.pc
 after installation to fix SDL2 build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sun, 24 Aug 2025 14:11:31 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> It seems obvious that /usr/bin/wayland-scanner should not exist on the build
> machine to reproduce the issue. I didn't checked that before trying to reproduce
> the issue so sdl2 build fine. Maybe /usr/bin/wayland-scanner is installed on
> autobuilders?

As you're probably aware there is not such thing as a "standard"
configuration for the autobuilder workers. Each worker is using its own
distro, with some set of installed packages, depending on who runs this
worker. So some may have /usr/bin/wayland-scanner installed, some may
not.

And this is actually a _good_ thing, as we do want a variety of hosts
systems to be used for our testing.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
