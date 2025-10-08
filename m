Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7ACCD183
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 16:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFD040B5F;
	Wed,  8 Oct 2025 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7GRgjZ5ilTB; Wed,  8 Oct 2025 16:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF31240B60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF31240B60;
	Wed,  8 Oct 2025 16:23:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AEEF9DA
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D25812CB
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwXIOOR5WHOr for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 16:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 150CF80F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 150CF80F66
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 150CF80F66
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 16:23:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6WwrvyUuj3rWi6Wwrve6nz; Wed, 08 Oct 2025 18:23:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  8 Oct 2025 18:23:26 +0200
Message-ID: <20251008162328.3569687-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
References: <20251008162328.3569687-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFlVDbbvg+bPFUlgXQ3mw7gBLxD3lCQhAeExq1/JVU5EUbAcwb5R73K9/jK/MJFpgKdESFuvva7mJ79xlcJz3lgfkJAXeKGqvfqY92zPflms45CkZBHN
 9t2tYoBnnXCx38oJtrB60E1MTiNisaZnks+wttmPKQJ67YjG59QDALYqsaxR+tnvHgsFpR2BBpeapw/3f8xrIB83QRogGPepx6EtSqknOu/Pv8MK5rfG6mnA
 hyD1e6CNW/RdVMA9RRHWsq5vGTnPAJaD/DOvSWuCG8JCM3WGJ1NOx51GU+Ms9QuCHXsu22uNq9UtEjfatZdpFVxDzPbehHCgwWa5ItOT/Kc7HpAQ8TCcWdym
 5kBD7jGR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759940610; bh=xJyI0ZB9ls9+9Xg1LxKq0JPJ+sg5f3hd30s/gmOeT08=;
 h=From:To:Subject:Date:MIME-Version;
 b=QsqqnGcdhtA6w0zIifQOnbVB0vfCLxY3pjUppSGI16BirxWGO0gk3zS8QfTO+1s1O
 h+WzyEuJgKsGU/hrdaipKJ11AcHBjNH03YGF++5DFFIVDnikbxSwwH1ybGk3dzeViy
 Ey/VxsQTK0a/ERQmvtZk7DgZzo9DCCrznctxz+M2cvAwf9r8PU2W/J8FNQHeVPsabZ
 PjGjM3goIxJkSCo3JWCnmXa0ESl2WwrAie4Ve0/zKckzAydRQHmT75JfxUocSWgMX6
 8aUpmnnL+VdNgpP1/2GCNHYyD1C17IiQ3XkCJOl3mKpoExEgpFXPf2hGMkfOUhWdcL
 UHIJQVB0Fd6Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=QsqqnGcd
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build with
 Linux 6.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Add local patch pending upstream to fix build failure with Linux 6.17.

Fixes:
Still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0003-Fix-build-for-kernel-6.17.patch      | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch

diff --git a/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch b/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..361615b945
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,57 @@
+From dfbeaa319808624c367200739a9a6f7fbc4b8281 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Oct 2025 17:56:52 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params() and set/get_tx_power() gain argument radio_idx to get
+radio index. So let's add that argument according to linux version >=
+6.17.
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1238
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index ec47e95..3d834a4 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -3365,7 +3365,12 @@ exit:
+ 	return ret;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
++					 u32 changed)
++#else
+ static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, u32 changed)
++#endif
+ {
+ #if 0
+ 	struct iwm_priv *iwm = wiphy_to_iwm(wiphy);
+@@ -4267,6 +4272,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 36)) || defined(COMPAT_KERNEL_RELEASE)
+ 	enum nl80211_tx_power_setting type, int mbm)
+ #else
+@@ -4328,6 +4336,9 @@ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
+ #endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 	unsigned int link_id,
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
