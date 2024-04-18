Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A50C4345F
	for <buildroot@archiver.kernel.org>; Thu, 18 Apr 2024 13:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F268641704;
	Thu, 18 Apr 2024 13:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weQrzeO8Lf9m; Thu, 18 Apr 2024 13:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F6941709
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F6941709;
	Thu, 18 Apr 2024 13:56:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 067631BF3AD
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 13:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E082782031
 for <buildroot@lists.busybox.net>; Thu, 18 Apr 2024 13:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdfuXl9MONRW for <buildroot@lists.busybox.net>;
 Thu, 18 Apr 2024 13:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75CFF8202C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CFF8202C
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75CFF8202C
 for <buildroot@buildroot.org>; Thu, 18 Apr 2024 13:56:19 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xSFLr6yr3jEwexSFLrFC0M; Thu, 18 Apr 2024 15:56:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 18 Apr 2024 15:56:15 +0200
Message-Id: <20240418135615.457970-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPoTwi7ZjoC2y2hyROTBlvDRLunq0cGtvP/klve8F+KCcBfuHNkfeLqUGSterXpTKjc+Ih+Em7HMgIDrgofz/ZFZvwEJWAJfb2k8PbSfcjGTjxUMLc3c
 uPb41JsUQX3GiXE1Gp9MW0Kt7IIptN+ZkBErUvyCDSbR+aZ3cZu8KFfLR7woec25r9UCMl3HqJTG6RYUQt94MW56b/mFe9fvbdAqQGn8nPCFfXMep2/Iby8z
 JkHrmxrh7jTwUgsC1rIVdTI2BqIHEYo5neKK0HdLxjU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1713448576; bh=SvpMIrG9drpfN2EeeRRkOK73FXtgXufRDsBU6jg3FPI=;
 h=From:To:Subject:Date:MIME-Version;
 b=fZw6dseiwtXfudu71NlUGEzux5ghHDRIlJp5f4f96vJVgWE6VXQLohacNSjloIucV
 ApLeR1H6ymnDk6Wfn5idhBDE2xXSpQUwdk+8un6sAXKxqZKMHxrayF+X8GRzGmRzM3
 DSTgeFUybDDhaMwEvbWwt8ITgURUxWqlKI5VvIQ+eYvaGb/VvJueonrX1NODueoJ2v
 Q9wWLQn852uusKtkFLC5ql8lGxMwaLk8uGLJlSpcueTZCEvyhEqMuTW/5yqRa34c9y
 UmWtsLbM02nWecWLXy2g6gAayCSTZNpUA5JgHvXHyIAuzE33ryJoCRp3TNdfjfq/j1
 VTWZN0MLTfuHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fZw6dsei
Subject: [Buildroot] [PATCH] package/elfutils: fix host build failure due to
 missing demangle support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building on hosts with libstdc++ without demangle support this error
shows up:
checking for __cxa_demangle in -lstdc++... no
configure: error: __cxa_demangle not found in libstdc++, use --disable-demangler to disable demangler support.
make[1]: *** [package/pkg-generic.mk:273: /home/giuliobenetti/br_reproduce/c2524c7580d97f7387ec22da62be71d77f2ed8ec/output/build/host-elfutils-0.189/.stamp_configured] Error 1
make: *** [Makefile:23: _all] Error 2

So let's disable demangler for host by default.

Fixes: still not showed by autobuilders. Reproduced on Ubuntu 22.04 with
Ubuntu APT g++ 11.4.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/elfutils/elfutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 87b51aa5b5..4d8cc43342 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -27,6 +27,7 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--with-bzlib \
 	--with-lzma \
 	--without-zstd \
+	--disable-demangler \
 	--disable-progs
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
