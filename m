Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15C0EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 09:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1F360FBC;
	Wed,  9 Aug 2023 09:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B1F360FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IthZXnr6fCuF; Wed,  9 Aug 2023 09:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737EE60F7A;
	Wed,  9 Aug 2023 09:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 737EE60F7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0995B1BF34B
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3EA241864
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3EA241864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6WSGOQvPLK1 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 09:32:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE2244185E
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 09:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE2244185E
Received: by mail.gandi.net (Postfix) with ESMTPA id B9652C0010;
 Wed,  9 Aug 2023 09:32:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 11:32:37 +0200
Message-Id: <20230809093237.326383-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691573568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hUl4IE20bkkXrYYqB+LsgL+P45DBABMc7fUSvKWZmOI=;
 b=UmK1Ve0z7805yEqveONd0HKfB74sJLXVoc0z+JfF0DsssxAYdXWPo8XXG2EU5GBXYfQfS4
 HZntwJ6kQqY2CV3VwBNk78bvRULiAPCrPNFkFvNaC6y3uA80veOm6/GBwRQ+aUnW4MY19F
 GHk5Wg6fVSy8q30Pz6Ble9hxkH7JYt9Jm4ctk/cjXrzAPxlZsfMjS6JlVlWVh9NxxfgiZH
 SdnqZBiEHMbkvlf2tyrx//l5I98mjndbID9TkA/g2Pr4ZY6wts948msVshGJV/HRnEwt3B
 7IPOZ9WgMkDHy65yupS49fwjH5qxVZHLbU20tHacHNX+mB37ooSOeu/CHNMFww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmK1Ve0z
Subject: [Buildroot] [PATCH 1/1] package/flite: add FLITE_CPE_ID_VENDOR
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
From: =?utf-8?q?Cl=C3=A9ment_Ramirez_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOmNtdTpmbGl0ZSBpcyBhIHZhbGlkIGlkZW50aWZpZXIgZm9yCnRoaXMgcGFja2Fn
ZToKaHR0cHM6Ly9udmQubmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP25hbWlu
Z0Zvcm1hdD0yLjMma2V5d29yZD1mbGl0ZQoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUmFtaXJl
eiA8Y2xlbWVudC5yYW1pcmV6QGJvb3RsaW4uY29tPgotLS0KIHBhY2thZ2UvZmxpdGUvZmxpdGUu
bWsgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZmxpdGUvZmxpdGUubWsgYi9wYWNrYWdlL2ZsaXRlL2ZsaXRlLm1rCmluZGV4IDc5YjIy
ODhmZTMuLmJlZTRjNzM5NGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZmxpdGUvZmxpdGUubWsKKysr
IGIvcGFja2FnZS9mbGl0ZS9mbGl0ZS5tawpAQCAtOCw2ICs4LDcgQEAgRkxJVEVfVkVSU0lPTiA9
IDIuMgogRkxJVEVfU0lURSA9ICQoY2FsbCBnaXRodWIsZmVzdHZveCxmbGl0ZSx2JChGTElURV9W
RVJTSU9OKSkKIEZMSVRFX0xJQ0VOU0UgPSBCU0QtNC1DbGF1c2UKIEZMSVRFX0xJQ0VOU0VfRklM
RVMgPSBDT1BZSU5HCitGTElURV9DUEVfSURfVkVORE9SID0gY211CiAKIEZMSVRFX0lOU1RBTExf
U1RBR0lORyA9IFlFUwogIyBQYXRjaGluZyBjb25maWd1cmUuaW4KLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
