Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B41606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pysTtezZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=mWA8R4aY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBE116088E;
	Wed, 18 Nov 2026 11:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYCIfp6B25Yx; Wed, 18 Nov 2026 11:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0620C6085E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795000151;
	b=UPj/6qm3nBFTf/DAcSMbGINglmp6yohOkcEfFHE5uzIguWRW//o6dtfBDa1TWY6gGI0Q
	 mmzVIkhCvpYRsVN/GPwgV+RWoADFzxuiQhoT2MefWUPh2bDpXKKP2ecEB+S1MjpZiwthS
	 c5d6/nJG94aZE2UfJwZscJV1OIMPwMX09yvrSanGnbjIK9YtTB5Ieq0IUp35iA0GZocRv
	 crxGVWraaoi8Kyl/Xbqa1MTsVTbCCYtPhVr0AagDTMcNpK7DA33Py+dJZaNampKSAKtIx
	 hQGp2XldwBCdbNSgqBLw3K8GAs0ul2SIU9uOrWKQd16Ke0Jwuw38cMMMB/dpyUUC6pQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795000151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1mo2FpkevJwixIQZn4l6pOx8qNgTHsQgATT85IJy814=;
	b=f/1HabjMyoPUhwu15HGCpTVe02orXv/KRIBQ/mde5WA036gWSHbg5/bQ/DRvq8QFNbDa
	 fhrrf+JMmK81YHOJCKaIOL1Jcwh4Kp8ye5AbKdm8s3MKCS6inTn3LLOD7eZ9bsxAr1sHh
	 FI1UTmtSU9aMWYxeFbMyfCDY0pe2mEhD3xiKRRIT+PRcJq9MwHTsAu4OwV1rqqbNpuNBK
	 gtsRwy3aFix5mYqnaT2YnmyQk/MzBkDEDIHD0uj6TDiAm/hJjQ2mipOzXnPQAV465rQ1i
	 2wNnUa6YlJrd6aV+MocqNwSlv+Mo/j8muFeOvv1m4zzx8zM934Bq1iJQ1yfoBNIP87A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795000151;
	bh=1mo2FpkevJwixIQZn4l6pOx8qNgTHsQgATT85IJy814=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pysTtezZDltmjLsxGWGYk6NxVh8DKrg2muSRwz9gqOfFGRb0Fc8PF4Hb5BMzDC7Kf
	 LL9JzuLEbciu53Hf5c5XGxLJj+CSNWaK6ALBZkU2fvXSHVYshHCSCF4/SUXeLTQt4t
	 2qLthXltInj5xTlIEKa0peOQt76+VeGFYtKMB+P5kq4IIg7oIBkWL61SxMzAS6840N
	 CZh3kwI/wPellk1Xd/ud0eRAjtfyZkWpLy0yj4PCR+kbCTsrPQkC5V6/xSHmfdmw+d
	 VYqvr1ubpJkk8vBrNgxv+VNTvIGkgECvUHgtRg0GXdrQE4Il7uSpmlzXWn+lp3XL5v
	 A1cO82vFn43wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0620C6085E;
	Wed, 18 Nov 2026 11:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED07E260
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2DD6408D1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9CLTeNmIcfh for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 11:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A1864059B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.218
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mWA8R4aY
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A1864059B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 11:09:04 +0000 (UTC)
Received: from localhost.localdomain ([151.49.164.171])
 by Aruba SMTP with ESMTPSA
 id TdXBxwEQNGZvgTdXBxH5x5; Wed, 18 Nov 2026 12:09:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795000141; bh=kJbxbN+2YSna077s+3rqy5tSxPl8ILLFRJOaKPlee3M=;
 h=From:To:Subject:Date:MIME-Version;
 b=mWA8R4aYpGlkg9YhSEP4SE9ytmoiLckPyOquHtAIKAxx0XU7Me0gCCzpsYhKzwpwk
 DkrKU0ulaljO2T2IWK+1WAkPZcD4M4I2+w60wuDr1a7F7Er67l35BJL7I6tYimJZ1p
 TP0FV1x3D3E4i5x56VUBi9OVgtxwuiAyW8kxgMVjLQT4GMxcANJefCw+kbwIoBvo8h
 3R/pbUpn1kL0rusTOcgZyRqxTviFb/T1SggsoSGzrDMqt+aEBKXzHu7kdX4vcRTBPG
 NlSc2N6QXUukYUHnUPBMPBjy7r77s/F3McFpiTTcIHtSKHzHyiBqVYhprwCLARD6ax
 O31mtgVTzUPMw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 18 Nov 2026 12:09:01 +0100
