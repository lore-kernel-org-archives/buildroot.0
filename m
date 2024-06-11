Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB2C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 15:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A0140637;
	Tue, 11 Jun 2024 15:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrDWNjFi6uFb; Tue, 11 Jun 2024 15:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2118A40644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2118A40644;
	Tue, 11 Jun 2024 15:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19A1F1BF391
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0690D816A4
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 15:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghIAW_pYQwpo for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 15:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EE3C8164A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EE3C8164A
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EE3C8164A
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 15:31:37 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-254a9b89be2so688793fac.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 08:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718119896; x=1718724696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LeLgxYNehHu1hX0RJ7cYJBe7F7al1B3KsN6o7fLIUgs=;
 b=OmtACYSEipSf3ehjnt74gpdOt8DCPw1XNa1UgeUmheXT0ILPN6mmn0kmi1y91m1nxI
 rSUfeK0BzElXKmPMtbzjbGlqDCXgyLoeXFpdr9fQJ5E23an26FJLR5AnPqRQhZbLytSM
 cdhnK2tvhWYca1RFVi6LZzKpuxG6BfPrBtyrisqgsKZLNEfIAAuFG/96zcafKEhvN78T
 SeB6E3ZnHLDjMpOJLKjT036c/vKIe5o+Rq7JmptuXqCBrjoI3CgW2mI63O5+OlmeyOPi
 yeCRyqV2xgtGKjyuajUjHuPhiI1gxff5V+s15SRKQMIJ1dueJABJuK+LMhS5/0kp7L3y
 ht3A==
X-Gm-Message-State: AOJu0YwRAJgPJsEROIRFU1HzQ0Ihp1Dkt2iDHejxKet0aOalwlZq4YiL
 Cs/b7pihSd3z4pl71pOA+vkCpCJFqe9epE2I4BYmmPdjXRnfdV5MM0Uo36ir
X-Google-Smtp-Source: AGHT+IFAi21eLHJfffwJtlZc/dDfhCSH8vzDFXa4fYwdm5/cbx9vcrboNd2qsOM3QBZr8rIM5XQ5HQ==
X-Received: by 2002:a05:6870:32d0:b0:24d:9c4d:f609 with SMTP id
 586e51a60fabf-254647f0af2mr12970421fac.38.1718119895931; 
 Tue, 11 Jun 2024 08:31:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b7a23808c2sm3063743173.113.2024.06.11.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:31:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 09:30:40 -0600
Message-Id: <20240611153040.954034-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718119896; x=1718724696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LeLgxYNehHu1hX0RJ7cYJBe7F7al1B3KsN6o7fLIUgs=;
 b=g0YUL9kdOQIhavmE4Ktkm2QFppG7Laag5tVMuGv2N8VGoRW35bI11kPBEEq0NghdE6
 X2nnuAb1iFL+K5fFE+Sc0whGrzmOzKV4QjFQNst5MdsaSGFgzBdl0WztXTFstGnLHpkJ
 7I4vzlDvxxrLkh1mt0Uftnf2kz1UvD/uv0hq3jxKc/Occh+U5N33oYtRVq/xdkM7aFh6
 3JTwV5sSzYifeaKSjdn7QBxmf1GoLQa3LIgDhkv2sbCt2qI+CqK56clu/D9nDZvD3+eD
 85HQd2tLAkvxZNp+NzNWBcfBzbXwA0waO422vN3OhJlVnYuSC2mbyB6DhfE+MZsJM/qx
 uvWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g0YUL9kd
Subject: [Buildroot] [PATCH v3 1/1] utils/genrandconfig: allow overriding
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
Changes v2 -> v3:
  - rebase
Changes v1 -> v2:
  - rebase
---
 utils/genrandconfig | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index fb493f3f31..b5e250a24f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -736,7 +736,7 @@ async def gen_config(args):
         proc = await asyncio.create_subprocess_exec(
             "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
             "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
-            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
+            "KCONFIG_PROBABILITY=%d" % args.probability,
             "randpackageconfig" if args.toolchains_csv else "randconfig")
         ret = await proc.wait()
         if ret:
@@ -764,6 +764,21 @@ async def gen_config(args):
 
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
@@ -771,6 +786,10 @@ if __name__ == '__main__':
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
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
