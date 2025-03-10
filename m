Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F2C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 11:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F1AF60767;
	Mon, 10 Mar 2025 11:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFaGssezOMyy; Mon, 10 Mar 2025 11:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 481E9608C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 481E9608C0;
	Mon, 10 Mar 2025 11:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91FF31C1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7438F6069D
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BhXUJGx3hmw for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 11:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECEE4605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECEE4605EE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECEE4605EE
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 11:14:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKsnP-1tWtqL2kqD-00WQtB; Mon, 10
 Mar 2025 12:14:28 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 10 Mar 2025 12:14:13 +0100
Message-ID: <20250310111413.2976804-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:RtJVYunt9cVcmRR/tfOYegja7SzZkPyaRHZkvurpCVAF55OKTjm
 kuoU+I1sVrlcdX62sZnc+HLA9gp3O5jSu1mNpDnDAj2vGiQ70xo76MJamvHjPMZ1Bv+kCPW
 mzhWk86HHyhARy9frHXMR8B5dOKdv0E8AJTi2BiGjY7/TcdaA7GCLkcs90WBPIEmSakOstS
 v1Z6HYHiNP7B0zVyhbK7w==
UI-OutboundReport: notjunk:1;M01:P0:OkVUjF9eip0=;JXXcLEf6r27HGtqCWr1bmFzS/bB
 eNc4w/JxHxoCtmdrkC4bQguLgmh5K99lED7uoFzIE84ehb3m8fxKGluDwjbi2XRh9QoHETg1i
 sky6eWGFiLz11aCOiQoZ0zlnnbXgCwNJioe6gH9u+mU8rzfBykJoBmkGTMSgVnO2vJVG8KwAv
 XlhtvazRgC/ib2XAJWTUzAieIt/DHbXeb1ALgK3MMKR7RbyUsD6u3mWn/jVSFsTNjxt4V5ZAT
 Py9jKf1mTnU2y05How9D6tg4xlVuflCyUXSMRRjR3tr+Axw9+BGLhj+AwZxIP61fvav+LxblJ
 SlMQ17xTLjnrxIX86uG3qM/136XIOtzz/lcn/sWqxkmAj8Jyi8VpQiZcoUUhXaVscrrHzxtu3
 /U+LCQuTHHRJWrD4NNYPg2e3wKj4W2ncq5+vFzizG5B3GDRJqPxK+i3iAtnvwb5qwsKHfs6w9
 pJpww23lymeIRql6P6q9kQUHAjopK1qP1eI6JX1T+DC6Cun+u/BHWKv7r2+QRVy/jNLTHJ9a2
 bR6bcH2Kq7kdrXWrQeLEdkJtQ8biHBmtAgoKc2loYerfrVDg+onU3BF3Iv12Fd+FGfe7rWF5R
 S38eEKlLDg/x5uMAOk1qXMhNRajJRon4S70H1P/Cs4btetqbiw+ReD8p+9F4+sEE3GyvoazXP
 gDHKR9I9NCOJucD3Ldph8VXmmjI/T/IbyzgHj6IwYYHzeftm6BaXFFIeTDDx9RJuVhmSDpi76
 +wgL/b4cw2IfvqItjkuoNHxzjpM4QboXhD4j3D823OCzQg5dtifGCSSaVi9S4aOAUJWb6Tylf
 V+A9lrf4F1iJL3AHO5XWFc8tSZAHZxSCs4yYhMR4Nm+Bi/VNy7LwStCT8yqdj+Yc3Q0Vapd6v
 zGTHxUjVzafgv8m5P4YwIPtgNzrG7LqGchYbfGVj97Tow3lebIb/M6uohy9m6K9FyISpd75F3
 pR3hUjEhLE3qUSXjmCq9/aqi+IiNaZzi7pHTYTECUKhL8tzJZhOVE/t7jRGUfEwjdNnPep7rq
 rP/AAov7+KorK3abZYC4h3nRpBm9RwrG7paUp2fZujzM2gR4RqgQrLSrzWw05eO4LL1ft5Y30
 myNxydh9etFntCxGwxoGqkb7tAnX7kCDMmF8xJsPjwL+kVJxnemxPeNHUqANQO7RlmYQLp8ih
 ysUOsirL6OIcOrN2t2IqJKrwdzh8IKEfKze+NWfO1iudkQAH5D0V/ep/x7XXgwl1gprBT1Szz
 WX8h2eu0eTqwnmG69q92Z6IUCJmsJMLG3x9x+zBP2hwNlJeZ5CdIajDxU0udeoq7eBn7H7xFf
 IhT17Vn5hdm9nBG48UkbfSxQD2dL75LvbCEQiycLxPHhd2oY7wBE9uRUpyLgUzMnKkZvi6S3i
 Io0ae1PhoD9R4ljg0ToZm5f/NrMwshxVtVritPulkLSHYVY1mtZmzrCNKc+RF4nofDeu3yy6e
 KP4Yy3A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741605268; x=1742210068; i=fiona.klute@gmx.de;
 bh=HA0ECA9ygOWVvMBcacceQx1Jj5CCQC65qrh8T86POcY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=f24F9WRvxlN7ONrPLcIU6HPaGbrimIQUSzIOJ2VYKWyH2/5mbKDBYUC/CFhpC005
 r2UgDqt3wx4jFIfekYbhxLM0vipfDm6SDjmA7dUat3Kbopg//jVp7QFjLZg71+cxe
 B97iZz4YvfWTHVztWzlGMqtTV0wWJ6I+gYvIcPjEUUigxj9xNElmC5SjzCfV5XGxr
 ECpnlq0lk+utbFKFSu7/cOK6u+18wXq0jh4o5DDyFsIjHDXw/GgESUDFoDN9z9IH1
 6cOvALEU9K+Rp1OnZoaPLBQPbUEMSldoZskvLK/jXpR7luQxm3QDPX3qm5qbXAjjP
 XNwZW7rFaMUO4TyTuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=f24F9WRv
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump version to
 1.52.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog with a mix of new features and bugfixes:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.0/NEWS?ref_type=tags

Support for the "dhcpcanon" DHCP client has been removed.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
If this is applied to "next" instead of "master", the next release
should probably get 1.50.3 instead (with a few bugfixes), see:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.3/NEWS?ref_type=tags

 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 64ec5acbea..a0963e010f 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.2/downloads/NetworkManager-1.50.2.tar.xz.sha256sum
-sha256  10473be9d3ab89f8a27a68b7bf5bc9557851a5183b74b6241e5e0fa5c6921fef  NetworkManager-1.50.2.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.0/downloads/NetworkManager-1.52.0.tar.xz.sha256sum
+sha256  356f21a15da51e4218fd4d0fd78cea61e067b1116a25cddee4af9df05062e92d  NetworkManager-1.52.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1a0adacfa0..ab3a437838 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.50
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION_MAJOR = 1.52
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
