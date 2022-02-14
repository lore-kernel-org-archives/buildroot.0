Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E58C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 13:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 145CF4048C;
	Mon, 14 Feb 2022 13:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5ZTArKtM7XQ; Mon, 14 Feb 2022 13:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067314015E;
	Mon, 14 Feb 2022 13:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03B3D1BF3B8
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 13:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E61C64092B
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 13:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF72aLFsZEDx for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 13:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE3E0408E1
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:29:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso7227189wmq.4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 05:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3V+sVJP2Y1lB1Q054MtslPHHueUKZSR1E2rHn+MAUQ=;
 b=RFrlWHk90NkK8B0boPWq67dTO45TOtw8UDt1n89bu0bytGAGaNqXiK4apzTVdjLhTh
 N2dNXUAgreKxzLXW63ia20dkqUjvOudRdSkxV52FseJXEsqbcrEHEDWojDirnnczsnfw
 vH6VjlUBHr/6GP58XSDGSfdB7fMbYtlftUdxHeZBpL/CmXZ/j2r6MTzXA8C3gjc9cY0X
 XAJImeX3t+KMq/+DkRIL8dvWxNLpnCG3Wwj9eE4ojHVLbU+6u6fLwbxPwsgTB4Bf7NAk
 G/ZcYe3e/bWVDCZUvqdVhsdgSNUU6CbGQkUKvPxRhw5sAA1ZQmT5QF7sqbFeDQBda7hQ
 g+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3V+sVJP2Y1lB1Q054MtslPHHueUKZSR1E2rHn+MAUQ=;
 b=thPXphRwyxaRTS9abuVEXDtqb/pcyT6vghB+Rrn6oOaCNK2rmjUbIIMdXsAUcJAgBY
 JEjyVhuLU5JcNwK0D6FMmF6CZH0bqruVIVly675xU37fjVBQRRlM/bVTEzQbZREz+8xd
 gYNAF32j8oGn1s3y8XP/kuY46LxMgkwYX9EDRHEs3zlm0cdYNUhmxvFYKaz3cBicpjQe
 cQ+DDGpDFlG6pu4wrBLLvtEv8tqva9nYM0VadXR4RRRMBgV8aPBBfR7K9P1T2QBSy/Sc
 JJ8AP6+LqcLXdncKfxflCcHfJ/QU+pNjUTOUAV/PgT6rUR+/4WxcQHdU457IjV04S3Zp
 kDKw==
X-Gm-Message-State: AOAM5301JWTNk0iJppxE00WxAkQrcLF1bw7Iz6gSM6XpcCj+XNwNiJh3
 aBKmyc3HkET0YXrHVNUm+P/jdq8/UbQ=
X-Google-Smtp-Source: ABdhPJzcxa3bbIttUXHYWktfW22y9VhGNSsIDL//7FsJuTAKE9DH3PTGMDr/loIFk/04ArbfwMl3Ow==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr11454887wmq.186.1644845361837; 
 Mon, 14 Feb 2022 05:29:21 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n20sm2074382wmq.42.2022.02.14.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:29:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 14:29:44 +0100
Message-Id: <20220214132944.2471362-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix build with ubus and
 without dnssec
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 2.86 in
commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

rfc1035.c: In function 'report_addresses':
rfc1035.c:978:49: error: 'struct dnsmasq_daemon' has no member named 'workspacename'
  978 |        if (!extract_name(header, len, &p, daemon->workspacename, 1, 0))
      |                                                 ^~

Fixes:
 - http://autobuild.buildroot.org/results/51242d4f532373544e3c7ea45036b8d41390b29b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-not-DNSSEC-compile-options-selected.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch

diff --git a/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
new file mode 100644
index 0000000000..9c98af2be5
--- /dev/null
+++ b/package/dnsmasq/0003-Fix-FTBFS-when-CONNTRACK-and-UBUS-but-not-DNSSEC-compile-options-selected.patch
@@ -0,0 +1,34 @@
+From 2c60441239e1c10c4987cb586653b1ea08f703c0 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 28 Sep 2021 23:42:15 +0100
+Subject: [PATCH] Fix FTBFS when CONNTRACK and UBUS but not DNSSEC compile
+ options selected.
+
+[Retrieved from:
+https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=2c60441239e1c10c4987cb586653b1ea08f703c0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/dnsmasq.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index c8a918a..3fdc1b0 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -1173,9 +1173,12 @@ extern struct daemon {
+   char *packet; /* packet buffer */
+   int packet_buff_sz; /* size of above */
+   char *namebuff; /* MAXDNAME size buffer */
++#if (defined(HAVE_CONNTRACK) && defined(HAVE_UBUS)) || defined(HAVE_DNSSEC)
++  /* CONNTRACK UBUS code uses this buffer, as well as DNSSEC code. */
++  char *workspacename;
++#endif
+ #ifdef HAVE_DNSSEC
+   char *keyname; /* MAXDNAME size buffer */
+-  char *workspacename; /* ditto */
+   unsigned long *rr_status; /* ceiling in TTL from DNSSEC or zero for insecure */
+   int rr_status_sz;
+   int dnssec_no_time_check;
+-- 
+2.20.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
