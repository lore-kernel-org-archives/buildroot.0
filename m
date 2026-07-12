Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0874CC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 13:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B53258137A;
	Sun, 12 Jul 2026 13:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbFHSJZMJCus; Sun, 12 Jul 2026 13:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD87181380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783862553;
	bh=N76EaEeRtH1qjRGKTUqZa9qYpve0xvqiP+E0SVtzvQQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=VvFjIgKuw7Jw9xvuBNmNkQGxqAZb5lz9W5o2hjIDsqIrl3VS11RuYXudDDAyKnDnG
	 dlFUYk2dWOp0vnkcjgD5KaLI5XPzwdLIUSkzJSGQFYCrC3D7alaBJ5hUZjH80M4MQ0
	 uHv2lGbrTXoNxgpQrohZ+1CywyDQ+icYj52BN6fOZe5en/Y0oWu+RthoyBXo1iL+YE
	 /99+Ku4jC1j5++1RNItvvEw6OkIGvptsf2AsQfO8j9OmEZH69mSKcmJJ0FQDaUSCWy
	 CpOUS2HPpOiO4qEYtOFTJOmF/zaYOavIzEGvZthLgMbCs1HO0W/sRVrrps+ypj2xew
	 KwMqhUe5rYv+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD87181380;
	Sun, 12 Jul 2026 13:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D4E2EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 363B981384
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vsn69v1Cj682 for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 13:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B44F48137A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44F48137A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44F48137A
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:22:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UUy-1wiMAj3V6g-00Grng; Sun, 12
 Jul 2026 15:22:27 +0200
Message-ID: <a85fca0a-26b5-48f5-a368-8b5a1ca2cfbb@gmx.de>
Date: Sun, 12 Jul 2026 15:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260712110525.1544641-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260712110525.1544641-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:5GridTWuMUp95Equ4ngUwAcnQbf+K42KDAhfEoKfG30vcsokitl
 xD4Av7nTEr/BdF3lBMGHIEqDFXi8S1DbwdlICpX6VTfID90q61suGpDysAUY/wYSZqqTRyE
 wJt6/wvB1meFdVt6zP/soS3S8KNzswLrLTNOEY+0Sg2M0jzjnq1lHni+y/KoeoS016BCUw9
 vSCiMFEmeI2jnNrWreUJw==
UI-OutboundReport: notjunk:1;M01:P0:/Y0x/IfBu34=;+PiO3UxEcT9nbr/AGJ1DDrklxv/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783862548; x=1784467348; i=fiona.klute@gmx.de;
 bh=TFXJnbD0PyydQlsClU7t/bdVO8gL/gbuvI8ZWH1Ocu0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uNJZGREwXV0Zr+6UkDI6n4oh89PRrPClb1cZw7NgShQd7hyZGFwNyKy1OkInRAZW
 MnjTLtIGmLHoYmqtOT8eK10t7mGKbNmC58oZ4JryIV+bj7tMy06LByG4KiHdzgAon
 KGfKDdteg96LA8nLEnfaYcfOo0Gwlu3zny5ESiojmuqm6aGcDsL+H/jquzvejcEfH
 Zh03vCfiRNj8sSJ2Xf4erxD9jr7NprUHPNtMCR27TTmvN8qysr8tP62m5CHlWvVBk
 yN0DVgag/vtpOU6Q3VclN9catihdP24va9CocsDQDgS5O9YuYagsCvjLHqQB87LZ/
 hk22BN9lcQNhQi0n5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=uNJZGREw
Subject: Re: [Buildroot] [PATCH 1/1] package/screen: security bump to
 version 5.0.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 12.07.26 um 13:05 schrieb Bernd Kuhls:
> Rebased patch 0001.
> 
> No CVE entries are found but these commits are part of the bump:
> 
> TOCTOU + chown-follows-symlink in socket directory creation:
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=3dea5ff20c58ad497062d094b6a9b80a7535a7db
> 
> fix potential null pointer dereference:
> https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=ff9d98b8e39f33b07156995188ca55f3459f4d53
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/06012fcffc60a88cad7beb43b73b149d453eb3db
> https://gitlab.com/bkuhls/buildroot/-/commits/1f1b7f8d36e68f6ded627ff203413de028443d8a
> 
>   ...001-Do-not-create-backup-of-old-installed-binary.patch | 8 +++++---
>   package/screen/screen.hash                                | 4 ++--
>   package/screen/screen.mk                                  | 2 +-
>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> index 4a8a55dcec..36a8c9a2c2 100644
> --- a/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> +++ b/package/screen/0001-Do-not-create-backup-of-old-installed-binary.patch
> @@ -11,6 +11,8 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>   [Julien: rebase on top of 4.9.1]
>   [Julien: rebase on top of 5.0.0]
>   Signed-off-by: Julien Olivain <ju.o@free.fr>
> +[Bernd: rebase on top of 5.0.2]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>   ---
>    Makefile.in | 5 -----
>    1 file changed, 5 deletions(-)
> @@ -19,8 +21,8 @@ diff --git a/Makefile.in b/Makefile.in
>   index 92f434a..860ecd7 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -77,12 +77,8 @@ tests/test-%: tests/test-%.c %.o tests/mallocmock.o tests/macros.h tests/signatu
> - 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@ $*.o tests/mallocmock.o
> +@@ -85,12 +85,8 @@ tests/test-detach-cli: tests/integration-detach.c tests/macros.h screen
> + 	$(CC) $(CPPFLAGS) $(CFLAGS) $< -o $@
>    
>    install_bin: screen installdirs
>   -	-if [ -f $(DESTDIR)$(bindir)/$(SCREEN) ] && [ ! -f $(DESTDIR)$(bindir)/$(SCREEN).old ]; \
> @@ -32,7 +34,7 @@ index 92f434a..860ecd7 100644
>    	rm -f $(DESTDIR)$(bindir)/screen
>    	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
>    	cp $(srcdir)/utf8encodings/?? $(DESTDIR)$(SCREENENCODINGS)
> -@@ -107,7 +103,6 @@ installdirs:
> +@@ -115,7 +111,6 @@ installdirs:
>    uninstall:
>    	rm -f $(DESTDIR)$(bindir)/$(SCREEN)
>    	rm -f $(DESTDIR)$(bindir)/screen
> diff --git a/package/screen/screen.hash b/package/screen/screen.hash
> index 61bacd88ff..f030e45490 100644
> --- a/package/screen/screen.hash
> +++ b/package/screen/screen.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz.sig
> -sha256  2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d  screen-5.0.1.tar.gz
> +# https://ftp.gnu.org/gnu/screen/screen-5.0.2.tar.gz.sig
> +sha256  ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332  screen-5.0.2.tar.gz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index c85abaf411..c279fed8bc 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SCREEN_VERSION = 5.0.1
> +SCREEN_VERSION = 5.0.2
>   SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
>   SCREEN_LICENSE = GPL-3.0+
>   SCREEN_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
