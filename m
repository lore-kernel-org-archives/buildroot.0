Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB294D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 811D3605D7;
	Thu, 27 Nov 2025 19:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjmfTvxNxqgs; Thu, 27 Nov 2025 19:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E56C608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E56C608C2;
	Thu, 27 Nov 2025 19:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C63E2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 632654033C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvrxqPaiIIid for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 010C6413B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 010C6413B5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 010C6413B5
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD729B979CE5; Thu, 27 Nov 2025 20:50:57 +0100 (CET)
Message-ID: <f092c69b-a9c7-4770-a317-d66a4e850b52@rnout.be>
Date: Thu, 27 Nov 2025 20:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Z-4CjumMkTD4gck1@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <Z-4CjumMkTD4gck1@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273059; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=79fJI5IOAtPMze5yZYtALYEvPM//O10zANOuWmELTbU=;
 b=LG6ZVhTO+4bZ1oSnaVrCV2v8n4kufljnzza2oi3GxvJGiemC63mQ/5e/TrDL0zgb28myaB
 BCY1XTrL2iQ9AR5d0FFSCYpJQD4kSugR2spntYyOmHfvFrzruaVQ4MGwUmEMd+BAusYj1V
 +ZHkdw0gpOm9JksEFOxSuI7kdR9QZ3Wyn+dQhS6rM2lRwtE7W571Wc5S9aSqT/BLP2NGwf
 wsp4m7+06mpTCZgp+fWEQeuVfm/D/K6MIKFdtpCzhT4WprHOHTRqYnMATUfOnsJIRrHL6m
 el5+L3aCbybx2WJBXe8XFnDCu9TcY+QFCucYk8oic2hSxRgVVqiZ+bmAc4hQFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=LG6ZVhTO
Subject: Re: [Buildroot] [PATCH v2] package/asterisk: update to 22.3.0
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



On 03/04/2025 05:37, Waldemar Brodkorb wrote:
> For a changelog see here:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22.3.0.md
> 
> Changes made by the package maintainer:
> - add systemd service file
> - run asterisk as non-root user asterisk
> - build pjsip as bundled source code, but download it like
>    sound files
> - remove unused configure options
> - chan_alsa was removed upstream in commit
>    de3ce178ab0282445cf25161b49f3737ac2d20ff
> 
> See here for the reason behind using the bundled pjsip:
> https://github.com/asterisk/asterisk/issues/671
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> - v1 -> v2:
>    - add a comment about the pjsip issue to the Makefile (Arnout)
>    - update commit log to include link to chan_alsa removal (Arnout)
>    - update systemd file with a comment where it come from and
>      what changed to the orginal file (Arnout)
> ---
>   package/asterisk/asterisk.hash    |  4 +++-
>   package/asterisk/asterisk.mk      | 31 ++++++++++++++++++-------------
>   package/asterisk/asterisk.service | 23 +++++++++++++++++++++++
>   3 files changed, 44 insertions(+), 14 deletions(-)
>   create mode 100644 package/asterisk/asterisk.service
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index 8c8ebddc47..7b28624921 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,6 +1,8 @@
>   # Locally computed
> -sha256  94647b3f887f7dc91df51a4f88dfc3a07cc279bef86b8d05aa72f0c49d187571  asterisk-20.11.1.tar.gz
> +sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
>   
> +# Locally computed
> +sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
>   # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>   # sha256 locally computed
>   sha1  721c512feaea102700d5bdce952fdc0bb29dc640  asterisk-core-sounds-en-gsm-1.6.1.tar.gz
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index ec67632ef4..6d682f161d 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,15 +4,20 @@
>   #
>   ################################################################################
>   
> -ASTERISK_VERSION = 20.11.1
> +ASTERISK_VERSION = 22.3.0
>   # Use the github mirror: it's an official mirror maintained by Digium, and
>   # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>   ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
>   
> +# compilation with the external pjsip produces a non-working asterisk, which
> +# segfaults. The reason behind this is unclear.
> +# https://github.com/asterisk/asterisk/issues/671
> +ASTERISK_PJSIP_URL = https://raw.githubusercontent.com/asterisk/third-party/master/pjproject/2.15.1/
>   ASTERISK_SOUNDS_BASE_URL = http://downloads.asterisk.org/pub/telephony/sounds/releases
>   ASTERISK_EXTRA_DOWNLOADS = \
>   	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
> -	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
> +	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz \
> +	$(ASTERISK_PJSIP_URL)/pjproject-2.15.1.tar.bz2
>   
>   ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
>   ASTERISK_LICENSE_FILES = \
> @@ -76,7 +81,6 @@ ASTERISK_CONF_OPTS = \
>   	--without-neon29 \
>   	--without-newt \
>   	--without-openr2 \
> -	--without-osptk \
>   	--without-postgres \
>   	--without-popt \
>   	--without-resample \
> @@ -94,10 +98,9 @@ ASTERISK_CONF_OPTS = \
>   	--with-libjwt="$(STAGING_DIR)/usr" \
>   	--with-libxml2 \
>   	--with-libedit="$(STAGING_DIR)/usr" \
> -	--without-pjproject-bundled \
> -	--with-pjproject="$(STAGING_DIR)/usr" \
> +	--with-pjproject-bundled \
>   	--with-sqlite3="$(STAGING_DIR)/usr" \
> -	--with-sounds-cache=$(ASTERISK_DL_DIR)
> +	--with-download-cache=$(ASTERISK_DL_DIR)
>   
>   # avcodec are from ffmpeg. There is virtually zero chance this could
>   # even work; asterisk is looking for ffmpeg/avcodec.h which has not
> @@ -135,13 +138,6 @@ else
>   ASTERISK_CONF_OPTS += --without-gsm
>   endif
>   
> -ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> -ASTERISK_DEPENDENCIES += alsa-lib
> -ASTERISK_CONF_OPTS += --with-asound
> -else
> -ASTERISK_CONF_OPTS += --without-asound
> -endif
> -
>   ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
>   ASTERISK_DEPENDENCIES += bluez5_utils
>   ASTERISK_CONF_OPTS += --with-bluetooth
> @@ -299,6 +295,15 @@ ASTERISK_INSTALL_TARGET_OPTS = \
>   	LDCONFIG=true \
>   	install samples
>   
> +define ASTERISK_USERS
> +	asterisk -1 asterisk -1 * /usr/lib/asterisk - - asterisk user
> +endef
> +
> +define ASTERISK_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/asterisk/asterisk.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/asterisk.service
> +endef
> +
>   $(eval $(autotools-package))
>   
>   #-------------------------------------------------------------------------------
> diff --git a/package/asterisk/asterisk.service b/package/asterisk/asterisk.service
> new file mode 100644
> index 0000000000..802789defb
> --- /dev/null
> +++ b/package/asterisk/asterisk.service
> @@ -0,0 +1,23 @@
> +# based on included asterisk.service, but changed
> +# Type to simple, comments removed
> +[Unit]
> +Description=Asterisk PBX and telephony daemon.
> +After=network.target
> +
> +[Service]
> +Type=simple
> +Environment=HOME=/usr/lib/asterisk
> +WorkingDirectory=/usr/lib/asterisk
> +User=asterisk
> +Group=asterisk
> +ExecStart=/usr/sbin/asterisk -mqf -C /etc/asterisk/asterisk.conf
> +ExecReload=/usr/sbin/asterisk -rx 'core reload'
> +RuntimeDirectory=asterisk
> +LimitCORE=infinity
> +Restart=always
> +RestartSec=4
> +StandardOutput=null
> +PrivateTmp=true
> +
> +[Install]
> +WantedBy=multi-user.target

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
