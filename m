Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940C606A335
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hjm7Fnm4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1jRpd0M
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C17140514;
	Wed,  4 Nov 2026 14:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTKkY4jbPKJm; Wed,  4 Nov 2026 14:09:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0397F40517
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793801389;
	b=E+WGJOXMh9Zgi/ITcFAeUXuwKC4JleDHMpEi1wOAXZGUaBCBYMrfhpIBTN86QbY0CLYz
	 X8e0XMigYQ+08EyT08PSlh3vnhL7XTv4wPScVMEZMK+evpe3djmnj3T0xq7sQy70pbnfq
	 RAsDs4fF0E678w2QeB3Z9YyIhSEUag6wMBwWc4X5lbwTi3/IfiMg8vsK0SdMj9+rc2+vo
	 /q1NaqB2pKYUFexKZVq7ZD3V4+I036D+5SOtZOXvuOJBlqR1RZuAQFQN9EneUU6MEXvMs
	 vEpPFezFqFvgH5hwBn7yqqOVdbRInjPAejnBiuzzUi/zwI3lfFE9fl3BtXpLq+NSKCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793801389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QDACf5bowecFgqmo+UhrqzqHtvaapTBQmw3gOFVjwm4=;
	b=ck/kTfZOWoCaK4yUAJo/VfxmUWbwUpz2Li0wripd3Qk+T0nIN4DOvEF0MiqkFKocjHUR
	 vU6aEB+gtmXpWmG86la2ckeLqiOPAOA7HQE73jQHZgf/obR1hgohJrAYCfmwrdH64mRb/
	 8XI6PxZB8doVUjiQ2rp73hPe/T2EcQrURKrphp6yiSFGRU0MBfO2bEagEvtv4h3PRKgXY
	 kifdIeNdmXA6w/39a8Zvpyp4yNsMmHwxTAW9zOecGTHaxcf0QsOTPg9m9o3eBixEeQAY7
	 dVHLejcGuZv5ZMTR8lRDYQDDVpJtpufjX08k2hwzQ+kJRkH9X6csv/J+CJvopC4hXmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1jRpd0M;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793801389;
	bh=QDACf5bowecFgqmo+UhrqzqHtvaapTBQmw3gOFVjwm4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hjm7Fnm4oghTZjbDTJisHL/KPUuSg+78yFfkDClmf8PQwAYEXoalthjGqdjgawIeF
	 OKmO2ZxZhSYC26OE9/ZySCsFccttO9GhCVt6MrjFXFJFfuccvG1jAKe6L203zt0O8I
	 x3AiinA9Phk3EhC4KzN9ty6uDER0XqRXr62kJHgENWga2sfhFdl2Jk4j7ssFiB20cQ
	 M+Po5G7vsJ1Jk6abz2Sv9U39ZpLgxih6D+1m5OgWmZGkFpa/dRNZjtiLqZuIgCiXVq
	 lZQRVDDz5yghBgYPLCdpuwLOdr9WHqXaRMOJXWvIqTCBzgcvUWrjJ3Zs89pDouMvj+
	 AP1Jvlx/9btLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0397F40517;
	Wed,  4 Nov 2026 14:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D5FF2B6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F68E40517
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgGj5xuWFxaB for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 14:09:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CB23740514
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793801387;
 b=OYyha6bqXQfclgEUr+/84uZpMprlMnMTqsH8vY7lUR2dZdbfCDCtVOsmmQaFfzuV1f0w
 mn15O9rK6wh7FZJb29w7G25n6IONrJkgR4thpfY3YKQV1cnqrkbU56fvYlA5ekV8pLZ8l
 PWS1yBlb5Pwl5kx66HDaLciJbu27D+1lA/eh7EgJDD0XbjmBTRcN9yWFi8zqtx8fmFLHH
 woPubBC5SDMBqS2tp2Mnk0f+BoCI6Fv0065CEVMp0+B9J96MKCEPxVHhxhpquU9kLY1mB
 4M05S2HN/9IK0gIrX7w81QseokDmbCMac/tY5tPnnsoiNkz40o9dCaMfrZWMxpJZy7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793801387;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3QXk4oV/ickJ7maiMkA9vBY1s1yYBJYwvlYwef6QhOs=;
 b=bEp1Wne5uTqAGGztuyMZAqyhp6YoM6wldZDqOcBeDYxjulqVaJRbQQnm17POaRGra2Cz
 reMvMm2zdP3HYgvOjXtTKKYz8TapPn/RaRaBIRbjoH2Dzj7l13w1YppnlHZRgqL/40rbz
 L/5akOtRslXqierFSa+/HdJ3+ltmzXwvkUhzJR96R3KlK4aWo/Tz2UOTmwAmRrk8P7X0E
 dFIdmYAJ5VY2/uppeQ9yWl8i8UkuiC/+68afe2akUIYZkhJGcqoU/JoqD6/Qhq4WWKIYi
 UEvOUKkRUDz2zxxg3hD19jTFReWnILOGMYYkJSPOy8Qn7QJLP4TTffThvbh0cCDJSlw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=I1jRpd0M; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=I1jRpd0M
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB23740514
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:09:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so6860955e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 06:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793801384; x=1794406184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3QXk4oV/ickJ7maiMkA9vBY1s1yYBJYwvlYwef6QhOs=;
 b=I1jRpd0MSfw0SenhcYg6iWB+VtDFXb9xS3wolSGwmQMIQ4pn89FkfbFcP+spOKTIdX
 vitnZnirIvZypFl2MtQKO2oIQWE4yUkfEjrF59IHNacchEhku7PDLTzJKJkd8JaZF0tH
 vUpt0TX9UqVUJ6G7wbiCAZ5wE/VsYn+Oka2aEO4gESFTzqvLbxqK7udYTB40ydg2QVs+
 UfpcTlA8CSbOxfaggphWN2XqlVLIcJth/13qPVARReE2p9+fyZkSWXIWiMkOnt2glTt0
 nWouKxsE/xevmuzWGT0evLL5J9+6vpee6I5ik1HdCqGWrR8Oaq4U1jhJyz/O55zDRrl2
 B8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793801384; x=1794406184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3QXk4oV/ickJ7maiMkA9vBY1s1yYBJYwvlYwef6QhOs=;
 b=teftxlO/UZ9NdZur0hX3Zph0EUyjcIdtku2ik5ysM7NPBlyxdzYZN44POTjIkDUsWe
 8RuVF1JgDLrnOeSs5Hay/wHKNfnNth9r2L8mlNx1jV7lZdEHQJiFe190P2QnTgc7R3L5
 0Or0FZmAEO8FBqxsd2PLmYpats351dpw4QhD97gQ+sderXmFsBTUKn91xws4B/EXEPVm
 Acp4T79QtjnYe6sON9D1fa1tth3bUNlBrzCmKU86FXrzqr+rqeyPePyg2yV90sV5uv2N
 vMXD1fxA9aH+341UyqyZmas35n806F1GUy8JUP9zhHeV9f/4CmzOPSuxS6deIppMzvAu
 KfbA==
