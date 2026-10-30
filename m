Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3693606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eygFGkAh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frKge5CC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC40C6061C;
	Fri, 30 Oct 2026 09:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zttcxUq0-EBl; Fri, 30 Oct 2026 09:16:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1E9160625
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793351762;
	b=q2GG/NsesRJdR5KHjaQTuP99S/5uh+Pds311d2zCdr8zadlFVt2dzYuats7H4gQNGKZ6
	 pMrYZRdxXfGayTnz0UtbBFpTPb+Z9UkbwK31BWEAjAc5lw65dCn36sqHEmzsC9N48OpM+
	 qvvS5xZKAlpAGIe8KyG1BqYbPD6ZU/hqt4vkmGhmGNI19YhcNZvUXoijaj91nqtW1djp8
	 N2wL3pZ01gAV/uum5IJ+AK7JzP4/uORtMDQPF4UCY4UJV+GRFFNJb7XoplT25od6yBf5/
	 8eNJrnA7ZHPHEWzxWbus6JUvDHuknKtXiXaT+cD5eWQ5mbevp+/ozbAgi4qXjq1ULcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793351762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=XedLYJp+PKrwnyrl4qrvXMceVWMv3B2ZLgVPBiKwRaw=;
	b=VTMSnehHL3Buo5yS5zoO2WOVf6vIt4K10wdt1ycXgNDtqUrtYxTJkHCwauJZfiPc3pkm
	 6ukDotA4z6L8cvgkoStjfG17OOCGhN7QkzV3dJLEqKWnGg9Q0xLk9l3DCWv/0CTTBgAFu
	 Om+U8PHM/ZJTq04D79BWR4Ax/GXt4uo9KDFwWv0Pjh8BYqH0Nmv/QdeCnGZORILE3akLm
	 kcLtoRDMy40wzqRd9aDW4plrSA3Yc18hEwKdKsnL2LU52Hzk83Qn7eDkVa0EcLyBD8hsn
	 dtuU5rvP9t+nNnKUafwktuo4eWbz7J3VzVqSYZ5J0XVmVulSe4CkE9ynmPAYJ0G8jjQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frKge5CC;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793351762;
	bh=XedLYJp+PKrwnyrl4qrvXMceVWMv3B2ZLgVPBiKwRaw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eygFGkAh2tLekmLWFS2nBK0VafTIupXfIrIS7cXemjOLEnB6drJs6Sa72IZHE5inF
	 jJNMXVDtSmme3Vl5QjpiWxYhI2hYiu8FRxqgro0Sa1UMX6TpU0Pe+vNaa7Fn4AnLg3
	 PbSrIafp3XSVy9Qc2Ochj7OIVpzErn4dqen+0oxDvoHgMnA6nbfS/ceiS9oxFyaLQJ
	 rwppGJjaWXr6das2Q14OOyES6gxOTE0H0SQLpvRv5np82i+kZtn4LgudDOaveoy4Ff
	 rzbjMGpWgi78zhKh9ICC21WEqAO9JNSt8i/IfLMpKJNs/yAAy8Y3uRG+xjJVPfw4h7
	 te9qBJJCIx65A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E9160625;
	Fri, 30 Oct 2026 09:16:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B95B2C7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6285160625
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJmU1riEXR9R for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 09:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CE1E6061C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793351752;
 b=MSgiXjSdiJwOWqRUoFEoWJmnFPr97q6X8OOKGLWV9YdRMKuDl3MUD/TCa3Q1JorEP304
 WJco7DUKkYdWk/THQbOjooYMDPGJI+t4IlW8WJU1moEmayWIlZPIUsc3SskY+vHKGRf5l
 tJNrUbS89IvxtflSNAClonhsTKpJWHMrag2zBv/I5rMecGTnHBijJ5n/9qF/ofd0U0ylL
 o/NVEPrnLUS2U5i7pOizlMAKMyYOyZyoZYgMngD3gX6HQ2I+T1Bh3D7mqqSKY9pWBPbFE
 hRdzTIYJUbGBr6heV8WjkvKbxYEf3C7S/Tzvmi7bZJ5IquOHI4Zxk/RKZAk8bccsH7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793351752;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ChgS22BwQ6PLUkQv7RqLAL8XqM+vlcv/fd8pIzJZtKY=;
 b=GIeftpS5bdpdHzvCXraCfeghfigfQn3KWQOzyW8IS3oThfNz38jPnuBfiyNsUPhu+D3f
 IYpIBef3gPYxdRFPuCcIO9C/U4/nSEl//21N5JpnfTsRYfhb56u1ttQ3q0MX41wp5xd7G
 DTb9RIlgJA4pmV2ogqaeGDBhTD12c6IKZ5ZNFGWdmLIIascfcQuyf7N6o7QXDpz+ROpqM
 d+5WDPsyRkwI38foXHHgeSXxYWwcRZJSE2Pt5447CDk/7iCuQLug8l9lBDk+Sm02Wfpm7
 2kjeaj4dE+5gF6RlZJ8wQHZQabHulxx1UxUa5FRHifB1hI7Q562Q9ZhrI+SN4pTCM5w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=frKge5CC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=frKge5CC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CE1E6061C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 09:15:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so94361f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793351750; x=1793956550; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ChgS22BwQ6PLUkQv7RqLAL8XqM+vlcv/fd8pIzJZtKY=;
 b=frKge5CCX5JjNXqfXDlMV/Zu1eUe/5/IOkZiRz2UtOqNm1zg2HNyY6+pO8LdoJ5rMo
 m4KdS6QouKkW43WKKVjQMcMa9IDSWW5qc9mjzJFIySZ1FIf+b2eki5PAt+otLIrWWO7q
 0JzNfIPfEuLT01wyqVNVuwTNfhwtPLC36Qs5l5yJTHFAL2PDni3SaRZjFV1mn6j/sXH2
 Zkv6brR4v0KRuaLVM+Kt3f9JR+GDLgY9359A3HJWajN6ss0pwv2u0n5Jp6hMcXx1jJpU
 YNUaqlZeCgQ++U6pKXVjkB8lMLjuTOihTV4qNKT87FwUHR1IWqBi+maePg8GpDSSdWxR
 Zj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793351750; x=1793956550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ChgS22BwQ6PLUkQv7RqLAL8XqM+vlcv/fd8pIzJZtKY=;
 b=h/k7XbCjYsDczaZHCroj/PlrYr+fSPSwYZlXyPIXR3ayRHykQMIfzZ16vQhYokhJLV
 Kfm5KES2I8TORe61SRF/5QPHtXkUSAwG1IKA3kNbTMx5Op7J1N5RIp+5TrMOfSVDfGpU
 kqr77hcT7/v59DulltU6uPfhmowG8YGnJencR4x4Z14NC6xYM9b9DF0R6LwUt79M2EKz
 CiDh0ajVGwHKgiwwvu5g1QGnCZ8Ze/kzQXaQrJfaAGPD+hP0+2cqyYMc3x16pXRJnNiP
 rT0qt3OAihTipOpWwjtdcRk/m2R2JirBSIz03qcg3vYw2VnpTwbA8yk9G2PGIh71Gbrb
 jTCg==
