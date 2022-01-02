Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14774C433EF
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63A8740010;
	Sun,  2 Jan 2022 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9lA_T2mX8jA; Sun,  2 Jan 2022 20:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 439B740223;
	Sun,  2 Jan 2022 20:04:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5184D1BF3E8
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 20:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B1AD60AB1
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 20:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCo4NCtSymmt for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 20:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A158600C9
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 20:04:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i22so66227884wrb.13
 for <buildroot@buildroot.org>; Sun, 02 Jan 2022 12:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1gHvsoMvhFSGuhUf1+/bYw5yvyIBT9y42wt74cOjKw=;
 b=K7qiYrxX7KMA8gofZGhFrxcsCEy/j/t3CWRJWZ5J9DOIeie9qz9gwbHqgDxRnp+amr
 y6guypSYv91ShkyQRPYWg56GRF6A93iZZtaAcsECexjpHgPiZlkxExwMbYJc8NniDX3c
 RbbP2NaFla0hHzySl5hL9lUL71AcDNDp+MS5QGIBGnPf35DMf0glCZ5VpXkp4oFuq/vO
 21quwx/JyT9yeOvEP6j/rmpaY56UJITIB6si/96shc9vqFr9QwYxSQbpjyYCGDUhZbLL
 qEvk/kP51c1bG7D10nKrtI0CUekcziUGDwUWt3eJQCOtDGPba0MaYiEWdqkLtFaKT63s
 w7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J1gHvsoMvhFSGuhUf1+/bYw5yvyIBT9y42wt74cOjKw=;
 b=XVFczi4aCGj314MNbUqT1Mu5+hJXQeda+0lqauleu4Y30gr47CK5ZQkwPHPmdDo7Mb
 TynzR16AqpX6LneYoLQiTcEqPmbtoi36ccPihYQMFRv6a+l6kMVxDmA9JD8KCKWHL4tl
 aCagSj9mkB6hg6bmR4mA7rd3sGyHhdbt/NYLiDoJeeO3yYwXnNpFf0gA839QSq4oTE+T
 DS5sV+m9zFOTmiFvg+SHYZ9KvSSGp22nOvD0sIAiy829fTe+q+Kvp06ceD/y1Rxf9DXG
 TWDiRpZYbnLocADJ7X78/akxy93RnG8RVpkPReJrwQB8YieiDrAeNuPFL0PMOMnFMCua
 EEpQ==
X-Gm-Message-State: AOAM5339R/tperLdbcNiAKeM8fhM1WxzYyzFKlgp+qvMTjJ4SgNWdkCM
 RERh4R71pCbq2WK4sgD5/Ee11QOcKOM=
X-Google-Smtp-Source: ABdhPJxpc2Edr6dtv2YtlSmJDfmCUMQcZ8w3TcdrUnF43REX+u3r0tA1isyJd6lk6rO9QDL759ndTA==
X-Received: by 2002:adf:a386:: with SMTP id l6mr35634222wrb.505.1641153875219; 
 Sun, 02 Jan 2022 12:04:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p13sm32867584wrr.37.2022.01.02.12.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 12:04:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Jan 2022 21:03:37 +0100
Message-Id: <20220102200337.3271548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/file: fix build with gcc 4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 5.41 in
commit d38b72bcd75392a88b5100839ac410859d0a6a79:

readelf.c: In function 'do_auxv_note':
readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (size_t off = 0; off + elsize <= descsz; off += elsize) {
  ^

Fixes:
 - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../file/0001-fix-build-with-gcc-4.8.patch    | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 package/file/0001-fix-build-with-gcc-4.8.patch

diff --git a/package/file/0001-fix-build-with-gcc-4.8.patch b/package/file/0001-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..2494c6a7c0
--- /dev/null
+++ b/package/file/0001-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,97 @@
+From e36455301a3757618381cb83bf17115dd386131e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jan 2022 20:41:31 +0100
+Subject: [PATCH] fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8
+
+readelf.c: In function 'do_auxv_note':
+readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (size_t off = 0; off + elsize <= descsz; off += elsize) {
+  ^
+
+funcs.c:93:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (const char *p = fmt; *p; p++) {
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.astron.com/view.php?id=307]
+---
+ src/der.c     | 6 ++++--
+ src/funcs.c   | 3 ++-
+ src/readelf.c | 4 ++--
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/der.c b/src/der.c
+index 4bee9f16..23b9a574 100644
+--- a/src/der.c
++++ b/src/der.c
+@@ -235,6 +235,7 @@ der_tag(char *buf, size_t len, uint32_t tag)
+ static int
+ der_data(char *buf, size_t blen, uint32_t tag, const void *q, uint32_t len)
+ {
++	uint32_t i;
+ 	const uint8_t *d = CAST(const uint8_t *, q);
+ 	switch (tag) {
+ 	case DER_TAG_PRINTABLE_STRING:
+@@ -251,7 +252,7 @@ der_data(char *buf, size_t blen, uint32_t tag, const void *q, uint32_t len)
+ 		break;
+ 	}
+ 
+-	for (uint32_t i = 0; i < len; i++) {
++	for (i = 0; i < len; i++) {
+ 		uint32_t z = i << 1;
+ 		if (z < blen - 2)
+ 			snprintf(buf + z, blen - z, "%.2x", d[i]);
+@@ -283,7 +284,8 @@ der_offs(struct magic_set *ms, struct magic *m, size_t nbytes)
+ 	offs += ms->offset + m->offset;
+ 	DPRINTF(("cont_level = %d\n", m->cont_level));
+ #ifdef DEBUG_DER
+-	for (size_t i = 0; i < m->cont_level; i++)
++	size_t i;
++	for (i = 0; i < m->cont_level; i++)
+ 		printf("cont_level[%" SIZE_T_FORMAT "u] = %u\n", i,
+ 		    ms->c.li[i].off);
+ #endif
+diff --git a/src/funcs.c b/src/funcs.c
+index d968873d..08b565fb 100644
+--- a/src/funcs.c
++++ b/src/funcs.c
+@@ -90,7 +90,8 @@ file_checkfield(char *msg, size_t mlen, const char *what, const char **pp)
+ protected int
+ file_checkfmt(char *msg, size_t mlen, const char *fmt)
+ {
+-	for (const char *p = fmt; *p; p++) {
++	const char *p;
++	for (p = fmt; *p; p++) {
+ 		if (*p != '%')
+ 			continue;
+ 		if (*++p == '%')
+diff --git a/src/readelf.c b/src/readelf.c
+index 01c60fe9..46421a2e 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -1015,7 +1015,7 @@ do_auxv_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
+ 	size_t elsize = xauxv_sizeof;
+ 	const char *tag;
+ 	int is_string;
+-	size_t nval;
++	size_t nval, off;
+ 
+ 	if ((*flags & (FLAGS_IS_CORE|FLAGS_DID_CORE_STYLE)) !=
+ 	    (FLAGS_IS_CORE|FLAGS_DID_CORE_STYLE))
+@@ -1043,7 +1043,7 @@ do_auxv_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
+ 	*flags |= FLAGS_DID_AUXV;
+ 
+ 	nval = 0;
+-	for (size_t off = 0; off + elsize <= descsz; off += elsize) {
++	for (off = 0; off + elsize <= descsz; off += elsize) {
+ 		memcpy(xauxv_addr, &nbuf[doff + off], xauxv_sizeof);
+ 		/* Limit processing to 50 vector entries to prevent DoS */
+ 		if (nval++ >= 50) {
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
