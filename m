Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAC1606A324
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WfkjSKlV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ILgDnBsv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA5B80F55;
	Wed, 28 Oct 2026 11:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nGTbay_chQb; Wed, 28 Oct 2026 11:33:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E22280FFF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187229;
	b=d7IgkeKZ8pgkl9q0o5eQwE5ZENOqgTANQFEZJ2URnUWA6CTLWuN7OYNGdBJto7ZCx7HY
	 ma/P7xQ9HOCCn9S7VTCSf3c+sm300aPVPk0BXvQVPeUDOVjTo12mbRTIHfEcVzCjsPBOX
	 xVfY6dAWeImeB8+ObmshJTm0C/gLutPf7g8l3GNqRf6Int34p4FKGKOGrVEVKWMYshqLW
	 0VFdwgIdiLSObcI2YUoNtd5Pz53MCxlb9xwdGc3WnalHNP4fC4Ny/Qwu7mG1gJKdT/lmN
	 L86d0/i2Mw1DEhbSu5mvIgS7NNRDBUSvJx6zH741KyKIF3NVyMAFaaAAx939B9lU6Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187229;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=c1qLDMXcz/67tqkCcMbtqtiEy9oK31kbJ+GnmZypbNo=;
	b=FBx2k3T/OGwPNz/dfWwZhzULB/+EobpYyBEHAV1J28USmE/jOYhAuLqShp9+x87XdCK1
	 Ks/i/heWFJcIBXRoNVdD0RwIvrmyPGGK7F+BteSi8JGLN+8mC/hjDCLhU7PhhZTjfmI2a
	 Jjxyl2evBIV+SQblVKKQGUynP9bYOqJ2Kks7GZ6oZEvxeaMwdirclnPuxFJaf7QVmzMM0
	 B4lsOwEoMbgnajYWqN6hHUJyC3RhuMT3knw3MUCfViRUVPcHThlQFY8vKyWtztMP/U7Ws
	 3HeCERvgU1itOzckWpJqNRv+8at9jKWxeLpTYlovDTb8BII9moCuJs55qGTyWN3yrSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187229;
	bh=c1qLDMXcz/67tqkCcMbtqtiEy9oK31kbJ+GnmZypbNo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WfkjSKlV79nSkwYV292SYwxdJfiuYHMxRgSZ+hmUVijHv6Ip7X6vEJv6bUB614Khn
	 IivcvWC1tLpLxO3m73Rx1Yx1pBWosknqvs3Mtxnqnr7FshXPzCmX3LgNa56Xpe29Hf
	 xU2eivBQm4DzYZSZcAsLcQNin51rhiNkQhmDfTk+HceRSFYsornAYwaDwAPst2AZsZ
	 RT72JwatYkF92jRcVlbOEG9KvsDcl6Yb7gPNtvEGmOvA7Yyf1xSiacMYAoaXFiq0R/
	 pqSiqmL9mWEah/GYWxzqMSmAK/CjnT+AZKYAO0pKdX1/trMmwyOZge0mwtYqZAdpZu
	 A8XkaAjYKc8qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E22280FFF;
	Wed, 28 Oct 2026 11:33:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB2EE529
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCDC2400FF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2D5-p5nDag3k for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:33:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8B0D240087
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187220;
 b=SV2OAt6mWAYc+9C/v0koCKNJjggh3aFLnbYhb5wXjpeSC9mpXEW+pmcgvdM0bwEpIfaM
 DekkMWAjbSf2qK7Hl7Hpc6TIKy0SLdsUKmvh/wR+8FlyXbEKWRzdTN+ulUrzibPJBCyKt
 fURfoYtX7itfxlVHARVp8UfgZOFgqtd+lvQKFOF3yTnBqVJhh446nxg1fq+2S/YCgnkjO
 pVSNe/Dqg0AknVDqQLYV+nY6pKoJsLXZrVWpdZ6Ykn8pPuA4VlmQJulS0/ejdldj2Qvkd
 OmN3xQm8fZfbhjRMD7+pim8edI0NEBUhTlTQkvZVODA4wJRAYMZY+6txgYSJ2VWTE1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187220;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=EWkoR0DbUkYM/H7oWAJe6TxA9Pf2rEQaSQpJyJPknNk=;
 b=Bj2X2PTPs5z23JmbA8yU0FLwTO9QfwkaCiZ2qneEeFDnctM+rkwA8+lZHnYBGSeq2Z3J
 1Srwrm8LDkWJBET+FcnMcs6cxzzeX44MRFcbrSJxHWtRvo30wXaWlwG896aogSdf4LgKM
 qkkMTW2kkGMDMT8p3PfacHhAk8PSPSHe4f0pKeORAdSarOovg9kWW+sK633fP/bBH1ten
 Sg26ahQm8FvgKtk/Ogr3ioS+qqK6tT6tRtsdtd2M8w+o7b6/c9gJT/Gfo5VR8tK1iocSA
 7ookyAIEGB3FfMH161RL7mE5N2qUSW7nc0Y/UPzU22qznAcs40MQ/r4gXt1GqYlqOIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ILgDnBsv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ILgDnBsv
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B0D240087
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4015fb0b42so7774366b.2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793187218; x=1793792018;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EWkoR0DbUkYM/H7oWAJe6TxA9Pf2rEQaSQpJyJPknNk=;
 b=ILgDnBsvc/CY89l6VOrgRKQpSE8L4AxIrYtnHfa4pgI7mcir47iUu4nD4Y97FwXHcf
 0lyObQqWrPmV3vqZ/mjClScl4i2UiA50aal1Uc/tBwlclZBZTEixCELvzpGZJG6xhXAR
 NlOHG1toGwClIYTP8F2tMm/i00Qe1w8+r+n2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187218; x=1793792018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EWkoR0DbUkYM/H7oWAJe6TxA9Pf2rEQaSQpJyJPknNk=;
 b=lPnuNvqlC8LGZgrM1kAmuXGK6wVghe57uftHYd9dR/NfV3EqDhHn3ICBnwn87Cn/H/
 zF6QfHMo7Z6S8+uZMtXy7+t42oBG9NpJsvX0/4AKMKjTPNTP8V1hQqSKrJGss0RzMD6W
 H5K5fWxEdV4MoTT9T2YfP1xWeFuG0oj70L5OUdYPIzNkiCyp4ViWJu8ouXKN6wD845YH
 pfxs+8XMHaOuGHjzbJKhDxsJF22tZPVuqJpc6Sq1pP03KvSnpK8s4WSQ/gVh1Mgv68jz
 TbW15YbcE64UjeHk7Qqazfj9mSpXvbcznM1Krce99TTYsd0iPETnWWCwLQxrr2lkTCLU
 X0QQ==
