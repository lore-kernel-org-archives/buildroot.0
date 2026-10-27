Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E47606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r27OhIt/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=SE/sXNgK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1137680DEB;
	Tue, 27 Oct 2026 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1riu_I4KDrmX; Tue, 27 Oct 2026 14:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70656809BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793112842;
	b=XpN5Yv1/6yOCMS+Sr872HNYUYFO7GGk9lbq8pvPSznsFnkWr1GH+JSGzkz3R8kKpFL5P
	 wQMe5HbSx1PAMv6CxjUdj/PuffM0IIQVyc/QIF/u876Ugi4c/4PWRwi2QMXu0pcn3qtf9
	 TTkhnZu6AZJMF5WcfKHjB8lL04tihaB7SoW8g+UrCFhJSgG4MoXE0H4iOX6djl3D78ofK
	 21mIVm8ohEj43q3YOvbJEh6K2FxDEfBeF2KWDTVPNdNQhBxMfiaQyXRLgBC+H4ckfZe9B
	 39JHZUPaCe8jb1pzYxcmkDThdkq3wr80zn1v4UEiopz00E6TZRXm5eWAKuPQVVKPIng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793112842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A69GDv9AEthNqpHngPRgfBqbLGU8lMPOE49/KMxINZY=;
	b=n+rgigHqX4qN5h24oMOuuaPyN0CV0bdA6aHManxEwH7L3EKNdHoUBRHL5SfTYAYuR7/b
	 LQsj7EzecB++DS4pKXy05NlwOnefgxkPkKio8Z89qaJYbNHcC2zOI6JsXvIboJ8o/fnfW
	 QQZNkdzWnuIL2CXiZSqA/kHChKRph+be9Koe9vfXvloK0ObbQ1GzNn0outb1xizDQcs07
	 CwRmAHmUtH8eD2g8c7hffByD2GMDom4DjZWJBwyYvX9C/r/b7VaWT0QpIM8HKE6kjZkji
	 qpOT5xWKqhsZyDSPWkXfJCckQujN/4G7mAWza1RjRpP2iQQp6qDmCpZpil82h4dLnsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793112842;
	bh=A69GDv9AEthNqpHngPRgfBqbLGU8lMPOE49/KMxINZY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r27OhIt/ii4TtnBjwUYbUtX/hsifq8ekGv2J9YnrqXWGFZtx0LRnWsLwEZ76yVbKi
	 20YIs9cbBVkzKviXugHLAJbea+HH0BLh7VaJHgJnDe5XgDVwi8lH6XDzGFTke3gV8p
	 vtnGkK9mXAvddlCi0Pn/fFjklkHZOsAKCn0iOEz8n2sOhDFVbEe682lbURxY1rM9wJ
	 cxi+PtB0Bpgy94KNctoxeCe8wo4Ej2A0kMZhX65IuBGQ3PLj14vstgCvyWvo6kuvtQ
	 xPtPM6adjvPlcEziy8IT/mV0xokZh8q0hUbjsktvHaLenO5VYHchO/GuB2pHlFztyW
	 aKkNOSIle9VwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70656809BD;
	Tue, 27 Oct 2026 14:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFFC6A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D068C6064A
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VTKD0yBxMg8 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 14:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF5CA60793
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793112836;
 b=YHiewCdUoT2owq4AlwB9T+KwTC1mLeuQ1CCh3VCJjhInWU2ejA6ulEbold+wAGs65exJ
 UirJ8KDMtgJ493DmOjMSd5VAdrAlFh97KbpN1IduYtNB7GFXvzdZ3ro2n2izSJ9smgvtK
 +lD5hpR3a2AzUHWgsjXrZiisIa0sVjzjHZD6O3JeMmmvCEa1/EOCpZ3kmkMw4dN4MaA1i
 iPFUiiVICQdBSqU5oY120XXzEfBVTh4jW9tfPqbhfBAD+m7dwKJuC9pfHz6u7ZyDfpziO
 hlXiNDVbDVwtSKE4XpZdmPdkuulsv5zHDcQ6om9uoe+lO8WXol+51Mntxrq+WYBjYIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793112836;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=wGJ2nY842xW2lnRzXjZ9xpSxm/40akjtkMITDzvjBNg=;
 b=HvIrp/Iy6QqRUHtzUSzHwXg8kjKt2G+3bev/ED3R9fjzWKVP+HMVDE4KbYPg0xFBKlcC
 NQ5qRvv0/PNMWPuG8VkvwTiRvXbcLbUMTf0iTi9ervv7kwZmHYqvPJCUg+Shn5501GGi4
 3UTY7yhzLCogpgxRnbglHDsg6qla+2CMcgiAhLntNML66P4V8Xb4l3lnNg7LXpkZYnXGa
 6E/yPP0WAuETwraQClUIaXPWoEbb94IWn+3NG8Aj7LgxQNQlW4aGw/4qHOcLv1NyOSHw3
 Jh0OOgwLTSykTnqXoUcIZ+anayWtU5ncgMmd2gYWHwsr0PQz6FPB2lxY0wwiFed11mA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b="SE/sXNgK"; 
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=SE/sXNgK
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF5CA60793
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:53:54 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LiYhxeSyQtleFLiYixL1Ud; Tue, 27 Oct 2026 15:53:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793112832; bh=VUFu2xlM3bJABriIOIC3gftXgYyjcL7TFj6xuSSge3o=;
 h=From:To:Subject:Date:MIME-Version;
 b=SE/sXNgKU1Yj8pmOrtJFSBBa/H5ofJIf2NsUSydMa4O+xW6+gzq6Wm9ORNCTkGywo
 MDIpIV4C/yIdBBHMhmwFIH8iHygp5v3pzKRTxW2HhgA6ifBXhk6LwgD47Dmkmuuh9s
 w2K1FOuFY1OXyMYEX664kLcGkn1JVYS/8vtiOMdH5Zd5PAQjceWBbdpvHcWM2t8e7w
 1zKcorxMGKV8iMEaVNcPHb3CtviRCntZIQbfIw6PIePyUYWkn7o8G0Oq03swTmJqI/
 QTBr5A/q8jYGTzEkgxjukblisqEf0cPsN+EISsv115cJ7I3RiYYR0othyL9Ihkdb09
 XG7y3+F+yHsNQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 27 Oct 2026 15:53:51 +0100
Message-ID: <20261027145351.1527631-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
References: <20261027145351.1527631-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfD3exo0Q76gDKh8viJGcyPbKnpAQhfhtffwObzzTe3xKkXDRDKFhwccsQXkHKsE23t3wxJEI80neMEZQCqYJn/GkwJLBSHhY2Zo2NNIHCdtk5Whtn7Kw
 k0OEyvtgHoLhXDee2F2DIB0c7UaP8ItugF5qcrsPZ+/uLF6RwVDeTCS4q7XkW0S4c812ZNCE9RDoeOLRy0wrcUG/OJ4fX0JxRwRw7mWqDFRobQFl2kABp0Ld
 3IkKMrZKhOKs/1VtxHwmTXnczVqAexPZZIhuOGhLwE7e/HeGOF+Kq+sT/mGRFtzhEJpIqAMATxJBo8OqUkUXEg==
Subject: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: fix build
 failure using gcc >= 14
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->v2:
* rewritten commit log as pointed by Thomas Petazzoni
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 7981a382b1..f8c62608ef 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
-	-Wno-error=address \
-	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
