Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1595FC54EBD
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819A941C5C;
	Fri,  6 Jan 2023 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 819A941C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4i45w_4fCc78; Fri,  6 Jan 2023 21:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664DF41C5E;
	Fri,  6 Jan 2023 21:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664DF41C5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40241BF5E9
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7FC40022
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7FC40022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmsNvHa_IsNk for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:27:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D1F340156
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D1F340156
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:27:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbIn-1p5xsj0mp9-009kcR; Fri, 06
 Jan 2023 22:27:18 +0100
Date: Fri, 6 Jan 2023 22:27:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20230106222716.7b661245@gmx.net>
In-Reply-To: <20230106210827.30007-3-ps.report@gmx.net>
References: <20230106210827.30007-1-ps.report@gmx.net>
 <20230106210827.30007-3-ps.report@gmx.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:OVfrUnjSgv9VivOKzJalU9YaZLNt2f2HlohyXzrCya7UQV9dLiU
 4mf0p/DnjN04yOjzh/jCwxf7bTdJOjH0du0C/iGWV+S3ksDZkNeAXIaQhPdtEL+CV/y0+v5
 GwxwhshfSMWs59P6g/4XIDfRJmtsaPeVvghKKkuSlQGCbSytuA9pxQr/c4v/gDcfl1DoV2Y
 G4TBptYmZN63Y4cUPQzSA==
UI-OutboundReport: notjunk:1;M01:P0:WdNrynwpwZ0=;55SYj88RUBE9VHfdjBRz/5lrRjc
 LXkjXoT6Smqif7oaSkeduXrwQd0e1BfyhNNM3Q9NoKftP1t1GmHVuNJJjS06/e4L4regTk8qH
 /3YH7IcGHwQgnkUh0CB3MaG8VOe01Dm3K8zRBGeqxTkKGw/DEQKYC+jW2tLq7DnYN6ZIZ93cM
 2FCWgsHYu0OetH+KcFLGblxGVWkChxuQ5gHKd8nweEZqy0gF2phl1vE5cuU5I6YvpVBgkstkI
 MonJllNz9t/nrD833SvsUuPr59PzXfukc1vUZErHMDDsmv+S9oS7I/9//eDKIoD7/f/jWt96M
 tJJtA2JT4poWH5fdC4qhOV6QfihFVRS7RmeipFCMiZ2SQbFZpCTDzsA0CmIvT84/sI6pastEH
 9npHfU8ojLGXehdwxeJhmPqTl3WMv9giY4Z2ni7Lmz9IDBXmiUlKhHwKhkuLk5ntGhV638ajc
 SLl6f0ePd3mRpBzBfjbh1xoxS7K31U0x9ekiq64LnBWPE385Vyv9AvzOVj+mceuccWnw9B9V4
 r8pundpmBCLnDY3kDT7kvf27M0kKdMbNyskPH2nFztKh4TjNFwvQRviTViYswJ2ofaWt9ZriK
 ULVoBrwkSKcfjTZ7PF7oYIFTYVmwr1jZRr5RLoF/krlDO9JO3dhoacT+d3dY5QomggLPZk/sV
 YwzyqpCA9adL71Vp6SxplzeW9E9UQcyuhHqLQo2QSNZAqufcqyAkRn3H7pgROD+UrCxmMEHsB
 g4YnG4x9vRk2ah5EoufNPug+E9cABQ9rNdf0m6T8HGSteodSchnZLKWc1OP4hzZrQd9NmHWnF
 ktNqS8rkflEEdOlCSeWVx7nbdSdsTI9dHScXQLVedPSGYj8N3xHwGLcfJ4YtDBIcO0ipv5223
 1WwuWAnqBLJYKfCQy3D8TVFJtZcyGsQQksHjnWY0k4dP4BTwFR1uJ42VQ1VAq5Y7uxOGNf0VH
 SOla7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673040438; bh=Co7Wc8630F/s2XVLp9OwHW8E+esljXLwOHANYR1e/mc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Hg3+wM0SjA7yQRs1VlBt9lgzfpdhuKoRsqrLeiNYvtCQHoPtrdMl2pRZUuQNTAYFI
 LNsIVCFHzBtpzkqznY/dSA3pS7VX9wdpq5gTcU0UV9TzkUh1NMR1eIEauZYqMcf5KC
 d+mlySkrrXTzJMD33eB9exu6+fF8uNjKfOG9sEalfk/Y3U2DM4qdjHGX9N7jpSt5qD
 QjPZGJWMQgYfFFg4aAMSQVYibL2AKyqWwUNDdxFahEggUs68OLsiqDkcJWMWZFGEEb
 x2ZkPMJTyQB8OOyZU5bGUOEBFDXemSxMLEXxxFxsF6s5XnZ4dWiyTk+oiS7zXJm0GT
 G4cHUdb44t2Tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Hg3+wM0S
