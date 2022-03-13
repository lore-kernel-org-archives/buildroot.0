Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 11:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9249F40117;
	Sun, 13 Mar 2022 11:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFJZMgXMxjKU; Sun, 13 Mar 2022 11:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B825400E2;
	Sun, 13 Mar 2022 11:42:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB3961BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A982E818EC
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9_563KbB993 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 11:42:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25446818E6
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:42:10 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k24so19703751wrd.7
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbEEM7cgudCavDX5aEH/bIs0QTXC2KrdXt6p3BraSGY=;
 b=b0nHrEEuC3TwGjkAl+yKLpSWFT55b4ieUAQiHFbe6cXBDp9L1Jn/H/cBvdnN43+2nk
 jCDPSMGCD0ChiNzTWRdcOIwXEQHrKIxVLkZ9A1DruJ0OtfJ4dfjMXdOSu5+8mXpo5rAr
 4vh6xmuOsSdknzkI4g0PC277j7JUi0zSEzdjBVqj6EwTZ1xmOt2BfRTUYeeeImOwgWVP
 DKl6n4xEfAxOi8gEb/1ofFGyra28pT0vTpBBvg3JqwFXAL1VqLN4akA3tA9OX2smIKck
 FleIVActXTzEGStk3ar3wPf7pOjy04MmC1ercZMXf1/jiTUocxSY1fA4Jx/1m2DVvanx
 NqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbEEM7cgudCavDX5aEH/bIs0QTXC2KrdXt6p3BraSGY=;
 b=Cj+hSPZjy5zAMexmBoB1yXLiGk7TznGoejmRs1g1Q0Wz2ESZatC/s7tsDLwO/Jpv0l
 /2wYrRDf7LiRwkjEhG+7gdUikhxNnllIpOR3nzmWH5wkcNzVM214/v53QJnW73d/lRc4
 X+C72fKxRtlIreeMwwcYE4eQ9GNttOZNgXKZKEEzeTEqQPVyN1PMDUwVswjRHsLRg8vz
 vOYVOJmX1+N7chZoUZ+mfcWz9/U0uTB7u41vuwrAvsYxFbXXjIkpS7BBFpU0QNbcefyj
 b50LpRg7o2/mqEF9+O/CHS5q/OAiOagIv0i3bnycFmHzDAQepR77x2RhGNIto6QOul5J
 VpIQ==
X-Gm-Message-State: AOAM530Fqh5JLM2ZlEpC2Qm3/b6bM7XeYLN5J/2jBdmKReYTNX3x/73X
 674Fdp/ZI74s36doeyKKfAYiVjELHvM=
X-Google-Smtp-Source: ABdhPJxk+T3kvlfkXiPvN6O92JKzyZBYh4Erb0HQa8zpJ7B7ljjx4NK1MRiQtX5rbl49LLYgKHbgBA==
X-Received: by 2002:adf:fbc6:0:b0:203:8dff:f49e with SMTP id
 d6-20020adffbc6000000b002038dfff49emr10838268wrs.72.1647171728081; 
 Sun, 13 Mar 2022 04:42:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t184-20020a1c46c1000000b003814de297fcsm15172513wma.16.2022.03.13.04.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 04:42:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 12:41:18 +0100
Message-Id: <20220313114118.1127008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix CVE-2022-26505
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A DNS rebinding issue in ReadyMedia (formerly MiniDLNA) before 1.3.1
allows a remote web server to exfiltrate media files.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rotect-against-DNS-rebinding-attacks.patch | 66 +++++++++++++++++++
 package/minidlna/minidlna.mk                  |  3 +
 2 files changed, 69 insertions(+)
 create mode 100644 package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch

diff --git a/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
new file mode 100644
index 0000000000..6d601f53b9
--- /dev/null
+++ b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
@@ -0,0 +1,66 @@
+From c21208508dbc131712281ec5340687e5ae89e940 Mon Sep 17 00:00:00 2001
+From: Justin Maggard <jmaggard@arlo.com>
+Date: Wed, 9 Feb 2022 18:32:50 -0800
+Subject: [PATCH] upnphttp: Protect against DNS rebinding attacks
+
+Validate HTTP requests to protect against DNS rebinding.
+
+[Retrieved from:
+https://sourceforge.net/p/minidlna/git/ci/c21208508dbc131712281ec5340687e5ae89e940/]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ upnphttp.c | 17 +++++++++++++++++
+ upnphttp.h |  2 ++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/upnphttp.c b/upnphttp.c
+index c8b5e99..62db89a 100644
+--- a/upnphttp.c
++++ b/upnphttp.c
+@@ -273,6 +273,11 @@ ParseHttpHeaders(struct upnphttp * h)
+ 				p = colon + 1;
+ 				while(isspace(*p))
+ 					p++;
++				n = 0;
++				while(p[n] >= ' ')
++					n++;
++				h->req_Host = p;
++				h->req_HostLen = n;
+ 				for(n = 0; n < n_lan_addr; n++)
+ 				{
+ 					for(i = 0; lan_addr[n].str[i]; i++)
+@@ -909,6 +914,18 @@ ProcessHttpQuery_upnphttp(struct upnphttp * h)
+ 	}
+ 
+ 	DPRINTF(E_DEBUG, L_HTTP, "HTTP REQUEST: %.*s\n", h->req_buflen, h->req_buf);
++	if(h->req_Host && h->req_HostLen > 0) {
++		const char *ptr = h->req_Host;
++		DPRINTF(E_MAXDEBUG, L_HTTP, "Host: %.*s\n", h->req_HostLen, h->req_Host);
++		for(i = 0; i < h->req_HostLen; i++) {
++			if(*ptr != ':' && *ptr != '.' && (*ptr > '9' || *ptr < '0')) {
++				DPRINTF(E_ERROR, L_HTTP, "DNS rebinding attack suspected (Host: %.*s)", h->req_HostLen, h->req_Host);
++				Send404(h);/* 403 */
++				return;
++			}
++			ptr++;
++		}
++	}
+ 	if(strcmp("POST", HttpCommand) == 0)
+ 	{
+ 		h->req_command = EPost;
+diff --git a/upnphttp.h b/upnphttp.h
+index e28a943..57eb2bb 100644
+--- a/upnphttp.h
++++ b/upnphttp.h
+@@ -89,6 +89,8 @@ struct upnphttp {
+ 	struct client_cache_s * req_client;
+ 	const char * req_soapAction;
+ 	int req_soapActionLen;
++	const char * req_Host;        /* Host: header */
++	int req_HostLen;
+ 	const char * req_Callback;	/* For SUBSCRIBE */
+ 	int req_CallbackLen;
+ 	const char * req_NT;
+-- 
+2.34.1
+
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index adea200f4f..01ee8d0028 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -12,6 +12,9 @@ MINIDLNA_CPE_ID_VENDOR = readymedia_project
 MINIDLNA_CPE_ID_PRODUCT = readymedia
 MINIDLNA_SELINUX_MODULES = minidlna
 
+# 0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
+MINIDLNA_IGNORE_CVES += CVE-2022-26505
+
 MINIDLNA_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