Message-ID: <20261118110901.2312921-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHe/kADsEfrp+JkIARavlqT9UX+ikxVvJ22YwR8MqMzJzkcrD+ann8e3gUTheTDCm6GKamzPY+RvpDi/ofsWcXYp4g34Ceo1I/YvWg/vDPXlV95a2c/k
 SFhsVHlsZNbLDufg+c3sm7hel3tsvMfE/AWbhPMrZcJZFCxPP1Xh+X6pHe/TNI/p4qJs8bu/vfWerde20Pm+nBEGVvdzR1I2sANIcWx2dK/zguRzAkf/bGwI
 jN//pNzhbKgev829G6Lg3L9ER9q1+5bugfd8o8GwuakkpantFRe9FWKOiLqyz2nsjdgVGAfJBLycFVpdHuFG8g==
Subject: [Buildroot] [PATCH] package/esp-hosted: bump to version 2026-11-12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop local patch that has been upstreamed:
https://github.com/espressif/esp-hosted-linux/commit/139a7b6

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...p_hosted_ng-Fix-build-for-kernel-7.3.patch | 86 -------------------
 package/esp-hosted/esp-hosted.hash            |  2 +-
 package/esp-hosted/esp-hosted.mk              |  2 +-
 3 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch

diff --git a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch b/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
deleted file mode 100644
index 3614f65b16..0000000000
--- a/package/esp-hosted/0001-fix-esp_hosted_ng-Fix-build-for-kernel-7.3.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From f91cb6274e5b13342091a934fadeeb39ea9613d0 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 29 Oct 2026 12:46:52 +0100
-Subject: [PATCH] fix(esp_hosted_ng): Fix build for kernel 7.3
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=914781c72813989b512609a51f8abb68417f722d
-argument u64 *cookie changed into u64 cookie for mgmt_tx callback.
-So let's deal with it when Linux version >= 7.3.0.
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4ab9b637b94a
-probe_client callback has been renamed to probe_peer.
-So let's disable probe_client when Linux version >= 7.3.0.
-
-Upstream: https://github.com/espressif/esp-hosted-linux/pull/6
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- host/esp_cfg80211.c | 22 ++++++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/host/esp_cfg80211.c b/host/esp_cfg80211.c
-index 2edd523..ff61de5 100644
---- a/host/esp_cfg80211.c
-+++ b/host/esp_cfg80211.c
-@@ -1190,7 +1190,12 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
- #else
- 				struct cfg80211_mgmt_tx_params *params,
- #endif
--		u64 *cookie)
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
-+				u64 cookie
-+#else
-+				u64 *cookie
-+#endif
-+)
- {
- 	struct esp_wifi_device *priv = NULL;
- 
-@@ -1207,8 +1212,11 @@ static int esp_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
- 		esp_err("empty priv\n");
- 		return -EINVAL;
- 	}
--
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0)
-+	return cmd_mgmt_request(priv, params, &cookie);
-+#else
- 	return cmd_mgmt_request(priv, params, cookie);
-+#endif
- }
- 
- static int esp_cfg80211_set_ap_chanwidth(struct wiphy *wiphy,
-@@ -2444,12 +2452,18 @@ static void esp_cfg80211_mgmt_frame_registrations(struct wiphy *wiphy,
- }
- #endif
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
-+static int esp_cfg80211_probe_peer(struct wiphy *wiphy, struct net_device *dev,
-+                                  const u8 *peer, u64 cookie)
-+#else
- static int esp_cfg80211_probe_client(struct wiphy *wiphy, struct net_device *dev,
-                                   const u8 *peer, u64 *cookie)
-+#endif
- {
- 	return -EOPNOTSUPP;
- }
- 
-+
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 1, 0))
- static int esp_cfg80211_del_station(struct wiphy *wiphy, struct wireless_dev *wdev,
- 					struct station_del_parameters *params)
-@@ -2675,7 +2689,11 @@ static struct cfg80211_ops esp_cfg80211_ops = {
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 8, 0))
- 	.update_mgmt_frame_registrations = esp_cfg80211_mgmt_frame_registrations,
- #endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(7, 3, 0))
-+	.probe_peer = esp_cfg80211_probe_peer,
-+#else
- 	.probe_client = esp_cfg80211_probe_client,
-+#endif
- 	.del_station = esp_cfg80211_del_station,
- 	.add_station = esp_cfg80211_add_station,
- 	.change_station = esp_cfg80211_change_station,
--- 
-2.47.3
-
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 58fa4acec4..be7008c3f2 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02abcfea2bf8e040d7fb6af19de155d19cf0a7f698dc069639ec0ab5f2dedf4b  ng-v54d53676e36850e53d82ee779b6d65dff8e65967.tar.gz
+sha256  c964fb8c141ad746284c65808eebd25e37e7410b91bf0752bb7769217a865a26  ng-v48369ec75c9f6fdd8060b8f249705a4f19a5cb45.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  host/LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 8a9140d07a..834cdb7902 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 54d53676e36850e53d82ee779b6d65dff8e65967
+ESP_HOSTED_VERSION = 48369ec75c9f6fdd8060b8f249705a4f19a5cb45
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted-linux,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