X-Gm-Message-State: AFq9FYKU3A4ghaU5hcLYy8FHvTMZ5CNvAikQNFwEd6jwOmhKcGV7qL75
 Sm10zDAPql4SqwC4tWxrEunpoAREivOR0WN6dDUey4wLDQMU1rx2tlgYFMQepBrpSjqFC7+JEh8
 OnANJtio=
X-Gm-Gg: AYBFou0fBEFAVUR3JWWqMB9K+poAgYz0CrVGssgLzrYZWC60Rus6tglMVlL5GAxJd/F
 xsSo0/3re1YxdIqMKIHOHEwVtLrWRZtl2cuP8a4IqzEbcDymokPTEUi9IgwH49ACKX31oSTvV/D
 X/Qv/QO8c0nHT7I9KPfLqUDmiQmLo3LBWOciZ8dAW4MgTRxHlTkzBnC9J2Gi+8DtsEMT5PONBWo
 fH6eeTNAEANe/Y06HGYq4RVWz3a/4zRqwiphdV+8/Q5nea5VKkg/hbi+/8qeXoQ28I+Q2MdMZyn
 Ly6Mo25EqAbbrJbxEHmj8qEQOOuaF+JkBAdF+x4UWS6HCVmWHRRe1qmTg6+c2VllO2Uyo8ySsZO
 LyRKH/LhpR/VMafQpc3KfjirsEll2iRFhfQciX/J1wDCXb1XJpcUcZOlVpDhUuwMPgTbgkyQUuI
 kD5+CWXTkjSSOO8eiHd5HqlWkvC3uRDqsEY0tWIDng7I3dixVBlz+V0SC/r+ZsvqvqwkblewYTg
 r1oDgNB9Wb3XO1bt+LmPdI+mNQWa4y2eUskKVXDSSnNaUV7Eutr1HV/o3FXFZm+a1KcfuSLuzRH
 IRm80JAkrONboAn3qgPGiyuFhuUqxqV0NM7t8jBHji2Vbg5I75rUVcT0dHlqbf1s7WN/C1CeBGC
 clNe4f4lUnaNemd5RGh3eopsXc5ebK6MSKIgFlcGwiEc4GUE1Q1RhPbDxv+KBlXSsA6UnfiOvXC
 kDmYVqWv2Yy0+nm5DJiScuUrwUSPyJI/6D+p0G