X-Gm-Message-State: AFq9FYLKRTbbSD28+UHEjInDEN+iyx3obpI1DTi/7cy3Hw+pCs14hbH8
 rWTtIb1QdCFpDweMeWFq8kpTh2vv2a/2jKUrE15v2ziWGiaTssLNA+gQv2qcgg==
X-Gm-Gg: AYBFou0zGchUij3PYXpBp0B85NCP6PpBA6U5PMjqhbQkIX717EpcCZKkC3gRPLJBzAP
 SYk+s2Q2CGLIL7YTyCUrQq0QNs8Nx8yN2T6xVHMEQAMgKtzt5dGjIUweKbv0L4Y9wEJLFt+kRHZ
 VU+dqoeSLksR7SKo9PtGYMItyWO4FhOWDiaXDLIEWSi04XhvsipZ+Y2ZUqtzDGVc0Rybd5sahMc
 X40MWM5qEa6W5pOKW8AtYbJJvKMrNe4Ls4dRLoiojjjobjnaNUBvYvC+3dbydwHSFn20Ax/++c7
 8SH8ublL62ziY5tWrwqorOSecT2Oe0FrR2tU4mvCjmJp725ktNvrBTgWYnLV3vjygW4dhLRTdPh
 rFIzSUS4dNqiFwDqrhSlyxK+76xOjsgit8MDikdGuWNy/K9+6tk/9YMNykVJh1c3o42K+5/Zb87
 2eyFb9Sp8RWL9YmGPO0AghV2Tb2GMSSszpVD7jQ9LO56nseUrBrMc9qx5V51lOEQ5S1b2xMvXsK
 J71lMMmJ1Podj6m6ldLsYt77QHIlfJvYnw7sUGGqFt4yLAMgri0ZN3vURNpWa6WSQavvuE5zx7c
 MPoru1G+t4mE2fPl8FAbhvjmNNP7woWetokGaypGON7W4AFLFnMWfg==
X-Received: by 2002:a05:6000:178f:b0:48d:f14a:9177 with SMTP id
 ffacd0b85a97d-48e6e4faeacmr3949755f8f.56.1793351749677; 
 Fri, 30 Oct 2026 02:15:49 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b7815fsm2106312f8f.22.2026.10.30.02.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:15:49 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 10:15:37 +0100
Message-Id: <20261030091538.1773417-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
References: <20250820163921.1968030-1-angelo.compagnucci@gmail.com>
 <20261030091538.1773417-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/5] package/cups-browsed: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 2.0, cups-filters has been split into several projects.