Subject: Re: [Buildroot] [PATCH v1] package/qt5speech: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

the patches

  - [PATCH v1] package/dotconf: new package
  - [PATCH v1] package/speechd: new package
  - [PATCH v1] package/qt5speech: new package (this one)

should have been in one patch series (1/3, 2/3, 3/3)...

Regards,
Peter


On Fri,  6 Jan 2023 22:08:27 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/Config.in                |  1 +
>  package/qt5/qt5speech/Config.in      | 12 ++++++++++++
>  package/qt5/qt5speech/qt5speech.hash |  7 +++++++
>  package/qt5/qt5speech/qt5speech.mk   | 23 +++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/qt5/qt5speech/Config.in
>  create mode 100644 package/qt5/qt5speech/qt5speech.hash
>  create mode 100644 package/qt5/qt5speech/qt5speech.mk
>
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 6dc9cfa148..f1b16ff39b 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -59,6 +59,7 @@ source "package/qt5/qt5scxml/Config.in"
>  source "package/qt5/qt5sensors/Config.in"
>  source "package/qt5/qt5serialbus/Config.in"
>  source "package/qt5/qt5serialport/Config.in"
> +source "package/qt5/qt5speech/Config.in"
>  source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5tools/Config.in"
>  source "package/qt5/qt5virtualkeyboard/Config.in"
> diff --git a/package/qt5/qt5speech/Config.in b/package/qt5/qt5speech/Config.in
> new file mode 100644
> index 0000000000..cebd06057e
> --- /dev/null
> +++ b/package/qt5/qt5speech/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_QT5SPEECH
> +	bool "qt5speech"
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  Qt Speech enables support for accessibility features such as
> +	  text-to-speech.
> +
> +	  For output optional enable flite or speechd.
> +
> +	  https://doc.qt.io/qt-5/qtspeech-index.html
> diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
> new file mode 100644
> index 0000000000..595aac9f22
> --- /dev/null
> +++ b/package/qt5/qt5speech/qt5speech.hash
> @@ -0,0 +1,7 @@
> +# Locally calculated
> +sha256  6d0794ab9d5286d04fbac2db44c00ed3306e569c876f84cfd91ac0e79c834b1e  qtspeech-d32f4a479d38a11f547598004b975f4356424a16.tar.bz2
> +
> +# Hashes for license files:
> +sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
> +sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
> +sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
> diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
> new file mode 100644
> index 0000000000..8cf6fe19c1
> --- /dev/null
> +++ b/package/qt5/qt5speech/qt5speech.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# qt5speech
> +#
> +################################################################################
> +
> +QT5SPEECH_VERSION = d32f4a479d38a11f547598004b975f4356424a16
> +QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
> +QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
> +QT5SPEECH_INSTALL_STAGING = YES
> +QT5SPEECH_LICENSE = GPL-2.0+ or LGPL-3.0, GFDL-1.3 (docs)
> +QT5SPEECH_LICENSE_FILES = LICENSE.GPLv2 LICENSE.LGPLv3 LICENSE.FDL
> +QT5SPEECH_SYNC_QT_HEADERS = YES
> +
> +ifeq ($(BR2_PACKAGE_FLITE),y)
> +QT5SPEECH_DEPENDENCIES += flite
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SPEECHD),y)
> +QT5SPEECH_DEPENDENCIES += speechd
> +endif
> +
> +$(eval $(qmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
