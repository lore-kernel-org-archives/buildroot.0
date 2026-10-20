Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E143606A334
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iXVl9q5H
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB5280DC7;
	Tue, 20 Oct 2026 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16aDpOr6OcSb; Tue, 20 Oct 2026 20:27:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E854480DE4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792528031;
	b=qx0zVyrUX30BEca4zE+ArIl0eAJHmzLkeoHkzob6uaYGUamVb1fVfu6Wm/LHEm9frgFR
	 C7fzK7v3Fm0O4/PDhjw0tjXkPK5emM2R0zcUQYCDao0T5rPKG8+ON1T7p4DY0Kl8bNWxm
	 DhC0YFNO8JvImK368BTf2x0KwLQI+LxEzZVluSkow8uLW4cg7w5EgiR9tt1kZjIXIZNpx
	 7eQx0nHhOlWSqGT5ynWEO05f2WYHdqkk0XMHiYp/FxRelZFRQQGLIzhtFjzb2f0bTR/n5
	 XN6CKPQOOfquVM63hZiNRJ5L93yfm87Q7CEzEavg3lkzUuolX9CxY4h3h9w/X9iwwvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792528031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IfGuEyx+urEyal/siRMyXTQ/xA1nNd6AB50hWgSwf0g=;
	b=BMy2cZalr+xgTqpx0nFwhI+DIfNFhbUVYOEco0ZXJGvhrSgSbWzrE0JmTsymxTrzoxE+
	 iBvm/KDP6yurBuXCIkSDaIkwojo/ACBOF//IL5LtoKt1fQOHpuSq0kp6CHxPxU5BikYY4
	 GhP+L1YkBNMvnCUUwnPHKCIN5S3ZVfZ5+PzU/PKvckjXu5iaYzkxljeWDaasjNrJh+Bsd
	 WxgP3j1QyEFXxJGH6ZyA2PlK3cMRAWKylVmT0j9Wp7qunQnJm4LtNAwDvumqNh/JYiWnz
	 ZcCSLkHqvRtMdZQ988zYpEq7U/6DBw4rVp1UsOg4bWy/gQ+np11J2CoAhuSlAmZEoRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792528031;
	bh=IfGuEyx+urEyal/siRMyXTQ/xA1nNd6AB50hWgSwf0g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iXVl9q5HqOAzkC4KyI2c32+Ft4fK8ywE7vpCz0ZYB+adx1LYBaUBnKS2ejD305nQr
	 DLSpWpSORarKAecM2LayqcymYxuGe4oMRNaUfvo0C46DYni95MGLCrq3aiUgSAeKsD
	 l5vfCFx851Gj6T2NzuMWz/7Cdv0goHayXq29a/iQpV/q4FBB8opvGYc6NVMkQqiOIm
	 reaOM97zBBf6+ubdg1VGxZai9Wz/70vOoRQyk/JUjZ7N+0g9zCZZgZIYl8aPUS0gLt
	 74iN2DNCENn5ZFsEuWRgYtfSUeRF5nt3mUlMsWVsvATFYCxAVk7bTU6O3dFPtcEvMf
	 YT0V3FpD/Ya7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E854480DE4;
	Tue, 20 Oct 2026 20:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D057F380
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B634140112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8woYza7ATYZ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:27:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A32D84006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792528027;
 b=B/gbxvfCfemqEqETr6ZxsgtlJlNHJsGLxlb17XMhGWCrNpLoJuABU/ezFz8Jb8nZeb8b
 sTEswtml0wgjLZPy8IA/KcLVf/qcsflu9dva+pRB2jAw6mPLbeGB7m5k9qX7QJSfRZUzc
 +9Jj8rgO86E0SjxsV4LjVjmBDxrYatXd6itc50+Zb2rqFXnZTfiFzkstDmSLATcyt7VfQ
 oKuChWVCOprZRE0cUJZFclbRAkphIMonzILDphOx218JA9BlLPyYf9RKG0a68Yu31t8Pt
 /dTTGBiuBWfQy85AiQ3vqeRZfbgxMzE9zF5I+mmmjRqKZde97RhPfCb5YAi1H0LD1BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792528027;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WXHssGC28dowfD7X21q0vAdxxiRyB4ZPYTIKc6x0rDU=;
 b=bQsouLScWVn7m3yoqdBJKhksyOZYEGr7vrfRUP102QCW+G7iFmGfPHTpyks+yjqYFQrz
 1IFuYInvtgDoZtLhdCu+yshdx4H7o3wzqIIAGjHG4OnPBn1sTGETFqyo2vAMaAFvL8mIO
 m2BvA0u9uaOmj0YffzSbYr9ui7p9Cep3fuYVkrI9RnL9Te0LF8GypdRc4TxxfhPYkQKKF
 /kQdHI9UhdBdeY4yngowYnv57A/o31HxhDeKzmOJT/RUexTqE9Xwhro8IGvuLVSpVb+/E
 WKE4ZI254YdFRGAMD3kkA28K2nf9aPWTxgneRiDBAa6ra7y4o5QZrXgVOtMgZ5mwotw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=boEIXK3u; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32D84006F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:27:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 01B5A614B6;
 Tue, 20 Oct 2026 22:26:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 20 Oct 2026 22:26:38 +0200