cups-browsed contains the daemon, formerly part of cups-filters, that
browses the network for remote CUPS queues and IPP network printers and
automatically creates local queues pointing to them.

The init script is copied from the cups-filters package, which will
stop installing it when bumped to version 2.x.

The CPE vendor is openprinting, as shown by CVE-2024-47176.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch: the browsing daemon and its init script moved from
    cups-filters to this new package [Thomas]
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/cups-browsed/Config.in         | 22 ++++++++++++
 package/cups-browsed/S82cups-browsed   | 48 ++++++++++++++++++++++++++
 package/cups-browsed/cups-browsed.hash |  4 +++
 package/cups-browsed/cups-browsed.mk   | 36 +++++++++++++++++++
 6 files changed, 112 insertions(+)
 create mode 100644 package/cups-browsed/Config.in
 create mode 100644 package/cups-browsed/S82cups-browsed
 create mode 100644 package/cups-browsed/cups-browsed.hash
 create mode 100644 package/cups-browsed/cups-browsed.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e133d0dbaf..3ebb6dc7ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -228,6 +228,7 @@ F:	configs/sipeed_lichee_rv*
 F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
+F:	package/cups-browsed/
 F:	package/cups-filters/
 F:	package/cutekeyboard/
 F:	package/fail2ban/
diff --git a/package/Config.in b/package/Config.in
index f7e2f8517e..c4306705d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2472,6 +2472,7 @@ endif
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
+	source "package/cups-browsed/Config.in"
 	source "package/cups-filters/Config.in"
 	source "package/cups-pk-helper/Config.in"
 	source "package/dante/Config.in"
diff --git a/package/cups-browsed/Config.in b/package/cups-browsed/Config.in
new file mode 100644
index 0000000000..4f99761324
--- /dev/null
+++ b/package/cups-browsed/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CUPS_BROWSED
+	bool "cups-browsed"
+	depends on BR2_USE_MMU # libcupsfilters, libppd, libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libcupsfilters, libppd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libcupsfilters, libppd, libglib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libppd
+	depends on BR2_USE_WCHAR # libglib2
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_LIBCUPSFILTERS
+	select BR2_PACKAGE_LIBPPD
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  cups-browsed is a helper daemon to browse the network for
+	  remote CUPS queues and IPP network printers and
+	  automatically create local queues pointing to them.
+
+	  https://github.com/OpenPrinting/cups-browsed
+
+comment "cups-browsed needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/cups-browsed/S82cups-browsed b/package/cups-browsed/S82cups-browsed
new file mode 100644
index 0000000000..f17bbe7465
--- /dev/null
+++ b/package/cups-browsed/S82cups-browsed
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+DAEMON="cups-browsed"
+PIDFILE="/var/run/$DAEMON.pid"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- -c /etc/cups/cups-browsed.conf
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/cups-browsed/cups-browsed.hash b/package/cups-browsed/cups-browsed.hash
new file mode 100644
index 0000000000..c5fc06ef3e
--- /dev/null
+++ b/package/cups-browsed/cups-browsed.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  d185169a74e6a5731b6bd74cba8d269f34e5c71cb71ef1841f2fa91637ba1d58  cups-browsed-2.1.1.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  88cc7e80cd02c9ace9c9296c1f5328151589db7abb504d638aba85c2f85e37b2  NOTICE
diff --git a/package/cups-browsed/cups-browsed.mk b/package/cups-browsed/cups-browsed.mk
new file mode 100644
index 0000000000..6a481c54a2
--- /dev/null
+++ b/package/cups-browsed/cups-browsed.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# cups-browsed
+#
+################################################################################
+
+CUPS_BROWSED_VERSION = 2.1.1
+CUPS_BROWSED_SOURCE = cups-browsed-$(CUPS_BROWSED_VERSION).tar.xz
+CUPS_BROWSED_SITE = https://github.com/OpenPrinting/cups-browsed/releases/download/$(CUPS_BROWSED_VERSION)
+CUPS_BROWSED_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
+CUPS_BROWSED_LICENSE_FILES = LICENSE NOTICE
+CUPS_BROWSED_CPE_ID_VENDOR = openprinting
+CUPS_BROWSED_DEPENDENCIES = host-pkgconf cups libcupsfilters libppd libglib2
+
+CUPS_BROWSED_CONF_OPTS = \
+	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
+	--without-rcdir
+
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
+CUPS_BROWSED_CONF_OPTS += --enable-avahi
+CUPS_BROWSED_DEPENDENCIES += avahi
+else
+CUPS_BROWSED_CONF_OPTS += --disable-avahi
+endif
+
+define CUPS_BROWSED_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/cups-browsed/S82cups-browsed \
+		$(TARGET_DIR)/etc/init.d/S82cups-browsed
+endef
+
+define CUPS_BROWSED_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/daemon/cups-browsed.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/cups-browsed.service
+endef
+
+$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
