Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E68C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6819260F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6819260F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4834F40659;
	Tue,  3 Aug 2021 22:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsNLLz_R0F8z; Tue,  3 Aug 2021 22:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E0A4147F;
	Tue,  3 Aug 2021 22:51:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 477CD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68E2240610
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDt11QDoMxnJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548C340588
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id ABFEC85F62; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 21:47:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e4132725bd521308116f069c61d8e2002a2185cc
X-Git-Newrev: 93b8d601bc208f7f3ac6a2c496590bcc25cc7b46
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.ABFEC85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hostapd: add upstream
 patch to fix CVE-2021-27803
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=93b8d601bc208f7f3ac6a2c496590bcc25cc7b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following:

- CVE-2021-27803: A vulnerability was discovered in how p2p/p2p_pd.c in
wpa_supplicant before 2.10 processes P2P (Wi-Fi Direct) provision
discovery requests. It could result in denial of service or other impact
(potentially execution of arbitrary code), for an attacker within radio
range.

Signed-off-by: Sam Voss <sam.voss@collins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.hash | 1 +
 package/hostapd/hostapd.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index e2f76c12d9..9ac5f4b392 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -3,4 +3,5 @@ sha256  881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7  hostap
 sha256  2d9a5b9d616f1b4aa4a22b967cee866e2f69b798b0b46803a7928c8559842bd7  0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 sha256  49feb35a5276279b465f6836d6fa2c6b34d94dc979e8b840d1918865c04260de  0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 sha256  a8212a2d89a5bab2824d22b6047e7740553df163114fcec94832bfa9c5c5d78a  0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
+sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8eff92eb1e..8820254f89 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -11,7 +11,8 @@ HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_PATCH = \
 	https://w1.fi/security/2020-1/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch \
 	https://w1.fi/security/2020-1/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch \
-	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
+	https://w1.fi/security/2020-1/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch \
+	https://w1.fi/security/2021-1/0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
 HOSTAPD_DEPENDENCIES = host-pkgconf
 HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
 HOSTAPD_LICENSE = BSD-3-Clause
@@ -26,6 +27,9 @@ HOSTAPD_IGNORE_CVES += CVE-2020-12695
 # 0002-ASN.1-Validate-DigestAlgorithmIdentifier-parameters.patch
 HOSTAPD_IGNORE_CVES += CVE-2021-30004
 
+# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
+HOSTAPD_IGNORE_CVES += CVE-2021-27803
+
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_CONFIG_SET =
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
