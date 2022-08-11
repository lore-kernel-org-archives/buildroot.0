Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9ABC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19F5682F51;
	Thu, 11 Aug 2022 11:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F5682F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ts9VaDulbOFU; Thu, 11 Aug 2022 11:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431C982AF8;
	Thu, 11 Aug 2022 11:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431C982AF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE9D1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F1A82F6C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20F1A82F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wfpb5UJ8Bmu9 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C3182A5D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C3182A5D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E15187141; Thu, 11 Aug 2022 11:34:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 13:46:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 236db8c55dee55384944693bf02e965417aed93e
X-Git-Newrev: 8f8e9d959dec797e12ee6b1041899b244c4ff188
X-Patchwork-Hint: ignore
Message-Id: <20220811113404.3E15187141@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zeromq: force
 detection of more features
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f8e9d959dec797e12ee6b1041899b244c4ff188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ZeroMQ added SO_PRIORITY in version 4.3.4, SO_BINDTODEVICE in 4.2.3, and
O_CLOEXEC since before 2.1.11. Checks for these feature are incompatible
with cross compilation. Linux supports SO_PRIORITY, and SO_BINDTODEVICE
since before 2.6. O_CLOEXEC is supported since 2.6.23. Keep them always
enabled.

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d4a5a77e54dba425824a6434a05b3a3b8e88c05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 182699403c..219827b42b 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -18,7 +18,10 @@ ZEROMQ_CPE_ID_PRODUCT = libzmq
 # SOCK_CLOEXEC, since linux v2.6.27.
 # Note: the flag TCP_KEEPALIVE is NOT available so we do not include it.
 ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
+	libzmq_cv_o_cloexec=yes \
 	libzmq_cv_so_keepalive=yes \
+	libzmq_cv_so_priority=yes \
+	libzmq_cv_so_bindtodevice=yes \
 	libzmq_cv_tcp_keepcnt=yes \
 	libzmq_cv_tcp_keepidle=yes \
 	libzmq_cv_tcp_keepintvl=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