X-Gm-Message-State: APuU4Z+18aKQXloATKIErX+4RXrSF/7j/QkeGsEHvBo9iIc1RkzKInw6
 5bKTvGCjuQpNb8R0mkWxSBaFRjWvArQyZKU53gk/OL3iYEG/GmBMf9rO+BJSCg==
X-Gm-Gg: AYBFou01yL99tQ8hO+pFKAEFigwjmLihIHup/oWu1/7uCLOeci9tbQvhx5xzrqvYkrG
 fo1ADUogprqcG36gZmXJZMFGVU2qD3AHMZuo6StKgTA5q5jHZeKR8sgkzNKVTQMWrc1VX85/Xan
 jKt0BEG5Cjga7LCxGsfyiLyxNBJcmKXiSkKhdik6XqPDEFK7HaMFlD3KZJTiV2OB/3DDvo89YIW
 kV9OZlSq+1dhgnTdlOEPYlFqOv/A8GuVYOXGldWgw/BJQmIqjomTQhDu+u9WISh+uQL6ALSB8U+
 8QlGGa4Gq0GkpHG3yHwMdY//vC/tkiZ2qwUOx3Or0OfS7JJS8Po/Ppe04hXbXFKlPcOqVg0GPmV
 M20aWjp2cTK4GhN472leroQ3eQFDEfpDU/hNNA1iyH1I3s9kWp/YJf70l76TVgf3Ja9afPGKg+3
 tKNdOAmSNP/rCrJng9s++vwYM3yy6SIX2iv+GDCgdbMFyBp7/VQjuNoexq0u3lkHPSWaNdUesG8
 roQsIvgWSfpqOgSuO0R+ih/i82JRHR5aQrOj80KgkGSn3sJumVyQ/7LfXxQCil362o9ZPt5xX+L
 oQXjmlj4bhMZSraLaHdjJG+V+2b6juJwqh+1TNKtrY/ixht1XOqLbQ==
X-Received: by 2002:a05:600c:a00a:b0:4a2:190f:cf6a with SMTP id
 5b1f17b1804b1-4ac19802310mr371352475e9.35.1793801383765; 
 Wed, 04 Nov 2026 06:09:43 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2aa953d35sm145523125e9.9.2026.11.04.06.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 06:09:43 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 15:09:40 +0100
Message-Id: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/httpdate: new package
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

httpdate synchronizes the system time using the Date header of HTTP and
HTTPS servers, which is useful on networks where NTP is blocked but web
access is permitted. It is the successor of htpdate, from the same
author: it delegates the network transport (HTTP, HTTPS, HTTP/2,
proxies) to libcurl, and estimates the time from several servers.

