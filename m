Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F5DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F65681B6D;
	Sat,  4 Dec 2021 20:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yxh-50iDO_PV; Sat,  4 Dec 2021 20:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC398194C;
	Sat,  4 Dec 2021 20:24:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6295B1BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 602E881852
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EU49smYnSBfE for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65AFB82B24
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 58EC192335; Sat,  4 Dec 2021 20:19:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:23:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5ca414c07dc83862eca679767cb72e0233a2de24
X-Git-Newrev: 5a5859df8a8dfc00fd952ed9f323dd9e298c1d50
X-Patchwork-Hint: ignore
Message-Id: <20211204201912.58EC192335@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuradio: force
 python3-six
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a5859df8a8dfc00fd952ed9f323dd9e298c1d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-python-six needs host-python (aka python2) but since
commit e9df5b0fc3f6e8bb36deedefb392bbc968116ee7 python-mako is
python3 only. python-six is build using python2 and python-mako with
python3 and gnuradio build fails with:

-- Python checking for python >= 2.7
-- Python checking for python >= 2.7 - found

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 2272a1162a..5616039559 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,7 +22,7 @@ endif
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
 	host-python-mako \
-	host-python-six \
+	host-python3-six \
 	host-swig \
 	boost \
 	log4cpp \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
