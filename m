Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C64606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AM+gjTM6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AD5040DFA;
	Fri, 30 Oct 2026 14:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkeiWLCgp4GH; Fri, 30 Oct 2026 14:20:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 681E340DF5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370016;
	b=g2PVr6GehqsKGGHeED1TKNPD2ytBg7Wo3FkLawG9l5zEL/qv220PCddjP8DyGrHGDUEg
	 YBaFWgHnqTr6+P1SzXLVW2oH3c/5/ficLnt2RaW6Jdo4WgsJofMCKLsKfK94K63kbTKR6
	 NBdSBZhChtwBTbC0yj5oi8wmSpMUSBC7kYF4be4K0sfqGRZkAG22rxkoZgl5YelRjcvuQ
	 7QkPNPklkj0aTV5GATekefyy1cLvYMOas6H1toCj5EMSXgoVzdJEy9gWyzHqc668wiyPi
	 mnXsqTrMhDpBJfu7i0S0l5F2x9hDl7KhI1Ow+WPGpHKIIa48qhuQgwwWTpMXlJ/w/pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1pVJ3fdV/AESXYmz4T2zDernX8LP3YcsD0Jw0JcJizo=;
	b=nZxjBZtiiXGQzAsA3Y+ITsV8uguS+Kv7kkxSdnhImwVEUEWZFVLUyqLT+iiuJ7jl7jVI
	 Si0DgVem0oDtWtAWEzrMip8Y4IKlSivFeZ0FpcSVjTEEXXcwS4uiBmwpwpkU5Ic+o21m1
	 fImjlWVhTltm5njUaLFrfZcfLwWT81zllDtcVE7Pngzm6R6ipWL1eXX7lyzH/7zyHHIH8
	 yKYsQg8mAKKusc8U9yXwfmMKEH7SGHHVrEvyWHnghiYLDpaOS9Lrn/F4QhC/dLnFFHQX9
	 S1Egcwgz3s4JGkyAfZcglDih80/lwv41JQtiSBhmlO5Tao2Ucgu8+4kPJys26OHPe4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370016;
	bh=1pVJ3fdV/AESXYmz4T2zDernX8LP3YcsD0Jw0JcJizo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AM+gjTM6NYG1XkJACGswypCbrZ+aJLMbNIDDjEK3lkZtAFWiRQfotIHyiCLWEijRS
	 GWZOA+GD9iIZQQuWYvQzA65Bttkgon6MN/gq0jGgHAteESkPdOfgFQZNKwf3LaUd2e
	 f74xJM3DI0oYc3ij4nlKr6ohdT86BM3/AxnE9QM45jylPxsEWFPsFYwO1M5N7YXi0B
	 6VfzDR8YD7zyhmPrPQxWeOX0QnvqMNxcYDgsGrbU5z1/5qN0jCPPdiPTFSPsUlhXG1
	 dmO3hp/pTVJCUkvPtkn69c18eTt4LK7lvHYHjRHgNxajY/hLcrHCMePbpglz10Z1Hg
	 ttVhEcvtHfKxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681E340DF5;
	Fri, 30 Oct 2026 14:20:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5FB2712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E2F810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNaEiq1SmehT for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F34C5808AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369887;
 b=bychu/tV/YZEQq1Ga5m89mwDxr60evGTVRqdf2sf7maymJ7bFeceLRfq4tHBSf8OCrQe
 jF9AZ2BLlSn7xnB0rDubuNKMpTGdzSth2GE+edk661hApXz9APyrxGxP0CBTPj3ckasg8
 36mIDvq4kDqYFAHYxzx0An6jajw2rtMikk7SHveizLjz6n0FvbHh+A3JMOxuB4rcHKbuR
 FLzk0AbCF+gFdHvSTtDfD1UxccGP1Fmu1lpkNM7yAFRRSpSQH9wgmdl69OVOuXcHt7poK
 wh94q3dKdPqEQEYoQQSH1o2ZxB7pcOu3o3km96ZTJFrSsJ40n/TyPHM3oCSDPm6Ufyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369887;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9E/9Bygxg89HgyXfh4fRZkW5Sx8IJJncqdciEOxdiz8=;
 b=ehJwn6+TRfGkOqePFRGKnmX15/U78Hdd3QJtdo8mGjoYqidjUx14ccQsi5QJIK2lgSgc
 6q2BuDBhJ5MfFSb+kaAaYSo87X16nWIFyJKQRmRACzca+j8e5AVjcZt5ze6jDJFOgy6l4
 bqiVNQK+4WYw7M0Kwflwqd3bY0iH7WM7I1gru2p26pIIEsLZxbi815tkyOZwSqOF0dywH
 jT6mad+M1dA8ASOMZTL0kjuo8p6YNB5RydIHnGZyzGCBaEKdxOjlZ8O0QO6NEcvZcg/gI
 hVeejPHCcjuNCK1yPgUEvIzEstUx0LnDd5oIOJjBpgpgrjWAzc57AjCx+osxrbFVM6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F34C5808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D29A9D388; Fri, 30 Oct 2026 14:16:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 62788bfac49bb62b8c70d76a7a2fa77596581164
X-Git-Newrev: b5125bfc4fabf7926c1aa5c97a405971bb8eb3ff
X-Patchwork-Hint: ignore
Message-Id: <20261030141639.1D29A9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/genrandconfig:
 implement secondary configurations filter
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6646606123234159118=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6646606123234159118==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5125bfc4fabf7926c1aa5c97a405971bb8eb3ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3f718b33612ef2ab09640dcfd41cf417312302a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/genrandconfig | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
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
 

--===============6646606123234159118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6646606123234159118==--