Message-ID: <20261020202639.1094960-3-ju.o@free.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020202639.1094960-1-ju.o@free.fr>
References: <20261020202639.1094960-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] utils/genrandconfig: implement secondary
 configurations filter
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] marked a set of target configurations as
"secondary", with the intent to test those less frequently in
autobuilders. This was implemented by adding a Kconfig "depends on
!BR2_HIDE_SECONDARY_TARGET_OPTIONS" which was controlled by an
environment variable that could be set by the "autobuild-run"
script. It turns out that "make randconfig" is not selecting random
configs amongst the available options (i.e. following the
dependencies). Instead, it selects fully random options, and if a
dependency could not be met, the default choice is taken. As a
result, every time a secondary architecture needed to be filtered
out, the default architecture was selected instead, which is
currently i686 at the time of this commit.

This commit reimplement the list of secondary configurations
initially made in commit [1] as a filter in the
"utils/genrandcondig" script. This commit also adds the following
x86 i586 CPUs which were missed in commit [1]:
c3, geode, pentium_mmx, winchip2, winchip_c6

Since "utils/genrandcondig" is called from "autobuild-run",
this commit fixes the too frequent i686 architecture issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/ddce0814a794b27a6449b144f85c90fa53e92ac6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/genrandconfig | 49 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5cea529354..e6655fe189 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -99,7 +99,46 @@ class SystemInfo:
         return not missing_requirements
 
 
-async def fixup_config(sysinfo, configfile):
+def is_secondary_config(configlines):
+    """Identify secondary configurations.
+
+    This function identifies configurations considered as
+    "secondary". This classification can be used to skip those less
+    frequent configurations.
+
+    Returns: 'True' if the configuration is considered as "secondary",
+    or 'False' otherwise.
+    """
+
+    secondary_configs = [
+        # Secondary architectures (including all CPUs)
+        "arcle", "armeb", "aarch64_be", "hppa", "loongarch64", "m68k",
+        "microblazeel", "microblazebe", "mips", "mipsel", "mips64",
+        "or1k", "powerpc", "powerpc64", "s390x", "sh", "sparc",
+        "sparc64", "xtensa",
+        # Secondary CPUs:
+        # Armv4 CPUs:
+        "arm920t", "arm922t", "fa526", "strongarm",
+        # Older 32bit CPUs before i686:
+        "x86_c3", "x86_geode", "x86_i486", "x86_i586",
+        "x86_pentium_mmx", "x86_winchip2", "x86_winchip_c6",
+        "x86_x1000",
+        # All RISC-V 32-bit:
+        "RISCV_32"
+    ]
+    for cfg in secondary_configs:
+        if f"BR2_{cfg}=y\n" in configlines:
+            return True
+
+    # We also mark RISC-V 64-bit noMMU as secondary
+    if "BR2_RISCV_64=y\n" in configlines and \
+       "BR2_RISCV_USE_MMU=y\n" not in configlines:
+        return True
+
+    return False
+
+
+async def fixup_config(sysinfo, configfile, skip_secondary_configs=True):
     """Finalize the configuration and reject any problematic combinations
 
     This function returns 'True' when the configuration has been
@@ -113,6 +152,9 @@ async def fixup_config(sysinfo, configfile):
 
     ROOTFS_SIZE = '5G'
 
+    if skip_secondary_configs and is_secondary_config(configlines):
+        return False
+
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
@@ -530,6 +572,9 @@ async def gen_config(args):
     else:
         configfile = os.path.join(args.outputdir, ".config")
 
+    # Skip secondary configurations 90% of the time
+    skip_secondary_configs = randint(0, 9) != 0
+
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
@@ -553,7 +598,7 @@ async def gen_config(args):
         if ret:
             return ret
 
-        if await fixup_config(sysinfo, configfile):
+        if await fixup_config(sysinfo, configfile, skip_secondary_configs):
             print("  configuration valid")
             break
 
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