Like the htpdate package, add a SysV init script and a systemd unit,
running httpdate with the arguments of HTTPDATE_ARGS, that can be
overridden in /etc/default/httpdate. As httpdate does not write a
pidfile, it runs in the foreground (-F), and start-stop-daemon
backgrounds it and writes the pidfile.

https://github.com/twekkel/httpdate

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                        |  1 +
 package/Config.in                 |  1 +
 package/httpdate/Config.in        | 11 +++++++
 package/httpdate/S43httpdate      | 55 +++++++++++++++++++++++++++++++
 package/httpdate/httpdate.hash    |  3 ++
 package/httpdate/httpdate.mk      | 33 +++++++++++++++++++
 package/httpdate/httpdate.service | 12 +++++++
 7 files changed, 116 insertions(+)
 create mode 100644 package/httpdate/Config.in
 create mode 100644 package/httpdate/S43httpdate
 create mode 100644 package/httpdate/httpdate.hash
 create mode 100644 package/httpdate/httpdate.mk
 create mode 100644 package/httpdate/httpdate.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9dd41f01..21b5700dc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -234,6 +234,7 @@ F:	package/fail2ban/
 F:	package/grep/
 F:	package/gtkiostream/
 F:	package/htpdate/
+F:	package/httpdate/
 F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
diff --git a/package/Config.in b/package/Config.in
index 32fc1496c9..089860e7ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2509,6 +2509,7 @@ endif
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/htpdate/Config.in"
+	source "package/httpdate/Config.in"
 	source "package/httping/Config.in"
 	source "package/i2pd/Config.in"
 	source "package/iana-assignments/Config.in"
diff --git a/package/httpdate/Config.in b/package/httpdate/Config.in
new file mode 100644
index 0000000000..8d3f2c7bef
--- /dev/null
+++ b/package/httpdate/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HTTPDATE
+	bool "httpdate"
+	depends on BR2_USE_MMU # daemon()
+	select BR2_PACKAGE_LIBCURL
+	help
+	  httpdate synchronizes the system time using the Date header
+	  of HTTP and HTTPS servers, which is useful on networks where
+	  NTP is blocked but web access is permitted. It is the
+	  successor of htpdate.
+
+	  https://github.com/twekkel/httpdate
diff --git a/package/httpdate/S43httpdate b/package/httpdate/S43httpdate
new file mode 100644
index 0000000000..aff7a00eb9
--- /dev/null
+++ b/package/httpdate/S43httpdate
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+DAEMON="httpdate"
+PIDFILE="/var/run/$DAEMON.pid"
+
+HTTPDATE_ARGS="-s https://www.google.com"
+
+# shellcheck source=/dev/null
+test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# httpdate does not write a pidfile, so run it in the foreground
+	# and let start-stop-daemon background it and write it.
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- -F $HTTPDATE_ARGS
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
diff --git a/package/httpdate/httpdate.hash b/package/httpdate/httpdate.hash
new file mode 100644
index 0000000000..31c6d80868
--- /dev/null
+++ b/package/httpdate/httpdate.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c7a13e693de32e48fc374f36598390eece04e4c26f21b1e7d67cdc680d60236b  httpdate-1.0.1.tar.gz
+sha256  cb7177d68741cb08ed1fade01b9f9cc7d1c56c0e96f3f6ab86f5b455cf99e44f  LICENSE
diff --git a/package/httpdate/httpdate.mk b/package/httpdate/httpdate.mk
new file mode 100644
index 0000000000..6a21f0fccc
--- /dev/null
+++ b/package/httpdate/httpdate.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# httpdate
+#
+################################################################################
+
+HTTPDATE_VERSION = 1.0.1
+HTTPDATE_SITE = $(call github,twekkel,httpdate,v$(HTTPDATE_VERSION))
+HTTPDATE_LICENSE = GPL-2.0+
+HTTPDATE_LICENSE_FILES = LICENSE
+HTTPDATE_DEPENDENCIES = host-pkgconf libcurl
+
+define HTTPDATE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libcurl` -lm"
+endef
+
+define HTTPDATE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
+
+define HTTPDATE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/httpdate/S43httpdate \
+		$(TARGET_DIR)/etc/init.d/S43httpdate
+endef
+
+define HTTPDATE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/httpdate/httpdate.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/httpdate.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/httpdate/httpdate.service b/package/httpdate/httpdate.service
new file mode 100644
index 0000000000..adce46d929
--- /dev/null
+++ b/package/httpdate/httpdate.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=httpdate daemon
+After=network.target
+
+[Service]
+Type=simple
+Environment=HTTPDATE_ARGS="-s https://www.google.com"
+EnvironmentFile=-/etc/default/httpdate
+ExecStart=/usr/bin/httpdate -F $HTTPDATE_ARGS
+
+[Install]
+WantedBy=multi-user.target
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
