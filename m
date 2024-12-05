Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7ABE7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 15:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1401F40B67;
	Thu,  5 Dec 2024 15:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgyJxCrA-vK8; Thu,  5 Dec 2024 15:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D6E40B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D6E40B3F;
	Thu,  5 Dec 2024 15:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0844CAE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32F6084550
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FhGURyQc8pv for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 15:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3EA8845B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3EA8845B8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3EA8845B8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8QS2-1tEpdr3TZw-00EIyi; Thu, 05
 Dec 2024 16:01:23 +0100
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 16:01:14 +0100
Message-ID: <20241205150114.3474074-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205150114.3474074-1-fiona.klute@gmx.de>
References: <20241205150114.3474074-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fgJ2NqbVxckkVKzDMFcqZu+CCEBmRrXOBGjw5J4neIhdO2bnN4H
 mLQTA0U3gvHnVXJqR6+7HXFzeuSwxCxwyqua8ki2VbmFC54M05WMrtryCzdkJC+nVrfAIF5
 +IY5GjLIuyYikJz+VAVftVsFLUVsZ19GxknDGtxI/v/ClIuL41OxvOGTxtLlbEnDmbK14mi
 sDrsCYfnRZyBXsQZX7MvQ==
UI-OutboundReport: notjunk:1;M01:P0:Qhvq/HdT/x4=;9mKWqsAr4qjgZweguuBEg/g5ETR
 FrPCGqdoYuqKOVtgSDMvtec6hD6IJWOq57PcfT4SY2tLcGuCtCIwZ7BG9XEfvu7nNCSPjWitx
 rhsqzlbAIkl3VK4qS/UrBTS0alWfqpXJdqdvab7UDLVkc9JnRbMjy2ClGQRHEVYHJ23ewCLZ0
 ESBGZ/nus9knblywBKxJQHdowIdL8YHzlK09DRokT+6UTGDTqUivKBD5Q/7sBRVl7RH0GvJfd
 O3gOPqgZzS6OhUeX/jhh0ofsdoTaoykxVLTiWtrkHmHajEid2emd4/D914Dn9dMKDQUgflZo+
 /A4i/EHIJYAAsEhKHWobtPI1OIjzH3U3ttrdZ1jOj+m1GijjOiteK4onwlLwhRGLae3XC/6qM
 RBDSqaC8v5q8y/D8m5GRPMfGkEK2jsfpMZo89zUIwT4LscAYS/YLH5ZcRfbuVmd/+0DrNNHA8
 NXF0SN1u/oIpLEQ1IPiWILsQhPgzrCGaBaORcwWCWsvF8IbG1L5118b71p7feg4ipUFkghdry
 4boMDtjEVef4sD+to7SPFL5JiniyGn8EXK748irU4N0M+44mkx63oOTyXj1Ql/Fy8c9q0vLxd
 AX6wC+gXBbw+kIaDQCRSnd778VrJZ0KegUqDm3QfgN1pOFePh9gHoPodwgEWaEHGUM/ubOVs0
 h5bSrMf3jGAWJ4PclK4/B5ekb6RPxE+pZ6sKtq9a70JrScko6wKr1cTyMbHsFP6XeW2kiRTI2
 X3+aJHN65o1wEQ+G9Bv1czJ3nNst4hze/jmLrctBh2bkRxaSKgrMY/TRQsHuzoer9hq7Qn5FT
 8aQvLzF7nyuV341hiwFzJJ2c0FAy2k8lCeHe6cL35ig4BnC4L3x64vGp4cnTybNeVp9rI0Ot0
 XAXuLkRcsBAR4Q0O9GY0KmvuBxGVTaH6zAzmkG2fR4vt+Mz8LvCYC43rFYp0VfVEMP52P6sV6
 kL7EDjgvrrIzWIxIsluw2M+0Gfxb0WeCXIT+EXhELFhaS6M7b6u4s7A3inSvQlOTXD4zFSMmU
 ZWvh39+PjGhjO0pgCiL56asFXkS1eSmwFH6zVPmYPjAvavkLKqXJdOUOEel5OeipnS7BQaO7v
 szrGxAfvaaoKNSTgqUprnWeWDB7k8k
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733410884; x=1734015684; i=fiona.klute@gmx.de;
 bh=oju1OEut/Qg3l758NhYp3rWxcWgYfjYeYFv703eLiOc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RtKB1wMUMUztYRocFQmy3YL4G1ybwnyg6ZSBCr2LmMPHiyH+hD1lz9krMYz3111H
 nlMDF3h5LABrhJ6+GDq+Eoi2WYzwWrMqLHxRcwTb4aEfZ/gPBMspWCYiCuMHAZH/9
 IEnX+Narg7rF67XcNXlU2sH8gWUo7yc0rJ8z1W0TXUHUDPGvS/6M2DI9StwvL2/QW
 ub3iWdX1Ua8vNeE9431aueVtCkMAVItAIl7XBYarZ2yofVd02Pr3ahxnQwzRq7Lb3
 hXtqyOQf8Dj74VQuZpNmvcAnkHXsVG+MQnQQAhfSMZlcTVxa009yUUBVPaEglmRWp
 QHV76lSY4D4Yy2cCkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RtKB1wMU
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: install D-Bus
 policy to datadir
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index aef8731341..44cfed495b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -254,7 +254,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 define WPA_SUPPLICANT_INSTALL_DBUS
 	$(INSTALL) -m 0644 -D \
 		$(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
+		$(TARGET_DIR)/usr/share/dbus-1/system.d/wpa_supplicant.conf
 	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
 endef
 endif
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
