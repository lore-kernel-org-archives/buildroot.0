Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C7C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E6383F27;
	Mon, 20 Jan 2025 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JFqai2uGgyn; Mon, 20 Jan 2025 21:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DDBE83EF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DDBE83EF2;
	Mon, 20 Jan 2025 21:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7FE5D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F0D80BFF
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2TEWUoCxucX for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77CCD80BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77CCD80BED
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77CCD80BED
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1tI2n947ql-00zfwc; Mon, 20
 Jan 2025 22:17:33 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:07 +0100
Message-ID: <20250120211707.2381182-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YBhGZ9SFh+ZbeYb4f//nL+Jh3EBoY8L/UnjYBXwnKLscYia3+c4
 eYTw1mjMja1SlUfZtVpwN4009uDlIlcb0/ysSXavqBhSWkPKl4G9zh6Yaam3ra4T/3/pzdY
 K2/XGygPxGSiAxCjfX4UC9bzipnw0RN0xuU3V7O9YM8X8S8MdcrdgKagn+ZjMXV8HMAz0n+
 SfJlmZyv+VXN0VUbRjd4Q==
UI-OutboundReport: notjunk:1;M01:P0:1N+m9z+RAOI=;CbbhnRbkL6DW/wuIYV8V7Ww9IVD
 c9cKqaQZ+3f4DEzdD7+JIjhhJjQROAWX3q22Ksvq0dvv8/OQMPHMqJN/BIY9a2JtsMMqEBTv3
 pbLQdtm5DDvwOLnvKOtdJvblKBW2xPGzGBxb5bykMvp7G+IMc/R+JG5zIOn0Ju849gtyPufCf
 i9jLnJ7i76lQk/57FL05AdNuuB25vTyv+emFDVwL8yVCCc/aNguYJQlD7M+8JF3r5BmNr4Nb/
 7igBFyQnr8ABv8tJGkuiFUCpzwMMCnMaNsViytka9VT0WsFq4h2GJQyTo12XxAqlGn8hZ6JuJ
 3qwII8Q2vNVufhJZMIgZgABNqkGoYXk5w4Zm/Gioz/9PY6RHNYHY3DDg3nm/lXHukGxB95edD
 5YCWUuYGo27/1gbPh7sybCpyVWw6ude370gw6GbnmhRFBmxMmLCRaMl54/GpDT6QjsFtLUpII
 pzKMjWigsXKMB9WYvd3nzEg0GDM3vEdo+rJD33cwrWIzICBElaMngdn86LrzNmCJTykVMA6e0
 9Xt5kVB8mPclpdDmap6KwxKljW5EYaU+DMeskuVFghsCAy3idDpiaGXVgRGsgcIs4Hd1MDkMz
 IYcQGtrBaXMey2MvsAC38MvRF/0j9P/ELhVNrFkTtN7Y3YnhBQ4mSofm5cCzxSB6YH6XvlC/C
 WqkQ6dBHUal53wY4xU4JnvLNpyn6AZm7gpMFpR9n5+xOWO/Dy5qWcDR+utxB47Idmnq6rpDRm
 qOElfGog4IE1YSE8koBKLHCwKNvpk+qnkKKNF9t3tMVUaSO7Ux3lCjceNLFgN1u5WEjPezA0l
 tK9TiqxAYVGRVoRuVUkM5W4J2lDEpSh0Oxh4yIaasCJnpqtDqjUaBjG1S0dn70y5a/tMO3rbK
 mCBMpUXYXp+Qqwaj1Q/I5yDhDV/mRjrkrm0Bpgh5liCWclhdFQV9Zq25bq91W3J4qWN+pyVKe
 nJsFvHgc26LiJLPmV0hWr7lMx1R4o9nPiwJfxmvZmbOqIrirAqCb0CFTLtExEp76+wJEyCUmx
 7IVuFgD38EkWiIgf53jnKaKbSsk9iRdrEOE6Zo9Nw+dIztgmSwHia5ogSIo7ZodLGdQDvjTsL
 wPp6Wl9HWCt516elSSzZjHcZMN2kxIZAgVAfcu5G4mtlO64U9M/JeK8vGK4RSjkpswjO0p+iG
 8RvzpPKdyKAlqi842IwjYLaJUIjaLTZy86C/cllTnBQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407853; x=1738012653; i=fiona.klute@gmx.de;
 bh=lMEq3bTbuNR0JmfVggZ8UGU+a1STN0jMVVaz005GvWs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=k7/pblaGd0i/dw9so+pfxeH2pJY7T+6/gsdJlHDnLo+aJ+EkY2L7NV1zARml73JF
 lNuvPqvO7DZJTwg01abmVyAO90W3e899Zy7xj95uGgWIN11mUGSGO2FThlNhsY49x
 KNBZD29pQbxbR/CXlO52BbC3KTdQUFANcO+d/5k6BOrzdoGeQEbd8AvuLs9QOq4L+
 A53y28FWVz3wPVOImOjOHb072V6FE6PjGO2bzGrq3a1h5GYtytok3A1BqJAuo0kUv
 EqdTFqymnYse3d3tAqJ8mlmCEw0kwy4DhmzkuernGMNKBgB36rPMf91jtDJqYg/3y
 M8hPEaljOz8Is139xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=k7/pblaG
Subject: [Buildroot] [PATCH v9 6/6] package/network-manager: add optional
 dependency on gobject-introspection
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Introspection gets enabled if gobject-introspection is.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v7 -> v8 (Fiona):
* Clarify commit message for NM GOI support

 package/network-manager/network-manager.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 079f9aa98f..015e6b212a 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -26,7 +26,6 @@ NETWORK_MANAGER_DEPENDENCIES = \
 	util-linux
 
 NETWORK_MANAGER_CONF_OPTS = \
-	-Dintrospection=false \
 	-Ddocs=false \
 	-Dtests=no \
 	-Dqt=false \
@@ -50,6 +49,12 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += -Ddhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=true
+else
+NETWORK_MANAGER_CONF_OPTS += -Dintrospection=false
+endif
+
 ifeq ($(BR2_PACKAGE_IWD),y)
 NETWORK_MANAGER_DEPENDENCIES += iwd
 NETWORK_MANAGER_CONF_OPTS += -Diwd=true
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
