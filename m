Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EBCC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 08:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDCF60B8F;
	Sun, 26 Mar 2023 08:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDCF60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWUSvJQSFoR2; Sun, 26 Mar 2023 08:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A5A60ECD;
	Sun, 26 Mar 2023 08:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A5A60ECD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D970E1BF2B6
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3CE081EB9
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CE081EB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkVSv5v_Z8Y8 for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 08:00:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683D281EBB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 683D281EBB
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 08:00:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MmULr-1qNtJc0FtJ-00iVgO; Sun, 26 Mar 2023 10:00:37 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 10:00:34 +0200
Message-Id: <20230326080034.14629-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326080034.14629-1-ps.report@gmx.net>
References: <20230326080034.14629-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:IwgvmDYuRwRU0az0tpFySeyzbPaFQDkSBMbeaIvQpNtJ+wJdYCg
 qepkS+c+cz/ZWweRg2rt8hPBnAJFl6CgY8GFnySU3VPph5U386IXNo0viANWnYm6bgkFo8X
 D15398xHoh3IdzxtV4BWfQF1LssPG0/q5J0HWbAulhgdUluffiN0MkhL2kG9OGujn30UnfC
 RRHu17yiIlN+MfWQYsTLw==
UI-OutboundReport: notjunk:1;M01:P0:M26xkDctkSg=;hLn2ujMMnDVirdwJNduMIzJvDae
 wy458F29Jb2df1zajHuZaJXuvWTNOaVHTRywCe6sKWdcZ1ADUxe/1akEAjdcEeV74cB5T9hxw
 FL66RKYCKOXPMLjGhm3pt9XIRgFlYo3pZhRSpJ83FAdI4iQ7mVgGXQyAsAonBntoBIYvfJRbS
 EF6Ga573pSu4UBcj+NGCKqYuuryXyyO8CQQV1dTRH3+oS7EgisGN3aSdzG9mPoPo7pwi+OwhV
 n5NaxPogv0GjzBNJrMGOznxSOeamIoONDdbKhEzhKm5/dCu0U3BTS5VihgZffSmpAJ4B4R9Cn
 H6n2I6rySR8mvBMXh72pEF4RsWpi4WWNUzEFDJoB4VCa7rAWa8dJ86TxZlLGbx+rF2E5bS+t+
 5t3/FouPCqojx6WOExECjF0nP45xBkQmkoFnzN0TU/gIvuN0zspupVhrGv+p2KKh5oWnjkD7I
 16Kn5XWeiJsm2ZdifmNdNlNZJrw65f3WKAuW+7/KJLVaSim8l2fuN1eNgZxU4x+I4xJ648Tb/
 TyzanHT1X84VZs4BzZmKZDSUwDaDxHGmXYuPcZ5QvHxyPw+OZSmFFDO0n921DRk5TUKTKt/Hl
 k1OBgtG+IhcWuLJXk2RY5YrL2/83CcAwxVeJljkwgVU0zOPi7YpRFzl+pEOKvLmGcsoLhe0nR
 ZFOePPrf36bCHuKOp5FVwBPeXdfcqk46QXoZlaILrJqOjTLDQJTmDRmc+GYwSFbzSO+P1f9/g
 rXfhcf0oaKW/yD1N1PWsGbqLQg436zpPD+TTtIiHqDdfSPWklfUwlbjm2DJlVfUQjXaUQzO+e
 7jxu5bBKSrj9AjgCw8p9DjUH9t5moG1aucjDsORms+P2gjGq7R2rIL/z236wNhsHPupItltnV
 3i/r8KhTu4MvRvOlHZrz7CxJ8z1QaYD+cS82KZVMle1Dbxesv/I4XcvLrkz/zbpMkNfLSHECa
 LQ9Vmm7JhT6LsdrlwmWgkdKaSUU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679817637; i=ps.report@gmx.net;
 bh=HmMrLIZhuA6k6h/BmeM+aOUy688FI9LnwpR3x6Akdgo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ubqf4ET8kvuzQuXMuzGnK069XzDr3RzFFQnjP3tbgUsq9KtUmrlz/R/ya69Q9l0Xn
 GtBXNKkOAfKkjt999VqmKJfsdcPYK44xyfmM8hsLusdKzIvnAsMiWlJXuqmN5ARejC
 SwbCQgG/QM1cranJvAwn620n1cM+OHVsIzxvWN1EgXC7zzJ6QQq09HLHIKrNJmQCqh
 HJx1RSFnpvjFRHyCdRTdmwk/0J9UQspxYdvTED7HEfSUtAfkCocgzqt6Jhly3eO8ct
 sHQ6zu2a1xRCTcl5Eer81H1oHEm+NUjf6XNfrggD5VG3Rc9nnvG5rsRZt+j2u/UVzz
 6kvyZKXEqCg0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ubqf4ET8
Subject: [Buildroot] [PATCH v1 5/5] package/zerofree: fix double space in
 Config.in comment
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/zerofree/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zerofree/Config.in b/package/zerofree/Config.in
index 99466d6bae..e7007819d8 100644
--- a/package/zerofree/Config.in
+++ b/package/zerofree/Config.in
@@ -9,6 +9,6 @@ config BR2_PACKAGE_ZEROFREE
 
 	  https://frippery.org/uml/
 
-comment "zerofree needs  a toolchain w/ dynamic library"
+comment "zerofree needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
