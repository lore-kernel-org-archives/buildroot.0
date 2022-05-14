Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E4FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4846B60F18;
	Sat, 14 May 2022 09:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tc_ElIKGigMK; Sat, 14 May 2022 09:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59FAC60F21;
	Sat, 14 May 2022 09:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 225EF1BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD5DA60F26
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6ZYcDNQp-sO for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3454460F0F
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4B698376C; Sat, 14 May 2022 09:39:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2cd5639119eee5871b43968d2ace202064b640c
X-Git-Newrev: fbd326cac3c7368b5a52ab0275cdaf78f0608873
X-Patchwork-Hint: ignore
Message-Id: <20220514093943.D4B698376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musl: backport netlink macro fix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbd326cac3c7368b5a52ab0275cdaf78f0608873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

8cf87b30 ("fix incorrect parameter name in internal netlink.h RTA_OK macro")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ct-parameter-name-in-internal-netlink.h-R.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch b/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
new file mode 100644
index 0000000000..fa3057ff08
--- /dev/null
+++ b/package/musl/0003-fix-incorrect-parameter-name-in-internal-netlink.h-R.patch
@@ -0,0 +1,33 @@
+From 8cf87b3027009c0acac591d9ae80262dc25daccf Mon Sep 17 00:00:00 2001
+From: Ondrej Jirman <megous@megous.com>
+Date: Wed, 21 Nov 2018 17:29:21 +0100
+Subject: [PATCH] fix incorrect parameter name in internal netlink.h RTA_OK
+ macro
+
+the wrong name works only by accident.
+
+Signed-off-by: Ondrej Jirman <megous@megous.com>
+Signed-off-by: Rich Felker <dalias@aerifal.cx>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+
+[ upstream status: 8cf87b3027009c0acac591d9ae80262dc25daccf ]
+---
+ src/network/netlink.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/netlink.h b/src/network/netlink.h
+index 38acb178..873fabe2 100644
+--- a/src/network/netlink.h
++++ b/src/network/netlink.h
+@@ -86,7 +86,7 @@ struct ifaddrmsg {
+ #define RTA_DATALEN(rta)	((rta)->rta_len-sizeof(struct rtattr))
+ #define RTA_DATAEND(rta)	((char*)(rta)+(rta)->rta_len)
+ #define RTA_NEXT(rta)		(struct rtattr*)((char*)(rta)+NETLINK_ALIGN((rta)->rta_len))
+-#define RTA_OK(nlh,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
++#define RTA_OK(rta,end)		((char*)(end)-(char*)(rta) >= sizeof(struct rtattr))
+ 
+ #define NLMSG_RTA(nlh,len)	((void*)((char*)(nlh)+sizeof(struct nlmsghdr)+NETLINK_ALIGN(len)))
+ #define NLMSG_RTAOK(rta,nlh)	RTA_OK(rta,NLMSG_DATAEND(nlh))
+-- 
+2.36.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
