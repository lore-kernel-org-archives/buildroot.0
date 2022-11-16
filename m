Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B22C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 10:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2437A416B4;
	Wed, 16 Nov 2022 10:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2437A416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pns_Yc0fWqHg; Wed, 16 Nov 2022 10:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E0941710;
	Wed, 16 Nov 2022 10:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E0941710
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7911BF599
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 10:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A8181404
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 10:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05A8181404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofvyRSO0Kh9Q for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 10:10:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CC3813E6
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.18.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CC3813E6
 for <buildroot@busybox.net>; Wed, 16 Nov 2022 10:10:13 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1ovFNa-0003VH-Sn
 for buildroot@busybox.net; Wed, 16 Nov 2022 11:10:50 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.16; Wed, 16
 Nov 2022 11:10:09 +0100
Received: from go-sys.de (192.168.1.127) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.16 via Frontend Transport;
 Wed, 16 Nov 2022 11:10:09 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Wed, 16 Nov 2022 11:09:13 +0100
Message-ID: <20221116100913.26446-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87y1scqjgi.fsf@tarshish>
References: <87y1scqjgi.fsf@tarshish>
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH v2] package/gnupg2: bump version to 2.3.8
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch 0001 to fix undefined reference to `ks_ldap_free_state'
backported from commit 7011286ce6e1fb56c2989fdafbd11b931c489faa

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 ++++++++++++++++++++
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  2 +-
 3 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 package/gnupg2/0001-ks_ldap_free_state.patch

diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
new file mode 100644
index 0000000000..6800b98cac
--- /dev/null
+++ b/package/gnupg2/0001-ks_ldap_free_state.patch
@@ -0,0 +1,21 @@
+
+Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
+installed
+
+Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
+                ctrl->refcount);
+   else
+     {
++#if USE_LDAP
+       ks_ldap_free_state (ctrl->ks_get_state);
+       ctrl->ks_get_state = NULL;
++#endif
+       release_ctrl_ocsp_certs (ctrl);
+       xfree (ctrl->server_local);
+       dirmngr_deinit_default_ctrl (ctrl);
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index ec2654be7b..f9c071ad45 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html
-sha1  9255a70a984bfbfa5312a9a52a1cf47cb0d1fc84  gnupg-2.3.7.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
+sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2.sig
-# using key 02F38DFF731FF97CB039A1DA549E695E905BA208
-sha256  ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669  gnupg-2.3.7.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
+sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 7d8424c136..9dc29ca99e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.3.7
+GNUPG2_VERSION = 2.3.8
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
