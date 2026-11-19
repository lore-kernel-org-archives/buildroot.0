Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D124606A32A
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ltQanDsv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNz2jsvp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A58781282;
	Thu, 19 Nov 2026 09:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHL9haSZLFOx; Thu, 19 Nov 2026 09:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1DBED81283
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082204;
	b=bhpLC/L/iays8oIebVEqt6D3xWVEbZatB88VOj96og/TRj9iVNJ5DSv34UzHP6hD8E94
	 qRoa9ClhdOhsFa3Acs2doI9ikpKZOeDEv8VD/niUomppoczZuFscK4Dou17CIvjwVyH04
	 vTdy6TKqazCF1Q5B7Ziz9U8mYgLYOkGLX+09msTh+8LUUjRu+ojI8oPg5/DuMtxH26QlO
	 lFIdcm/NRX6eJRDUwDYdf9rEbxs2sbAHmR8jvsRtzAK3LeF1WllFbXCAxQpEGM918jSGT
	 OYb2Y2SKxmbS54S8/IQAVMQBpX2iiCFCllwZDUJc2pyYj51k6lxNRzxaLwMYJqjfPXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=bg7NBgNTTAzpVnOy+/pvHZ6ABo//WQc/A0pkHqxYfE8=;
	b=r0cYsM+gBL369hCdvdJQzFZQJdWdqXHgWYOuk8F0zWTKbbAVR22yDruX32DJeJ3xxn/A
	 ufYSRSpJDe9EIcGeTn8xTGVFzeNBPPA63zdyKtUMRfT6G2AZ7TtpM5uzazCQd2qCkcDa+
	 LCZdlKFen3jtzrK8T1Ul0A6RtOluSOaHW8v7s9RHZUyBcZZmR6ZQWQnnGGHNrK48oIvI6
	 f06cqviac1RDqSDIcJEjWlIIdf7wkNajCLdpei80G/ulpjUgJec+9cZ3m3PYfSKUZYCfb
	 cMJ3CumQaROCNAGMUNRC1R1dV/U19y0h18MpRaKVHbjN0N9Z3Lq0rTo8nhdDQ1ee+lg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082204;
	bh=bg7NBgNTTAzpVnOy+/pvHZ6ABo//WQc/A0pkHqxYfE8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ltQanDsvHoUGHYwOARl9kIg9O/O8AbxZH+zzVvT9nrgQR68zcWPdqy55QZpJ1jSlN
	 wdeb3yeDy0nl+jZmqNzmuwul4p4r7sWJ19Ugx12Y04PodC+3fodY+sK4ZbfkTcBO55
	 4fyt/6AkRxz92hPMnz2R3gzZZ/Nas22YZc77aIhWIlGgdZYiRyU4OWjwJUOB0GueFI
	 IqKMS1AxVsREMUp7PxKMOzil8rOBLq/KWx/9ccFew/z3g0JMNvGAI1CFLBHIxkkNFr
	 pN50K6Yo++Xrfj4taNlGhmLFAo1iH3pPCF4ru++EMwllDNBNrgEd3dxwmPvL3m4iEd
	 tf+lO/w0MO9DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBED81283;
	Thu, 19 Nov 2026 09:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE2A1C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0065409D2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNwDsSnd16V3 for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0BA7409AD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=uNz2jsvp
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0BA7409AD
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4a5506f09f5so1282752f8f.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082196; x=1795686996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xsjz8hwPVvcbnf5tbF8ypcrMPsRn+FKM1QCPlCXkcF0=;
 b=uNz2jsvp2an6V/x1VnFqprca7df+hia8XjezWPHAhRYoCv28+E89Wh8WvZpVqaiiT6
 O68COKrQQy6njevug0YPdIYr011CwiVD0NsG9hdskwqg4JZ2SGZbpDULs/ihYZi3TvCd
 lO6bRBny8FLhYFITfjtnJKwBBxczd/P/oZjOSVttZ3kOm7BTduZtEaE0SvCol7KdRdAZ
 F+FJc+HeYul4ICWAk7iSzmFSH1PsPjGkZth69IsybYUj7N5o6w8yqbCbEENjRLLz6spK
 uJw4czEvEtZBUwcORmJ9B18LOhBRRKhqQq6f4m9Tst4CXmsggGxEY8aoyaluYyVo3HC+
 K9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082196; x=1795686996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xsjz8hwPVvcbnf5tbF8ypcrMPsRn+FKM1QCPlCXkcF0=;
 b=BUH1fNzW65HfWNK3hFQYfb4CpjT3uAtZSgB7VjPBplqWowtuvm7zGQWmMITzeQH1xO
 lWHtOXkGYyUhmC5+DsWt9qW2NvVL5C92LoiHrY7MbMkiklEdEfdvK2sdg7Fm08ghCtvX
 4u71v+jWPbg4p8UMOy0eP0aXqvC4sjVToaV42YfKRSiErXxZqgkVM/r+SCGd1iWrLqIQ
 4dQ0OK2qNDMoUqFTX+rjsOf/Dd2pDx48l2yGbnx5q4qH5eeAsYC0AsbQDrHD0GbXDwlX
 oWn3UneByCHv+vDQN6uFGekQU20VzAr29MLWSXLDahDNdgffYiZgDPrfnpU171njB08J
 AKbA==
X-Gm-Message-State: APuU4Z9lTjnJDaj2vRZfeL3YqI9KAPTz6O9uyBSJ21tWdbeNN3fKZuwg
 c7OOofyLEnTYKtT8L91ydY+VSqNg4MEHo4pawQ26GRMAK25Ou95v7PsNPFIWrg==
