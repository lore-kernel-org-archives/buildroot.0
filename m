Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0FBC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F8D60BEF;
	Sun, 26 Nov 2023 21:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90F8D60BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fc0sTs6qxBJj; Sun, 26 Nov 2023 21:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B2D60597;
	Sun, 26 Nov 2023 21:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B2D60597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECBCB1BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5E048124F
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E048124F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kAYqxqnhE7n for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:44:03 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83D5D8124B
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D5D8124B
ARC-Seal: i=1; a=rsa-sha256; t=1701035039; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=GcPZsNvXLH/TenWFT3N6AttgxDgZoAUE299D5tR5UCR6y4eC2IrhAQ86cmVV9PhKmT
 DiGaNLOP6IM3ZjlYKdjiW7fN80+So98stiCakFxOZqcnVyqwcKILCzpXjUqvFnmi4Z+n
 GPwLWn9QTa7uBhr9wvyD3qNklzlVdAQnd6sIQoucVvGg2DZuMN3CjWKuSdU5e0iY068z
 AT5XGrO25gB+RXAGWA3KKNb7r5H7m9tWqf3q8Ja/dUBzv07R0sRrMm1azW5el/P3kjPk
 an8hzLU2MMnNq8qnoqyHlEsmK4OBhOU+22HH2IuddnYoEvNkHrUiCl+plH/SFjy9mKQx
 ZJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701035039;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=+vFmIlZPgcRZpnkbDAIi8nLS8qrb0NoCqqs3ySWoRzU=;
 b=Dwb2lK/zb2brNuHz86COHDhOzW/eYqOQTquZWxEP4WFLv2WlnIzXjKLyiqc0eM+WBt
 UlL0GZCKcyaAcBN61FEylpyNcFH8TjJdDMl8Z6dk6t8UdwEz9OfKa9XZzGAqC0bACA63
 iDn6Tkcxx46IV+ioWbFyr8EGe50BNix73OXVxcsJBg9CHK38yc+62fZy1YWYNtbMoKIw
 89Y3dH2SImyF4SlAfvYuTJTKiG/6/+DhFnLhjT3mKfRYWGFXhTxjGLCqmW8j59QhA/xq
 HmqUJteY7ajEbRMwS/1Ap6ExYm6hJb65iG1EO3z3a0XUmitg5r6N5iBNYxzBvjaC2sim
 E2uA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IGkLe0G6f98kjqfw4wUQFrlMTRmdcFArqMJr9PKvD/+1vbAWPOWb9/LQKzv+5fYUrjoks7gABpEdVvdfIhIPJhPaYm2bXe2VNui+RA=="
Received: from v2202007125235122561.luckysrv.de
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id k8f8b7zAQLhxdhI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 26 Nov 2023 22:43:59 +0100 (CET)
From: leow149 <info.leo@widler.de>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 22:43:57 +0100
Message-Id: <20231126214357.3376407-1-info.leo@widler.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1701035039; 
 s=strato-dkim-0002; d=widler.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=+vFmIlZPgcRZpnkbDAIi8nLS8qrb0NoCqqs3ySWoRzU=;
 b=QmYuvbmmQngk1qUrEwzPJKIbWq3Rhq0Y5v9RxJchpcD3CVcGWF/48Q7od7dqcBGaD5
 7eLqQbRQh59KWSJJaZxWWFnhe9XkmMlGb7e9oxolHJ10GCzq4PU4/v2jC00YILKb2xqh
 PWThGwsF9HTpsQucZHwn5R4P3WyDFes8tXJMVP8ywwNJvRuB/EKBLXsZYQNQXkgSxjW2
 m9xP5AhBpfZpLHDmX13JlDC8hIhbvxovSSMFdvqhYdZlb3ftdEECCk/mrBZAywr3KLEN
 DtTt9gxveEyHPKCVNyRKUD8tml66eoc/Z505UnmkySoFOy52uAs5YVUxeA2kKUMwa8Wo
 vNVw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1701035039; 
 s=strato-dkim-0003; d=widler.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=+vFmIlZPgcRZpnkbDAIi8nLS8qrb0NoCqqs3ySWoRzU=;
 b=7M6qQCPpM/2ASng9gWiv7Fy1VzwHL/9U3AqvlvndxZax15TmPhqYrtSqitsNWACM+e
 HTfqt32hzaCRCHuCGgBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=widler.de header.i=@widler.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QmYuvbmm; 
 dkim=pass header.d=widler.de header.i=@widler.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=7M6qQCPp
Subject: [Buildroot] [PATCH 1/1] package/attr: add --enable-multilib to fix
 build error for BL808 based boards
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
Cc: leow149 <info.leo@widler.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit fixes a build error which specifically happens for Bouffallo Labs BL808 based boards, but might also happen on other RiscV64 Boards.

Signed-off-by: leow149 <info.leo@widler.de>
---
 package/attr/attr.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 0327497e1e..89f7d21f0c 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -13,7 +13,8 @@ ATTR_CPE_ID_VENDOR = attr_project
 
 ATTR_INSTALL_STAGING = YES
 
-ATTR_CONF_OPTS = --disable-nls
-
+ATTR_CONF_OPTS = \
+	--disable-nls \
+	--enable-multilib
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
