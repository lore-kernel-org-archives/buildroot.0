Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A4AC25B76
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 14:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE85140137;
	Tue, 11 Jun 2024 14:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxHLmN14tw01; Tue, 11 Jun 2024 14:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE6A4028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DE6A4028D;
	Tue, 11 Jun 2024 14:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D29B1BF38D
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07B126082C
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 14:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJ7axgWme2Mt for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 14:15:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA803606F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA803606F2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA803606F2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 14:15:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.76]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowGU-1slQnp3TYc-00nuNH; Tue, 11
 Jun 2024 16:15:27 +0200
Message-ID: <0644e0c0-7429-41a4-a5cd-b8f59bdd5428@gmx.de>
Date: Tue, 11 Jun 2024 16:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <20240419213216.518041-3-angelo.compagnucci@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240419213216.518041-3-angelo.compagnucci@gmail.com>
X-Provags-ID: V03:K1:pQdUDW399RjManzGEefGyG7IhTJzzMuO15oDp+m/Xax7iweq2a7
 tJoRxZDfz6cFWjnWbCfLcr2Xnt9yy2YEOHC1bELMhD1MTRslp4rTHCUJLr0KrIGy6ojbeqX
 /6LqOS1dZ1Hz5iWlOHm6r0DnSLTDUoNIfQcD4VG2FaDUgt/JEQpMk+4doQZDtkO6CX2d1tK
 vyEeTRczzqBN+HBRlAT1Q==
UI-OutboundReport: notjunk:1;M01:P0:4bhe5RO9J58=;REOeI4dswfIRa5Ao4Vp4EFpmMzd
 KF8amNYPiuz70mj98FhqZbYeuZ4oEDiwqyDfxWwIJ6VW5MT2wP4a/ltZm1A46y0PGbueEi1Mn
 EBNAHvAuUFu+3nv1onG2PpSfuvjZBUYP5z1ufUjqIDQNYazABo3CgolansVegmlp2Rs3J6uZq
 3qrBm1jPOLnSRfMrcJQr9fW7FuPymecoNl+LWwMvrGCrWXs2efJtxtjOJSlu7f8AlCnOCNGbi
 Pmuy+qAaos/BOJye0QJanGw65vReRkwSVI7dkCrslMiKXOXGkLeFxmiOXV9xRFSnmqhlOequR
 gswQHpIZ8scqM/SAE7zEqAD8NR5pZfA+V4E0C0qnfhS0CjcEbKp+g2M4VNiUKBRMnS1I6CIOZ
 jbB0I4K380wul0e4u68NgxOimlmRywLPFHRTbCdRpXO4HpeQKU2W6rH0Rcrs/14yFvz9xiM9K
 lvnS8alPiTkeLywO2B4zIKp+tYyy7gGllWrzGuH+x7e25B3uN8ZQscEjoBcOUyVHZ4qr5Qlvb
 YtsbAXEw6ZRmrOPpsUpz0p6Y0k/a0S1oTIET3Up7EIT23xIVhE19dPwcQafjIcfdZSiDZeSKI
 4KbpMA6S0PGCaE0Pk044rXx2rgsXMgxyU+rqVxXhu1I00xFmRy6uDiR7n5bdT3OpCljzt1AOS
 DOxEZWIenzOXeA/J85nJbFjr72/0o2Kt+VVZgCKQBnVF3vWzZEIqD4wbYM1DMvJHaJOOoObil
 jb+A/aJTaXyl2u4WjxZwmmnCvGrAkE649+dXRUWC8F54ZiNLkqHhwyX0BnON9R0WuB8i7GPgJ
 5GUeNXtdduMyJnTXHYl5hezrFrnqmp8snv2cBt4qaE34o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718115328; x=1718720128; i=fiona.klute@gmx.de;
 bh=Mc8myufOpKApGicqP+5F/kNds8WYatYhaWoNu/f2GYg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EkKKMpdhlqqQX3GUmwJCL6g/HOqtcUhyXlndqhiCmfwdLmCbXih6kEqOB/hPiNgn
 lYv9bUt1gDiU470VSHQaXrrYTB0RJqZuzQFWbI8z7L5zS1vEZlJR7eG0EZZuMYrvL
 vszyE4kkLMnHZeMvKFmWbGeCu7nIyDKx6Zgu0ogg7z7rQbSg0ESy4sQE5X+CifeJD
 Qipl+l7xAf9v0FT9g7zJEZ5Ld1bM3atFirl7Z+NMczUWORmeyZhiilWQOyUcfpd4h
 bR6+UhznGdBisi6mu4pZefhsqJs6V5hCKHCeNLdqDdCSn2xm9Bif2+5s1KRrSxuDK
 2uH6nR0PZtV5/GqJTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=EkKKMpdh
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-python: fix pep517 data
 files installation
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 19.04.24 um 23:32 schrieb Angelo Compagnucci:
> When installing a wheel in pep517 compatibility mode, the pyinstaller.py is
> invoked with the --data parameter which point to the directory in which data
> files should be installed.
> Actually the --data parameter points to the /usr subdirectory which is indeed
> wrong cause it shall point to the root directory where the wheel will be
> installed.
> This fixes the problem of having configuration files installed in /usr/etc
> instead of /etc.
>
> Fixes:
> http://autobuild.buildroot.net/results/36ac5278d19195a21c3d02d087965e08f49228ef
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Tested-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Testing included: Build for aarch64, configuring fail2ban for sshd,
testing that a host indeed gets banned after repeated failed login
attempts (password auth), with syslog-ng (the default fail2ban patterns
don't work with Busybox syslogd) and nftables.

> ---
>   package/pkg-python.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 839f728e2f..4f9bee4b90 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -70,7 +70,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
>   	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--scripts=$(TARGET_DIR)/usr/bin \
> -	--data=$(TARGET_DIR)/usr
> +	--data=$(TARGET_DIR)
>
>   PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
>   	$(TOPDIR)/support/scripts/pyinstaller.py \
> @@ -79,7 +79,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
>   	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--scripts=$(STAGING_DIR)/usr/bin \
> -	--data=$(STAGING_DIR)/usr
> +	--data=$(STAGING_DIR)
>
>   PKG_PYTHON_PEP517_DEPENDENCIES = \
>   	host-python-pypa-build \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