X-Received: by 2002:a17:906:18e9:b0:c41:3963:6f1f with SMTP id
 a640c23a62f3a-c49bdeae450mr179043166b.4.1793187218239; 
 Wed, 28 Oct 2026 04:33:38 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6f7sm592468866b.63.2026.10.28.04.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:33:37 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:33:31 +0100
Message-ID: <20261028113331.2960539-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
References: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 6/6] package/mender-connect: depend on mender,
 drop sysvinit file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Much like the mender-update-modules package, have the mender-connect
package depend on the mender package. Also, as mender no longer supports
sysvinit, it's safe to remove S43mender-connect

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/Config.in         | 20 +++------
 package/mender-connect/S43mender-connect | 53 ------------------------
 package/mender-connect/mender-connect.mk |  5 ---
 3 files changed, 5 insertions(+), 73 deletions(-)
 delete mode 100644 package/mender-connect/S43mender-connect

diff --git a/package/mender-connect/Config.in b/package/mender-connect/Config.in
index d478e468c2..b8f3770509 100644
--- a/package/mender-connect/Config.in
+++ b/package/mender-connect/Config.in
@@ -1,15 +1,7 @@
 config BR2_PACKAGE_MENDER_CONNECT
 	bool "mender-connect"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, mender
-	depends on BR2_USE_WCHAR # libglib2 -> gettext
-	depends on BR2_USE_MMU # dbus -> fork()
-	select BR2_PACKAGE_DBUS # runtime
-	select BR2_PACKAGE_HOST_GO
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_MENDER # runtime
-	select BR2_PACKAGE_OPENSSL
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_MENDER
 	help
 	  mender-connect is a daemon responsible for handling
 	  bidirectional (websocket) communication with the Mender
@@ -27,8 +19,6 @@ config BR2_PACKAGE_MENDER_CONNECT
 
 	  https://github.com/mendersoftware/mender-connect
 
-comment "mender-connect needs a toolchain w/ threads, wchar"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "mender-connect needs mender"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_MENDER
diff --git a/package/mender-connect/S43mender-connect b/package/mender-connect/S43mender-connect
deleted file mode 100644
index 4cc21510c4..0000000000
--- a/package/mender-connect/S43mender-connect
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/sh
-DAEMON="mender-connect"
-DAEMON_PATH="/usr/bin/mender-connect"
-PIDFILE="/var/run/${DAEMON}.pid"
-
-MENDER_CONNECT_ARGS=""
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "${DAEMON}"
-	umask 077
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} \
-		-- -daemon ${DAEMON_ARGS}
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "${DAEMON}"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index ae9094f3b4..91b2c9354b 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -54,9 +54,4 @@ define MENDER_CONNECT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/mender-connect.service
 endef
 
-define MENDER_CONNECT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(MENDER_CONNECT_PKGDIR)/S43mender-connect \
-		$(TARGET_DIR)/etc/init.d/S43mender-connect
-endef
-
 $(eval $(golang-package))
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
