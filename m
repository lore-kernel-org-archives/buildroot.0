Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75F3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:10:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D99560F02
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D99560F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3431E40277;
	Mon,  1 Nov 2021 15:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z71CzabRSJS6; Mon,  1 Nov 2021 15:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA4540264;
	Mon,  1 Nov 2021 15:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 206A91BF2AF
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 107AA80CEA
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3mpTsN1EvkI for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 15:10:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E1E80C93
 for <buildroot@busybox.net>; Mon,  1 Nov 2021 15:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id 571A412003;
 Mon,  1 Nov 2021 16:10:18 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bi0DwIUieSUQ; Mon,  1 Nov 2021 16:10:05 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 140EE12001;
 Mon,  1 Nov 2021 16:10:04 +0100 (CET)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Mon,  1 Nov 2021 16:10:05 +0100
Message-Id: <20211101151005.7313-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.11.0
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
  * SASL EXTERNAL support (XEP-0178)
  * Client certificate can be provided for TLS negotiation.
    If the certificate contains a single xmppAddr and JID is not
    provided with xmpp_conn_set_jid(), the xmppAddr is chosen as JID
    element contains "from" attribute over TLS connections now
    GnuTLS can be selected optionally with configure script
  * Support for manual certificate verification
  * New API:
    - xmpp_conn_set_client_cert()
    - xmpp_conn_cert_xmppaddr_num()
    - xmpp_conn_cert_xmppaddr()
    - xmpp_conn_set_cafile()
    - xmpp_conn_set_capath()
    - xmpp_conn_set_certfail_handler()
    - xmpp_conn_get_peer_cert()
    - xmpp_tlscert_get_ctx()
    - xmpp_tlscert_get_conn()
    - xmpp_tlscert_get_pem()
    - xmpp_tlscert_get_dnsname()
    - xmpp_tlscert_get_string()
    - xmpp_tlscert_get_description()
    - xmpp_tlscert_free()

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index d5f151660f..7e211d0a6a 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
+sha256  3605a20f32d7b3193292e238b410d595e01b1d64510f42c108da13c09b60688a  libstrophe-0.10.1.tar.gz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index e078eb25cd..718a8dc581 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.10.1
+LIBSTROPHE_VERSION = 0.11.0
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
