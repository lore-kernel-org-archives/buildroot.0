Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C55C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57C240B4F;
	Wed, 31 Jul 2024 18:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VmmkYyJrxS6; Wed, 31 Jul 2024 18:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9716040B53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9716040B53;
	Wed, 31 Jul 2024 18:14:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 205F81BF44A
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22565409F7
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 18:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrn_zo_5dt0P for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 18:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66AF840B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66AF840B53
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66AF840B53
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 18:14:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.187]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1smIhb3xRI-00InLt; Wed, 31
 Jul 2024 20:14:00 +0200
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 20:13:34 +0200
Message-ID: <20240731181334.3717996-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731181334.3717996-1-fiona.klute@gmx.de>
References: <20240731181334.3717996-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q6JcsKIaKE2vUOm6RMonXrLojtgvs/17/O11TyGFyHAjPuaNoOq
 ZiJh8EjEDsJ7eoXGB4zTpg/0PWYo1LiMgb0R842/3pSFwSP7pHlGRT6hCjNHot5/LU8Av3L
 oD5R/t1Kx1BF2rtAswNlw7/cwPcnt3ks1Jkp72/Cvks/Uxe8vNUYoX/KHWXiTejZ/3fsRLi
 Tpl+gv1ZBLLLlmC5vndzw==
UI-OutboundReport: notjunk:1;M01:P0:uluFrZ8uyMQ=;5gevu8KKIXt29FhvHlspkKCkd+E
 eXjTIXoSNfMO2a5gU9cNGeEljqPCb4OnFmhRkF5LHx0xLKHpzpxhBXNd5AEBtK59a/nTRHQKY
 Z9XPRRf/F0fUTDqlbRKybVqSQoq63dibaQs0z0ymGobchxS1UMuxXxw/kCIqNpR4t5B7rPGaT
 u7VHJuVAAHPtXWqKk4HitYRtSkpcq75SxNRufdGH3LUNhX6E3FVpPqeKLm3bRx60jel3wVJGo
 EwlPztId9cwiPENaJDZ4Q4/0jQ646paK44Ltqhri4LmbtGFwnzQjPR6i/EjRcrQh2S2h0DHE7
 +sEikR4jfvFoQwNjulavUj0w7MalwPhAqI8FxabxL4E3SXXWGp+XA8faG+Xf8tXrGDOYrSbLH
 5rpz4YotnXZ+04kvQ9dDOEGa8jVj05Mpw3fb/Gr1DY//IOYFQXPWdeWzLlZawJk+OytzMgYMN
 Sd6918nx5ghBTShd1qG8xB7bq3EotoN6DFfyan98p9aIrV5ukegUgdM9EF0++yXph9UGiy6p7
 dr3yCEoutD10WssMy6zD0/Gac6pEJkH831KXgKUbIvdQYcvbHfJH6BMi1hYv2lcDfj6WgwLrq
 L/vjntqT4/2BeeCOPsk/CQO8D0/mf1mj9IhjIsNYPK9JUrmKjJjmMChHPkvUtFwXNVzbP46DQ
 0IFP/IkFvu58UBhcIe1ENOv5L/JHmeI2xdHoyjXW9EqU+oI8/atmFcoZbKnA0dyjSfUHP5rzM
 jP5DQbBgGw/B+xLoPjYzkVRL9w22IZr1+aFg0LJQV90gd068P3ZRWYjckCdHPNnOMO6p4ryJV
 LRI2i/MFzRlybXWb9Sdloqyg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722449640; x=1723054440; i=fiona.klute@gmx.de;
 bh=M7Vu/hSfA48JgjRYuckV+u9M0GzHuzANrARtHcKdpm8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PcUh9TQsWCnIhYe4my8yCII/5WWIE+NXd18YnUQ1eHVx+QeuXJ2oz3PNzk75Gbuq
 2IFGBDN4KdQ9VhdvQL8n/tg2jcZENmETr0IIzvwvOHF7wBClzdTkFcYZFrUfRnglR
 0epb97C1Z5rWXjIY2CwZNbqHQcxVF+Xh4MKnLDawikqV+neZbPKmSeBHkLdijZjWw
 E7fw/uG+fJ/hrxvW2yalKsfBDY4xAfEoge5qphvYtrd3Dbz0POUQYbLV1fTfgqlTs
 pllI16bT6bKW4NkuGMDtwEVJxgx1VKe+RI9B1U0lMoWDqkarh58otbd4tlSS958jX
 M43JyQNBLEVgWBRuIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PcUh9TQs
Subject: [Buildroot] [PATCH v2 2/2] package/docker-engine: add wrapper
 script for logging to syslog
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Dockerd logs only to stdout/stderr [1], which is lost with
--background. The upstream SysV init script [2] logs to a file by
passing --no-close to start-stop-daemon and redirecting the output,
but that option is not supported by Busybox' start-stop-daemon.

The wrapper script added with this commit captures the output of
dockerd (or whatever other command it is given) and forwards each line
to syslog.

[1] https://github.com/moby/moby/discussions/48260
[2] https://github.com/moby/moby/blob/50c3d19179e69f9e7ff01f688c4dbf32c5129ced/contrib/init/sysvinit-debian/docker

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* slightly clarify comment about wrapper in init script

 package/docker-engine/S60dockerd                | 8 ++++++--
 package/docker-engine/docker-engine.mk          | 2 ++
 package/docker-engine/dockerd-syslog-wrapper.sh | 4 ++++
 3 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 package/docker-engine/dockerd-syslog-wrapper.sh

diff --git a/package/docker-engine/S60dockerd b/package/docker-engine/S60dockerd
index aab50d84d4..dda6dc7474 100644
--- a/package/docker-engine/S60dockerd
+++ b/package/docker-engine/S60dockerd
@@ -10,10 +10,14 @@ DOCKERD_ARGS=""

 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# Dockerd logs only to stdout/stderr, which is lost with
+	# --background. The wrapper script runs the given command
+	# (after "--", including dockerd) and forwards stdout/stderr
+	# to syslog.
 	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
 	start-stop-daemon --start --background --pidfile "$PIDFILE" \
-		--exec "/usr/bin/$DAEMON" \
-		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
+		--exec /usr/libexec/dockerd-syslog-wrapper.sh \
+		-- "/usr/bin/$DAEMON" --pidfile "$PIDFILE" $DOCKERD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c7c51c5ef5..268b851520 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -72,6 +72,8 @@ endef
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/docker-engine/S60dockerd \
 		$(TARGET_DIR)/etc/init.d/S60dockerd
+	$(INSTALL) -D -m 755 package/docker-engine/dockerd-syslog-wrapper.sh \
+		$(TARGET_DIR)/usr/libexec/dockerd-syslog-wrapper.sh
 endef

 define DOCKER_ENGINE_USERS
diff --git a/package/docker-engine/dockerd-syslog-wrapper.sh b/package/docker-engine/dockerd-syslog-wrapper.sh
new file mode 100644
index 0000000000..3d6a80a739
--- /dev/null
+++ b/package/docker-engine/dockerd-syslog-wrapper.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+"${@}" 2>&1 | while read -r LINE; do
+	logger -t "$(basename "${1}")" "$LINE";
+done
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
