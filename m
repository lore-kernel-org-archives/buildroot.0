Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453DDC3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 09:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E111F4053E;
	Mon,  5 Aug 2024 09:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a37Rk8pyfdS3; Mon,  5 Aug 2024 09:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 918FE40224
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 918FE40224;
	Mon,  5 Aug 2024 09:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2EF1BF3C2
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 09:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47FDB401A0
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 09:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noH3gEdTlZnn for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 09:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E700F4017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E700F4017C
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E700F4017C
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 09:31:31 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6E25535360B6; Mon,  5 Aug 2024 11:31:28 +0200 (CEST)
Date: Mon, 5 Aug 2024 11:31:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrCb8BPsH/mTUm+i@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722850288; bh=tnwigYnQNHCihMQRiJtuesN0dMdGUwXbHKPVMTqIu38=;
 h=Date:From:To:Subject:From;
 b=kOeru38vt1mbKmA4ZkZXxjOEik1hHuFEu4HvIhWA6bGLR2RCWe7cl30o5femkp3hm
 1aZzym3QmsNGdOdJPLVRUhkQuqwTTmRUO+z+6L/kZEClgejKntBo1RBG2gUH6OA9vz
 FnLXGItJgoPoLCLoD7GvWcXXNCalV7CawcxB92NrAxzDzj7ljqxQw3g01Vw4WlxhdY
 Pm/wcF4k4NgeZ+ClIfj2OhQrBjVDYA9XAAukyqWqxoraHAPOY++5/HK/X8V+BTalg8
 pdAbMoHVUyE8+yUC3b902phvMDd6MlCs6dhNUieACo97euoJMGZwJL0plz3dzxQ7AW
 nQtzTSW2FIEYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=kOeru38v
Subject: [Buildroot] [PATCH] package/openldap: update to 2.5.18
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a Changelog:
https://openldap.org/software/release/changes_lts.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openldap/openldap.hash | 4 ++--
 package/openldap/openldap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 1383c6aef8..32bd83f349 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.16.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.18.sha3-512
 # Locally computed
-sha256  546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327  openldap-2.5.16.tgz
+sha256  2670ae43d8d99dd6b1ba182101d982350d613d09c098eb1607ea6b36e6b51d3e  openldap-2.5.18.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 9cebff99dc..68cfb89c41 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.5.16
+OPENLDAP_VERSION = 2.5.18
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
