Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F115CE7716C
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 15:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98F826079B;
	Thu,  5 Dec 2024 15:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ry_kmd4a7_r; Thu,  5 Dec 2024 15:01:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E4060849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E4060849;
	Thu,  5 Dec 2024 15:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 694241FDB
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 533FB41C3D
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuWgtOyZN_Gg for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 15:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C460841C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C460841C31
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C460841C31
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3se2-1tjRQ328O0-00sA04; Thu, 05
 Dec 2024 16:01:23 +0100
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 16:01:13 +0100
Message-ID: <20241205150114.3474074-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:+JpRJ9YPHqy2CgY2Gjwq4N8ooUM0OkdnsiBg0JIs1LaeL0ZzAB8
 fI1ebWPH31kUGyUQ3ncQz/VLexfWGtTLS35mHA6NEfldjloyLZSP0S+hgBQ7VlLwlkfUhNY
 HXezD/jlr//w+CYera+xp57K1ptBBFa1bKZY9KLkLoDnNYh8b+zc9qLnGi9oMlBM4csFyHC
 h/uHXmOxIdfwWVBnaMeJw==
UI-OutboundReport: notjunk:1;M01:P0:Hj+CKRa+Ihk=;HHzXHuhnhmg/uxnLct3I0NDLEmg
 m+XZc4mGdq7Q+ZMTIHSN2QijDd+CDRjV8e0Xmfh8SvnSTo1+TJMioiZEqFw6pFWpk2GwlyGGE
 s07UnTW7KCicscOnX8wwiBi8mQJNwukGZPQiHxb9CEMd4wfjArMbTYPy9ndcd6gzShqtdgQpP
 r7rk6maR8eY0eW5UGwcVxfJqMIkvpSZdJsewtB6DXnpsZHhkq0bon44ybCwF2vAB7R1MRfNbc
 J9yey1hFKytnRyR08NwhN+XiN5m916QufRKoMygVbtuQ7RAHT66ABe2kGVNsc+lrT+6iJ8FYn
 6RR7c3MAFCcyBBqM0slnx0sK5QcxUi9R6W4FuiYPJGhqVLnKGB5p/lZwKtz+SiYWy/NU7uvpc
 cZ3ol1epuT5MMwtMicMeUQf12SH39f+u00llhnTRuuksm6e8UTlrX2tnJqKIeiI+87dbnPYRb
 XZqWQQgCJB+gOy3UPRxYZz/MyYhkjjA1HTTFphWDfsd44zW/uAjYI4eLQFHfOz4UKIWZzAqQ9
 ihi4PrROLhr9iO0VBEE5yq5KpdhS8bYEUG3M6A6B+qaBUNJxm8LmoOYTKSp3xvjurhDyF3T6H
 tUw6wyBFqONh40mglGsy7ncpkcbykdfWJ13Yy6mhEjGIjBNd85hghus1I9JI8n2lhxHKzwoMq
 0QhSJ2AJC1XHPJcld0cTHdaNaOM5x66bZOXT9Bk+nVr0YaPZb4U6kWF1OQbbhftAxjiTGf8iU
 dawaumPSLKuWuqvlPY/BOAqmB6fuJ45wYzHpQazpnBnWKIpWo6f+2njq8GuM8NW7xw0+psZZ4
 7umd2R6DUUaEkkYFBUegCZ+WTAEzvi6XHxR8b1hrkwZPiVjd3wiUqje7wT0cVHBKMe8jbv/R4
 GY0BH1W7Af0Lo5yifOZOVr9kTRnQmovedbWa3Y7yQAtx+AUJI+xFUJSAceZNxUFy7Pto7s5Oo
 94AUQerDKsqST5Hfsayi6zCEQNWS+cj9RDS3xooVJj3p/EIyTBE6X2f5CnhWKfc4s/fUHzLqK
 Hqk6/ijthNRx53Qwzg/ZMCOtb74j7I6YsF4tzYxZ1KZd6Ux6XPAHOuoNzMam5wKOWua8tssZw
 wX8r9sCBfJmJJ9JFriZZxBEkPSGCYc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733410884; x=1734015684; i=fiona.klute@gmx.de;
 bh=YEy/YH9C2rLaQrkOmmNJ/KotHQgPLLngzQnLNTbDUic=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h9K/z6gkEFo1fGH7ig3rPqssjJ3u4oTd/DlaWatqPsBNbyyuy6bwFI5asJrNBHQh
 wa4rVBq3qrUP/skIpcb0bdrSrBGH1n0Vvr1kf+PHeOCAwSSTIbHxLkHIONTnluyeI
 keVXiruwz/CFnwC7EcZyQwPMHzDfT0hH/uyuH9tW93xCeA1wRR7vnU4N/FFY3yhQ7
 SsLGg3cfyl449bXJVV1+9pQge5aDPwQn2NsBgVm0qdw4gDTAgB3BMxIGD60qbP9/z
 FkQgLEp+WUaCpQmrlX7FHpN085l4rd638Yp7qnaG4fk/5cf/mkH/BKrtIZeqCdoEr
 np+DbTi5a6N6REYt5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=h9K/z6gk
Subject: [Buildroot] [PATCH 1/2] package/dnsmasq: install D-Bus policy to
 datadir
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
 package/dnsmasq/dnsmasq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9f342cb049..5dd7ed5c21 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -70,7 +70,7 @@ DNSMASQ_COPTS += -DHAVE_DBUS
 
 define DNSMASQ_INSTALL_DBUS
 	$(INSTALL) -m 0644 -D $(@D)/dbus/dnsmasq.conf \
-		$(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
+		$(TARGET_DIR)/usr/share/dbus-1/system.d/dnsmasq.conf
 endef
 endif
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
