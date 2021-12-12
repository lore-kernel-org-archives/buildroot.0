Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5AEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F44240530;
	Sun, 12 Dec 2021 12:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUowCnxyopCL; Sun, 12 Dec 2021 12:10:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7396940285;
	Sun, 12 Dec 2021 12:10:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E45F1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE9160D65
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-CdJ4UO_yn3 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0148960D61
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:10:02 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wNfvmmfHsUpmcwNg0mGp3P; Sun, 12 Dec 2021 13:10:00 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639311000; bh=TsdXtwTNAHmRXccBqWHCF2t4jZHc0kcox9pLAqVKzvg=;
 h=From;
 b=ZOyU85DD6Nv5GGUBihHv4S2zeSe8T+AZM1hoQvRrHvzauIWt2IWc0FbWbqc38oDtb
 cozIMSjHLmgjas9SzZTWFghYjUhf/m0CilJCWGvKifU1Uhuojt9p6dk2CYMGvwcbZc
 /5NL2XNIr7eCugUcitf6QROPuXXVotcFUfswATRkvV6zaxqz4SSR0GvSzKxQ374jN8
 wedU7dceqnsR28XvF7EGKWcQE0KciHDzB5r8F4cVngxSbnne5mmRAorMdoqBsHylt7
 wQP41rMNRkMYdZmwPDAzPYuo0NOok2jp/AZIWka36EWgm+mkUxi7iOtCBt03ATXr6K
 Rlc2OUnUWZmFw==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5e698 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17 a=bWA9glH3AAAA:8
 a=ZBefwkS7F4-9DDuJJNwA:9 a=2xSWHMq_R3_OBoRbKrM1:22
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:09:53 +0100
Message-Id: <20211212120953.6921-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfG0689f3MMr4VrpVGKjyJP+Fb/Ksup5q6FINhQDK4VvgAfp2hL0fnOKkOjKW0cqiU1YfLcC2ISwYAJi6P5wgPd5F9p4N4nU1tKd6rPYI6nOuikYf81LD
 PSSZ/WC5dDSkmjFHPeKf2cE5Hv0vjmf26tNEhuiDztf2daKRJRXikNtDk3eU9ylRfk3LHwWMfThtKXscKi+WpcbHSDItOapUYZyA6XLC5v6Yn88i5RQke6Ru
 L8r5BJ2KrgbEd75/nlz8x56iPTWcOxLp/5T98jHlnYzh85ljahiUDZdGon/2Q6IDExv1oYeQFUc9HNmAqwVpHcbPSLMXXvTEOnUjvJvV0+M=
Subject: [Buildroot] [PATCH 1/1] package/davinci-bootcount: add myself to
 DEVELOPERS
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add myself to DEVELOPERS as maintainer of davinci-bootcount.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3023526427..adfd1b76fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -631,6 +631,9 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
+N:	Dario Binacchi <dariobin@libero.it>
+F:	package/davinci-bootcount/
+
 N:	David Bachelart <david.bachelart@bbright.com>
 F:	package/ccrypt/
 F:	package/dos2unix/
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
