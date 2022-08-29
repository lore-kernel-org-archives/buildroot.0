Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B42C0502C
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCCB818C0;
	Mon, 29 Aug 2022 15:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCCB818C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTzt-q6DU-bn; Mon, 29 Aug 2022 15:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7518184F;
	Mon, 29 Aug 2022 15:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7518184F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF5AE1BF28E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A2640872
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A2640872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpQ3wWPGcVe2 for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:45:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D3A407D7
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44D3A407D7
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:45:38 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MGZXG22fqz9swf
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:45:34 +0200 (CEST)
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 17:45:32 +0200
Message-Id: <20220829154533.100445-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4MGZXG22fqz9swf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1661787934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=T/VSDvylWO9c/ux4Zo6aBcJDDhjMcZv0qeunzqVuPHE=;
 b=h0EH//PcrqRom8y3T8BCjj0s+iov6XGG8cQgY7R3Pv+mwcrrPq6GB3miIGrPXUvZD7ZIkD
 LGAxjmzX/BSEpjbchTW21EK9Nyc0fLHW93T4vxTe9TZg6jFUpsAyVNdzACgkeJZof0lVAQ
 DejKH/RTTT0zhRqKBS69dPZLqZBsW6/7ORc0jWXnJhtv5onT3CK4PbUUhs6GajMGjn8AIA
 Sse/bCxRlItF52/vPkDiwYDG/IyCgmXh/yyiyjuNNCbECgbqBDB2WByRptM1h44Fabrykj
 bKKI+LZuZjHnr82D+pfwKFSKLrJD+PjZj9A8kTrOHZWPb3a/89jW+i0eS/LPlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=h0EH//Pc
Subject: [Buildroot] [PATCH 1/2] package/libzlib: fix CPE vendor id
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Can be found in this CVE entry for example:
https://nvd.nist.gov/vuln/detail/CVE-2022-37434

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 package/libzlib/libzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 933732d6ba..431c48739a 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -11,7 +11,7 @@ LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = README
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
-LIBZLIB_CPE_ID_VENDOR = gnu
+LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
 # It is not possible to build only a shared version of zlib, so we build both
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