X-Gm-Gg: AZFdTZeH+6POIzHmbvz17hOi778hCWO87QGjJ2P6qcHFcOZ1xm2mcvnXwkrbsa+spqI
 jlv8MQc5hHav5DHoZ9/HXSl41ZN8oQ9AB4H8SEmy3L8AWfZMBiLJQtL31DLmRigjS+byJ3d7mc9
 1IYPxYHU7qJglW/XMqyBYmZ6W4TBHTkhmVjKub9ecx6KAEO5U64P9Di9taZt74x1XZ5SP9a/3gz
 c1G1ivqYoET5C1iq9rfWiiWgGBQ8Atj7E1UPBkJPRu3uqdJtXhPlB0kXxmXSKW/6iSBeO3SZk0o
 0d8TDI6Knh+q9aPmqk2ouHv7uqA8106a1nBw9i7JwKTnd9OqZFjiAGSmw8qtOBOYKKWz+nAUOHU
 gGZbi+dnMCnLgqUZeSCvkjxOQXB1i/rgyKQ7kGQfI2WFk8bwuHGRwQm6vanEsY+sAx0DDSp1kCQ
 OFymzegYGaJtHFzDkDkhGUaoRZfZDEr/NpIHAf296k4QS2i3FACQBg0sWef5N8tyxKvXDDXct8P
 SLbd2+NcR2/a6sG+gxrlXsNdOzpOC0I8jkMRw1XG3PB03sQfIZZfeyP2u+k06iAcfMxqkTPhFFw
 CCpjWuWTwS1nLYhEAf+nJ29ov7wpHOkywkXyEgZOlt/71fdraySIKVfCVTO5b1qe6sPvXiecs/k
 hh5hUETGPZpc82LIDO9ZzFtDCM8tSsowXcP97zsWA
X-Received: by 2002:a05:6000:4556:b0:4a2:ffaa:c218 with SMTP id
 ffacd0b85a97d-4a638ae25c8mr7432942f8f.22.1795082195942; 
 Thu, 19 Nov 2026 01:56:35 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:35 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:28 +0100
Message-ID: <20261119095629.1990220-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
 <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/6] package/python-web2py: rework the init
 script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rework S51web2py on the model of the other init scripts:

- set DAEMON and PIDFILE, and read /etc/default/web2py, which can
  change WEB2PY_ARGS;
- web2py.py is a python script, so the process is python. Start it as
  "/usr/bin/python3 web2py.py", and give the same --exec on stop, so
  that start-stop-daemon finds the process: a second start no longer
  starts a second server, and stop really waits for the process;
- fix the shellcheck warnings, and remove the file from
  .checkpackageignore.

Also use --no_gui instead of --nogui, which web2py 3.4.1 deprecates, in
the init script and in the systemd unit.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch

 .checkpackageignore                  |  1 -
 package/python-web2py/S51web2py      | 75 ++++++++++++++++++++--------
 package/python-web2py/web2py.service |  2 +-
 3 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db54..06f308174e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -738,7 +738,6 @@ package/python-pyzmq/0001-detect.py-fix-the-ZMQ-version-check-to-the-ZMQ-versi.p
 package/python-scipy/0001-build-sh4-FE.patch lib_patch.Upstream
 package/python-setuptools/0001-add-executable.patch lib_patch.Upstream
 package/python-sip/0001-remove-join-from-sip-h-files-string.patch lib_patch.Upstream
-package/python-web2py/S51web2py Shellcheck lib_sysv.Variables
 package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.patch lib_patch.Upstream
 package/qextserialport/0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch lib_patch.Upstream
 package/qt5/qt5base/0001-qtbase-Fix-build-error-when-using-EGL.patch lib_patch.Upstream
diff --git a/package/python-web2py/S51web2py b/package/python-web2py/S51web2py
index 11fe912afb..f0a16dc23f 100644
--- a/package/python-web2py/S51web2py
+++ b/package/python-web2py/S51web2py
@@ -1,25 +1,60 @@
 #!/bin/sh
 
+DAEMON="web2py"
+PIDFILE="/var/run/$DAEMON.pid"
+
+# "<recycle>" keeps the admin password set at build time.
+WEB2PY_ARGS="--no_gui -a <recycle> -i 0.0.0.0 -p 8000"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# web2py.py is a python script, so the process to look for is python.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --chuid www-data \
+		--exec /usr/bin/python3 -- /var/www/web2py/web2py.py $WEB2PY_ARGS
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
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec /usr/bin/python3
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec /usr/bin/python3; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
 case "$1" in
-	start)
-		printf "Starting web2py: "
-		start-stop-daemon -S -q -m -p /run/web2py.pid \
-			-c www-data \
-			-b -x /var/www/web2py/web2py.py \
-			-- --nogui -a '<recycle>' -i 0.0.0.0 -p 8000
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	stop)
-		printf "Stopping web2py: "
-		start-stop-daemon -K -q -p /run/web2py.pid
-		[ $? = 0 ] && echo "OK" || echo "FAIL"
-		;;
-	restart)
-		"$0" stop
-		sleep 1
-		"$0" start
-		;;
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
-		;;
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
diff --git a/package/python-web2py/web2py.service b/package/python-web2py/web2py.service
index 0274bd8c53..dcf083d3ea 100644
--- a/package/python-web2py/web2py.service
+++ b/package/python-web2py/web2py.service
@@ -4,7 +4,7 @@ After=network.target
 
 [Service]
 Type=simple
-ExecStart=/var/www/web2py/web2py.py --nogui -a '<recycle>' -i 0.0.0.0 -p 8000
+ExecStart=/var/www/web2py/web2py.py --no_gui -a '<recycle>' -i 0.0.0.0 -p 8000
 User=www-data
 
 [Install]
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
