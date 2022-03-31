Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 21:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50AAD61378;
	Thu, 31 Mar 2022 21:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gz_OI7TvXI6t; Thu, 31 Mar 2022 21:05:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C306661370;
	Thu, 31 Mar 2022 21:05:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF511BF35B
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 21:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1F561370
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 21:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-G-GpDnNLlm for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 21:05:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E253A60FA7
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 21:05:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q20so553115wmq.1
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 14:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQv+RDBPqlhbFC+PC6zn+qp+5osqezaeH8f+hRocR1c=;
 b=lB4OJD4AjFinwGMYKfKK+g1zGyzGPi3ftWK8s04CQT5rFOn3wNCBe+FDki6cHZDcQv
 TWA72LcztpRgu9V4C5/ik83XwT64dPnjYshzbDvHFNduSMrD8SNjAsvR82WiI4yCOUdq
 x0vo6+0e3cXteyggLFZLW0JU3aRdfrIMV6ZWjnUN2CSNyAYf965kAZBDkZYTLFiiWQ7f
 vTU+9k/aTIMSwhTxCWkpKWOtJdiFJuKKWmMopwskRQrv8D4V4YaSJDJk5hAs1+2ROjBO
 KW3MVWS1mPCsPp7qegPcqQXnGJZ9ODAGaAWrHG2Bj+8ZXdh2cb5aOgaYZaeoJq6eDCDy
 gebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQv+RDBPqlhbFC+PC6zn+qp+5osqezaeH8f+hRocR1c=;
 b=8DnZxvJOoezGi3LQhdQxy0m7QqnurNW4tFi5OYjGU9Az0FqTVe8jynGMsWhPAEAscx
 k+xT/lCwnY/rHkwXi2CUdXukNC5fC9E5etIAzCRVu6RFPgvE3CyyZH7uMGKW3HBe5o23
 T1Ed5e6Cy6Uivf9SrM0L3PKENiRXK4b8LGoqyAwV8ISDqTNz/IsW3IRjFdDl558/vUtO
 sLNzWU0GOdJIBPKk52CWC5uWjmrMcTcPSD7DgTqSFJeSaJvnP4JG/YLMSXbZWIDPjCSs
 Or+aL13aAY7XYQHRxwZR0eZStSAKGWhdYd7wPg1kvPtTUW9h/TyUChh7LqlBCfeJhZ3J
 c4Tg==
X-Gm-Message-State: AOAM530PGeLNak+VBSUDRwo+SaeVohlBpfD8d7gTU6/+9RbV2UP+xNOu
 L8p2ykDMHZWAnZN43hXGVd42byvzXBc=
X-Google-Smtp-Source: ABdhPJwvxbJ8T6greSQChS8AYdUEgsxBNZNxp+6m9BuTAZ7zQGg9SULY9HYNglpHehCNoONTpuXIZQ==
X-Received: by 2002:a1c:4e18:0:b0:38c:bd8d:6bd9 with SMTP id
 g24-20020a1c4e18000000b0038cbd8d6bd9mr6086325wmh.94.1648760716818; 
 Thu, 31 Mar 2022 14:05:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 14-20020adf828e000000b00205b0fc825csm410891wrc.65.2022.03.31.14.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 14:05:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 23:00:46 +0200
Message-Id: <20220331210046.35887-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apr: fix CVE-2021-35940
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

An out-of-bounds array read in the apr_time_exp*() functions was fixed
in the Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix
for this issue was not carried forward to the APR 1.7.x branch, and
hence version 1.7.0 regressed compared to 1.6.3 and is vulnerable to the
same issue.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../apr/0004-apr-1.7.0-CVE-2021-35940.patch   | 57 +++++++++++++++++++
 package/apr/apr.mk                            |  3 +
 2 files changed, 60 insertions(+)
 create mode 100644 package/apr/0004-apr-1.7.0-CVE-2021-35940.patch

diff --git a/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
new file mode 100644
index 0000000000..b065a3330a
--- /dev/null
+++ b/package/apr/0004-apr-1.7.0-CVE-2021-35940.patch
@@ -0,0 +1,57 @@
+
+SECURITY: CVE-2021-35940 (cve.mitre.org)
+
+Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
+was addressed in 1.6.x in 1.6.3 and later via r1807976.
+
+The fix was merged back to 1.7.x in r1891198.
+
+Since this was a regression in 1.7.0, a new CVE name has been assigned
+to track this, CVE-2021-35940.
+
+Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
+
+https://svn.apache.org/viewvc?view=revision&revision=1891198
+
+[Retrieved from:
+https://dist.apache.org/repos/dist/release/apr/patches/apr-1.7.0-CVE-2021-35940.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Index: ./time/unix/time.c
+===================================================================
+--- ./time/unix/time.c	(revision 1891197)
++++ ./time/unix/time.c	(revision 1891198)
+@@ -142,6 +142,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
+Index: ./time/win32/time.c
+===================================================================
+--- ./time/win32/time.c	(revision 1891197)
++++ ./time/win32/time.c	(revision 1891198)
+@@ -54,6 +54,9 @@
+     static const int dayoffset[12] =
+     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
+ 
++    if (tm->wMonth < 1 || tm->wMonth > 12)
++        return APR_EBADDATE;
++
+     /* Note; the caller is responsible for filling in detailed tm_usec,
+      * tm_gmtoff and tm_isdst data when applicable.
+      */
+@@ -228,6 +231,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index c45829aacc..74129ed77e 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -16,6 +16,9 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
+# 0004-apr-1.7.0-CVE-2021-35940.patch
+APR_IGNORE_CVES += CVE-2021-35940
+
 # avoid apr_hints.m4 by setting apr_preload_done=yes and set
 # the needed CFLAGS on our own (avoids '-D_REENTRANT' in case
 # not supported by toolchain and subsequent configure failure)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
