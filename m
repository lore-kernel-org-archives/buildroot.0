Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A694C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7A940B1A;
	Sat, 31 May 2025 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ue70NzxTRETl; Sat, 31 May 2025 16:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8955440A70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8955440A70;
	Sat, 31 May 2025 16:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 307FF127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1732040068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53mJQNW3Wxm0 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 009AF4004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 009AF4004A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 009AF4004A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C8711C00B7; Sat, 31 May 2025 18:43:57 +0200 (CEST)
Message-ID: <12798d5c-e61a-405f-ad00-ce63a7f2cfec@rnout.be>
Date: Sat, 31 May 2025 18:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250512214829.462894-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250512214829.462894-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709837; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DiCTmSVYHNFW7xBTqHsvOBkvttWejXwSKe54B4Jyuhc=;
 b=n+vG/br3zkelqMG1J44CzwQqBAVRiB7jt62JflabmpgCE0x73i6CBJCc6rORW/sJMGf2+f
 AZf7s1yiKZiRuuCg1i1Bn8+mX6hdPHxC1MpYcC9uczOacnJhCldGT5nfXq3Oajzk5D8NE2
 +CmCYjYVvSX0k3r9FI+9bFI/xBerdctQOChWdbfqllSPYNiD1zdcOPMz7av1BwT3bTubJK
 POCskfA3Yv8B/HjqVelofSD8ud3FhsKqo7mG9Ye7JH9+FkRK4IBpWKxQoAJh3PyvQ9bwZQ
 ixCPDChnitoEW60ejJ2hjow3mf6cBkDynPIsHTvLpeUI9n8DKaXVGV+xhHV5SA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=n+vG/br3
Subject: Re: [Buildroot] [PATCH] package/dbus-glib: bump version to 0.114
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/05/2025 23:48, Bernd Kuhls wrote:
> Updated license files and hashes due to upstream commits
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/LICENSES?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> https://cgit.freedesktop.org/dbus/dbus-glib/commit/COPYING?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dbus-glib/dbus-glib.hash | 6 ++++--
>   package/dbus-glib/dbus-glib.mk   | 7 +++++--
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
> index 072dde3d69..1ce3c6b63d 100644
> --- a/package/dbus-glib/dbus-glib.hash
> +++ b/package/dbus-glib/dbus-glib.hash
> @@ -1,5 +1,7 @@
>   # Locally calculated after checking pgp signature
> -sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
> +sha256  c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c  dbus-glib-0.114.tar.gz
>   
>   # Locally calculated
> -sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
> +sha256  095e2affe38031d0ca80db5dbf06881306e5f5125f6ba422297396bdfe02b3d5  COPYING
> +sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
> +sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
> diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
> index 0d247e1d89..5c13c0b37f 100644
> --- a/package/dbus-glib/dbus-glib.mk
> +++ b/package/dbus-glib/dbus-glib.mk
> @@ -4,11 +4,14 @@
>   #
>   ################################################################################
>   
> -DBUS_GLIB_VERSION = 0.112
> +DBUS_GLIB_VERSION = 0.114
>   DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
>   DBUS_GLIB_INSTALL_STAGING = YES
>   DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
> -DBUS_GLIB_LICENSE_FILES = COPYING
> +DBUS_GLIB_LICENSE_FILES = \
> +	COPYING \
> +	LICENSES/AFL-2.1.txt \
> +	LICENSES/GPL-2.0-or-later.txt
>   DBUS_GLIB_CPE_ID_VENDOR = freedesktop
>   
>   DBUS_GLIB_CONF_ENV = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
