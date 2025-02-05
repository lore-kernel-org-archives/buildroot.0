Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F6C02198
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20632419BC;
	Wed,  5 Feb 2025 13:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq5ho-Qms3vK; Wed,  5 Feb 2025 13:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFAF6417B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFAF6417B7;
	Wed,  5 Feb 2025 13:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30C1CCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C44460A65
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yg4Bd8dYQ6Wj for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C724860017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C724860017
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C724860017
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:58:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1txkVa2WFq-00MzAb; Wed, 05
 Feb 2025 14:58:40 +0100
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 14:58:25 +0100
Message-ID: <20250205135825.2310972-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250205135825.2310972-1-fiona.klute@gmx.de>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0j1J9RGKV0B+wKJv79811b4+7BPQSS3pd1WMF9SxRK2AGtAumWA
 Kf/s7AWZMaK3LK5w3wQQBxSCVKGtNR7yraY53YBNvf05trvSNLCwnoOz14ay8sxPlcPnHzN
 jqE8IlY6uTMByrwoFN1WXooI9TxCuQo93XgP3gVxonJL5SzHkwewmUOy7x+uQ6+HoNmoIGx
 xddewSNbBm8xBExwO9bbQ==
UI-OutboundReport: notjunk:1;M01:P0:vlZTD6oAq3o=;fPKHypVjau49huNDfrAQHIeLeiT
 o1LO77chtoFJ+DK8ts1zTF5e3KFk7IjS0F5t46CjX2G0wiXwPCvGy/HkgZmnXm/GeN7Qw1TQT
 tf9lC8kD053qgct4UYe6V0Y8/iKkoLAdjovTiYol9g1edZpUQHI8ejOaKIvIreYFTNbTpI4Wy
 D1DaUUPOA4d1K52kmse07gGCPWp3n6rV7C6xRYZvckNqK8EtIsI7dlDlj7K+Pa5gOAg0X/PLb
 jiGDlCb1YQjaIoYtfjVziClRzDGaOD/6ejIiWMfeCQ4X3HFeBImkp1Fkqg5UvWi45FHeaBRag
 yw/G6v4cwXil48SiMz6qv06jAk0heH06LvYr4qJQnjo84F0nDUICsauQ1njtyZGNbaJ8ZeZZl
 bvEaQRQlUbFiHhrmrtNsgQU6kZzneehbtAWOJjNcq2I/42DaRjfGdX/mK5cNzu0QjMsUQbiFf
 r4ntsgQSbPgoVIcIf6dwn/UvW7hGRgo/WFeju8JOC0QVoPP8V/nn78miyAgWcJtB9o3ydFaDv
 4rtxZU7xXGgfzXqj/ZxnQMn9VpFNaXNY4Z5Wwtlzcgy+JitrRs9DYdZrAutUYc14xsY/thI8e
 h6JSodRx+k9MXILg0tQW+wos8JJTQE1w+aiqEQK6lFiL80Ao8zWxSI4fQljq3Hs1008alFHMc
 +q0+cyXXOUKwNcVlw/8Anu1Lf+Qa4giHjVQiesoLum+1aPybacYGIwHc7rFvmIIfixueDV1Bv
 6JqjB0mXm/EuvGOUjGRoXLI6jSgHUMK/zKqbFOrFIVuaDauKr8AkIxtB9XYSwfcnbc7pIXe+v
 fKDhxQNNRmsQmh1uawY1nm3t1sYSpLyTo31HsD1+m9VAAnPeyGT78J4i+11k5g/j4i0N1GbMV
 Bn+UNBOW+e/yF3AIhIDK0m+nGvvkg2+IDAcYLuG3XXToo5gQxT1su39AuR+aIq5TuZ/waNJZo
 ugFMe4NL9HHtNCJdVuk5clFsomN37ZF1DZ3PkK8wLkCrcGCYT2spwJWxtnQO/57l+uZKg+WMS
 FJVjbm9FsJ4g4cimnwQf30EMTF8jExvcRxhZNzdMuGKtmaINIkxPqp/kA2wHR2y0lR08PWKKw
 sDsBhDPURgct1R5mJYkuP+eSzYscmJt2nPQNnvK58J64T8Jb8fiXv3UJ+PwkK++pjhSeTVjOJ
 lC54Fti+NEzK9WWnljcKz9pkQWI73L9E0Lzu7kdkJLDj16fNIfaJhcRqVDTr4356KaW1ia71b
 uRBz/FxwBVAsQrsAnYZEJZvbPblAHWmvfoSOm1am4BCmrgBNOYoM3GlLnAJEFWe6OafqUMI0n
 OoPiZ2XridPEh7MZSM+FtYZl0Q6YtnIW22guCnwewIniRFwJPekDvvtJmThQHizYsbxTov02A
 /3uGZ8ngExUZJjATfdaDS63x7UJEDGTImnyO+HeRezPOPGNT8Rvffp66qWexJ4l1KikdHZoEn
 4ePj9I1ZN+Bmufonz/ybOobM7oI9VW2H7gcizZQQyu2cHFN/d
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738763920; x=1739368720; i=fiona.klute@gmx.de;
 bh=olvOpJM8S0cS2vv5cHBD7WoN4ABVKpjZzHYiixzNyoo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=D601t0QW/a3O4tEOByvTfTd3Zt/cTpVa9aFRVdhESEh76/7PwK1VQtZGQ5foOX7C
 9MWu97tlETPjItvzyNnjQxHtpAjdY5oA79sTXVCK7rMQUVXtIhHaDZztuTRLZNM5X
 7E6FLOBtR+ZsnW3ENz0MuLO5c5k2dgrZnJSb2DwKIfXShk52xRErXZEYoG/co3f+a
 FNAQWjC7ljAMede8x7FUxH6++BmR5Ppc+uxdobfvekHa3fdX6XV//d4ngB0yeZdee
 q14fULXe9KOeNpLoIjayWyFmrd295lf8Hgwtgc57slCSzaz0QBmPHL7UIoBDty2By
 u3gq5Byslzx9O6VGDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=D601t0QW
Subject: [Buildroot] [PATCH v3 3/3] package/containerd: use --no-pie on musl
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
Cc: Nathaniel Roach <nroach44@nroach44.id.au>, yann.morin@orange.com,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Disable PIE on musl to fix "read-only segment has dynamic relocations"
errors during linking [1] that appeared after major version bump to v2.

[1] https://github.com/golang/go/issues/17847

Fixes: 9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/containerd/containerd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index ee07c22495..1f70a26ebf 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -49,6 +49,12 @@ ifneq ($(BR2_PACKAGE_CONTAINERD_CRI),y)
 CONTAINERD_TAGS += no_cri
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Go exe build with PIE doesn't work with musl.
+# See: https://github.com/golang/go/issues/17847
+CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
+endif
+
 define CONTAINERD_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
