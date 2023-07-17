Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB2EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C82240301;
	Mon, 17 Jul 2023 21:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C82240301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3b-cqMlc4fiO; Mon, 17 Jul 2023 21:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C8314024A;
	Mon, 17 Jul 2023 21:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C8314024A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFE51BF2C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8F8681296
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F8681296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhRnQu2sa07q for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:34:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205B181281
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 205B181281
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:34:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbab0d0b88so38026275e9.0
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689629642; x=1692221642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJ3Mjusd3biw093TbLaD92VLOokiA8aty/K3yEphx6U=;
 b=UaySNrhcnMBhphLXzMKGf5HxIdK3f5YtNxpjFW0NR9vmthlfL7ILUNRX4CbC+aacOe
 eE2rkrYdMKGdDLOzSDvyahnD/S9Ac5G8yTcismvTl7iBQeY4UOBg4r+JAMgVVjCbjbiV
 HwIdYzKX3/tCrZdOMcTzUbRHK0F5DnyR1IYMekPy2j9p1hdLU49b6X9iRdoXvw/g+MG3
 8lPyI+kmd6y95opHphlmpgSepUKX555R2W+a+osE8DIGReosnSDmWFClrcGn6ik8ErAT
 Bhvxu8sNXA566R02Q9it1l0uIDna3LmeXFHrGDqH4sCBbYJId0ytSG133HMCh2DNgdh6
 A9rw==
X-Gm-Message-State: ABy/qLap6T60zOVctK0Ht+wJdTW5o7jiMSBwGPJLsdxKanFVLWxTm+Qh
 3WOmlN46Mu7tJTxZHWBlJ3EkbMxYbzQ=
X-Google-Smtp-Source: APBJJlFB2IWSuJqPOZ0mnAirjzpMvgtiAy7jIYhdsrG2Um9JsszVEt9Rwwb3kRNqPW9sFDuFQ2tKVQ==
X-Received: by 2002:a05:600c:3b1a:b0:3fb:c257:9f48 with SMTP id
 m26-20020a05600c3b1a00b003fbc2579f48mr309852wms.16.1689629641722; 
 Mon, 17 Jul 2023 14:34:01 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1ce906000000b003fb40ec9475sm651950wmc.11.2023.07.17.14.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 14:34:01 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:33:57 +0200
Message-ID: <20230717213359.106368-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689629642; x=1692221642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AJ3Mjusd3biw093TbLaD92VLOokiA8aty/K3yEphx6U=;
 b=ZJYZPGwv7ybCuJwj3q0sMbvhT+SOvHqaBkgrAFQLFu9lrfTNmeQp3KHfLhTN4l9ZRK
 N4TmPhsNKBkwuWmjmQMPdGSoODLGnWT2Nkd8bqhVUvI/Azp/Pqx6CuU0qXl+bNjP6V66
 jRHEG3ReDSP75qQ5r9pX2YFa7ALZvrCTQwaS4P2mDU02XOIDT7XVdS3OCntWZsNxMHPd
 P/b0a9Okw390OU3GT7KpORKQBRKohUe7iOTAfBYU5J15SfLpPxidQIXDomlCB7GY7n37
 BtCy+wJRxRqtIEBAfnJcnYTUlR6t8R5jHHfD3jmgcllTmShoBQ+Mgb8rusRn80VuFhoO
 ImwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZJYZPGwv
Subject: [Buildroot] [PATCH 1/3] support/run-tests: add a mode to only
 download emulator builtin binaries
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, emulator builtin binaries are downloaded after the rootfs
build by each tests running the emulator (Qemu) on armv5 or armv7.

Due to download quota on the server hosting theses binaries [1]
some GitLab jobs are failing due to "Connection reset by peer" [2]:

  ConnectionResetError: [Errno 104] Connection reset by peer

In a follow up commit, we'll add the possibility to download only once
all emulator builtin binaries to pass them as build artifacts.

As such, we will need to make sure that run-tests only download theses
binaries, and that it does not run the testsuite.

Add such a mode, with a new option, --prepare-only.

[1] http://autobuild.buildroot.net/artefacts
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032417

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/run-tests | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index bf40019362..e8c540f370 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -8,6 +8,8 @@ import nose2
 
 from infra.basetest import BRConfigTest
 
+import infra
+
 
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
@@ -23,6 +25,8 @@ def main():
                         help='output directory')
     parser.add_argument('-d', '--download',
                         help='download directory')
+    parser.add_argument('-p', '--prepare-only', action='store_true',
+                        help='download emulator builtin binaries')
     parser.add_argument('-k', '--keep',
                         help='keep build directories',
                         action='store_true')
@@ -60,6 +64,16 @@ def main():
 
     BRConfigTest.downloaddir = os.path.abspath(args.download)
 
+    if args.prepare_only:
+        emulator_builtin_binaries = ["kernel-vexpress-5.10.7",
+                                     "vexpress-v2p-ca9-5.10.7.dtb",
+                                     "kernel-versatile-5.10.7",
+                                     "versatile-pb-5.10.7.dtb"]
+        print("Downloading emulator builtin binaries")
+        for binary in emulator_builtin_binaries:
+            infra.download(BRConfigTest.downloaddir, binary)
+        return 0
+
     if args.output is None:
         print("Missing output directory, please use -o/--output")
         print("")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
