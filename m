Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B4DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6711460D91;
	Sat, 14 May 2022 21:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaecXtQZm57s; Sat, 14 May 2022 21:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6905E60E14;
	Sat, 14 May 2022 21:46:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97C7F1BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8324060A6A
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQ_kuhXvzdZ7 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC55B60806
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:46:15 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id f4so12352198iov.2
 for <buildroot@buildroot.org>; Sat, 14 May 2022 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2nunrLvxpp80zrUrTooQ5Z6n6O1xKvASkAo7AXGWVI=;
 b=bpNvWgKYXzs63W+rJkSc8bO61DSaeSyjFi4BIVcmJ6XEyp9uJ4HVb6LzbkG+RZyF+V
 8eliDopWYcUzGwui89VF3jtoDZyl0VJ1lGypS5IsCt9n0+A0bjqSDpnIgwA07tBqeAk7
 biVseERavIy7MZ7Vj+1jn6/EeP9FkeLtxOQcOj63KHl/z2z9z7jKfsH3OhAJjpouZJDx
 He38xZg5WT5Koy/0/UQFJMb2kdZMw/kZj8apsou7qxS41HhuXTi7SxTTB4rMweaAfmuB
 VJO6MnifqiNdmpPe+B3tq0rnqdd1Z5fnMsNdHKaG2TONINUjj6pcQQXxMayOsc2AdRmI
 r7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2nunrLvxpp80zrUrTooQ5Z6n6O1xKvASkAo7AXGWVI=;
 b=f3BAHmRfG0ZD5KT/2WzYOg6YDfLwryjchDoI2JW4iLPkBNc6p3Bjci0LF6LlTHfKGp
 NuMfPNPsXs0y2xs06u1Wcv+eB7w7yMkwp83UBtyFCtuPNRZwPcjs3/KbtpkXyb5RMARb
 POe/ve8Cpzplp81tzifrScqjQJaB31e1LQTGnnummpFc7SeDRItRFY5l87mAoFw+tdNq
 pwAIwCibGcTcyJ3AIRjNV1A+btMXoLd/6STxx7LDWqxftrRofrkkG1yaJlZHIKIUoHob
 2g9Nf90PrJGjd1vIho1kvKKh/6C0BDfFGcdsQRh/rU23TCDYfIDebo4kUkSHyBjtmSXF
 CDSQ==
X-Gm-Message-State: AOAM530hWb3T4Mgzv02c9BGN+dKP1n8jytxczJ2ZZ/VlM1qNXouVGcEW
 ZrDrq92SmCuIS9AflkuncyVSDY+UeSU=
X-Google-Smtp-Source: ABdhPJxqWyOWx43/FBRsDKXkj7VHteiozs+XOe4aJCMYNDsnT2aPrnfTigxKKh6UaSYETFIRHHLR/A==
X-Received: by 2002:a05:6602:160e:b0:64f:8c93:6a40 with SMTP id
 x14-20020a056602160e00b0064f8c936a40mr5048055iow.8.1652564774412; 
 Sat, 14 May 2022 14:46:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 k16-20020a5d91d0000000b0065aab053448sm1599881ior.21.2022.05.14.14.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 14:46:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 15:46:12 -0600
Message-Id: <20220514214612.3221647-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: allow overriding
 KCONFIG_PROBABILITY
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tweaking this variable should allow us to get better coverage of
packages with larger dependency trees.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/genrandconfig | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 60ef8739cc..13be613691 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -615,7 +615,7 @@ def gen_config(args):
         make_rand = [
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
-            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "KCONFIG_PROBABILITY=%d" % args.probability,
             "randpackageconfig" if args.toolchains_csv else "randconfig"
         ]
         subprocess.check_call(make_rand)
@@ -635,6 +635,21 @@ def gen_config(args):
 
 if __name__ == '__main__':
     import argparse
+
+    class Range(argparse.Action):
+        def __init__(self, minimum=None, maximum=None, *args, **kwargs):
+            self.min = minimum
+            self.max = maximum
+            kwargs["metavar"] = "[%d-%d]" % (self.min, self.max)
+            super(Range, self).__init__(*args, **kwargs)
+
+        def __call__(self, parser, namespace, value, option_string=None):
+            if not (self.min <= value <= self.max):
+                msg = 'invalid choice: %r (choose from [%d-%d])' % \
+                    (value, self.min, self.max)
+                raise argparse.ArgumentError(self, msg)
+            setattr(namespace, self.dest, value)
+
     parser = argparse.ArgumentParser(description="Generate a random configuration")
     parser.add_argument("--outputdir", "-o",
                         help="Output directory (relative to current directory)",
@@ -642,6 +657,10 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
+    parser.add_argument("--probability", "-p",
+                        help="Override the KCONFIG_PROBABILITY value",
+                        type=int, action=Range, minimum=0, maximum=100,
+                        default=randint(1, 20))
 
     toolchains_csv = parser.add_mutually_exclusive_group(required=False)
     toolchains_csv.add_argument("--toolchains-csv",
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
