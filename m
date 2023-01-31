Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FA5C38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 15:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C448A403E5;
	Tue, 31 Jan 2023 15:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C448A403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLOjFu1lAILD; Tue, 31 Jan 2023 15:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA7A4403A7;
	Tue, 31 Jan 2023 15:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7A4403A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD431BF28A
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 15:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05322403A7
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 15:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05322403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snvx49ZHIelr for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 15:36:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358424038E
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358424038E
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 15:36:10 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Msg4p6aWTq9NKMsg5pwiPC; Tue, 31 Jan 2023 16:36:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 16:36:08 +0100
Message-Id: <20230131153608.434059-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCzMkdBOGqnFqljdvEUsXU6+VLYMhYG09LAXvQvvuP7gLgTzw44O8QVvwnl86egPgqiqWjuxamRbhTP8shk7yX87oWoe4rmo6ZKDaNnsvJA5rA+SuRRM
 +dMyKH/4asM8/gM5iO+VOkUtW1mBMn7ej9amFFk9ylnb6PPe4qw9LJgVL47xH6b4VQ9yk00N/Uzy/K1MvkrNl8HvZQmYpdI5w/sP+3yig0bpH971SuIKTZ+f
 sfR88upxdqnyzuexYulUCVoLuDsXeZWjZlClrqaInWDj5rvkKHrRflP9bmVVAiUEzionHMYraRHhoPOF1KIJLQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675179369; bh=R791Zpg32f/QueoMvnnS/M6dvMkv5wzH951EhpM+Yfw=;
 h=From:To:Subject:Date:MIME-Version;
 b=b31DenvMW5ZuJ++qsBfXBSYvQUiKd1MhXCl/iTL78DS2ojpYhLlWK8ICWATqUv7mk
 0TT/grQ2eEu6+IJR62Pz23lUfdgIOZzWSTCs1gcs/xAg508mWMmwCupVn5FRSHQL56
 Su+jMP3hoGqL4Cm8G0N4kxyehkShv2iAm3g8BP5rwQnP/y6y43J/aiNpNqQXZp7pML
 cnLflqodpQRXqxvrEeT6khC4rk4zUt7uiedksOu+rWpkEb8bZIzAqC886ckhwL92A5
 EoZ9rDpFk7Dc0+EbKO/L9XqiTPfsxlcLaafLi4sv+MTk0CTNpGN20uU92L0Tvq4STA
 +ZvzKS/gXUA4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=b31DenvM
Subject: [Buildroot] [PATCH] package/libfuse3: fix build failure due to
 missing __off64_t in musl
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch[0] that substitute __off64_t with off64_t that is
present in glibc, uclibc and musl.

[0]: https://github.com/libfuse/libfuse/commit/19d95c0e701076407dc1f3cfd39e12e28b332927

Fixes:
http://autobuild.buildroot.net/results/a98/a984d275d949e8dc989870d2d2b6f6c7168d52bb/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-use-off_t-over-__off64_t.patch       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libfuse3/0001-use-off_t-over-__off64_t.patch

diff --git a/package/libfuse3/0001-use-off_t-over-__off64_t.patch b/package/libfuse3/0001-use-off_t-over-__off64_t.patch
new file mode 100644
index 0000000000..ce29ba0f44
--- /dev/null
+++ b/package/libfuse3/0001-use-off_t-over-__off64_t.patch
@@ -0,0 +1,56 @@
+From 19d95c0e701076407dc1f3cfd39e12e28b332927 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Sat, 14 Jan 2023 21:31:56 +0000
+Subject: [PATCH] use off_t over __off64_t
+
+when -D_FILE_OFFSET_BITS=64 is defined, the off_t type is 64 bits wide
+already. the fuse_common.h header already checks for this, and errors
+when it is not, so be consistent with all the other uses of off_t.
+
+some libcs like musl do not have a 32-bit off_t type, and don't define
+__off64_t.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ example/hello_ll_uds.c  | 4 ++--
+ include/fuse_lowlevel.h | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/example/hello_ll_uds.c b/example/hello_ll_uds.c
+index c1f64d7..f291fed 100644
+--- a/example/hello_ll_uds.c
++++ b/example/hello_ll_uds.c
+@@ -277,8 +277,8 @@ static ssize_t stream_read(int fd, void *buf, size_t buf_len, void *userdata) {
+     return  (res == -1) ? res : (res + prev_res);
+ }
+ 
+-static ssize_t stream_splice_send(int fdin, __off64_t *offin, int fdout,
+-					    __off64_t *offout, size_t len,
++static ssize_t stream_splice_send(int fdin, off_t *offin, int fdout,
++					    off_t *offout, size_t len,
+                                   unsigned int flags, void *userdata) {
+ 	(void)userdata;
+ 
+diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
+index ff0d966..96088d7 100644
+--- a/include/fuse_lowlevel.h
++++ b/include/fuse_lowlevel.h
+@@ -130,11 +130,11 @@ struct fuse_forget_data {
+ struct fuse_custom_io {
+ 	ssize_t (*writev)(int fd, struct iovec *iov, int count, void *userdata);
+ 	ssize_t (*read)(int fd, void *buf, size_t buf_len, void *userdata);
+-	ssize_t (*splice_receive)(int fdin, __off64_t *offin, int fdout,
+-					  __off64_t *offout, size_t len,
++	ssize_t (*splice_receive)(int fdin, off_t *offin, int fdout,
++					  off_t *offout, size_t len,
+ 				  	  unsigned int flags, void *userdata);
+-	ssize_t (*splice_send)(int fdin, __off64_t *offin, int fdout,
+-				     __off64_t *offout, size_t len,
++	ssize_t (*splice_send)(int fdin, off_t *offin, int fdout,
++				     off_t *offout, size_t len,
+ 			           unsigned int flags, void *userdata);
+ };
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
