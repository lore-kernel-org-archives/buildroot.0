Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F1606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AavO91+r
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85761811F1;
	Fri, 30 Oct 2026 14:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VWALFbyhHId; Fri, 30 Oct 2026 14:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D25C811E6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369197;
	b=oSgK51RKHVpvdgkDrtJQj1h7qIhuv8V4nTEILla74a9gDV6ulRFYpC9r3HL7lcaUJ3ke
	 35iuuLONY3yUFtOODq70eB9O/O0c3YIPQED2LLYteA3jJ7wx3LTaNATsBCIGA5WKYRw02
	 MO2oGpbqDOUfqP75ODV4duwvsopgKsmoNBQQieCvm9LzBxT1sxGkJBSCOM458IfBlja24
	 SR4WVaVg7flfHRGvo/t5mVj5iomeaKTFS/qZRP5vTzW+7VY5ESFymqIWLAtGqWMOwI1Y3
	 quJodkFBaud0x0RFIseVArGdfcqPjjeZE5taF/QXJsDQRJGZlQ77oPEAHHML70rKGvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rp795R/iVBB/ywy/7XEi4LgJsFBpIcFNyQ89I37yPY8=;
	b=C1MpsQZoxZt7lozwVb1oh1kiNX7oUXZYtXTPuSp4FoSXC2U39MyvXQMiGPr2UnlBuAay
	 nJLB1N+iUIIZ/X6H3KJ2lpH1pwXUXheJVGxuJV5hPGcUa+ecrsd6OUmQEwKvcNd6ddVXE
	 ppe69aQ5LWytqjD3oPKr6tztXoVspHfoI6M+K0EAzUqenVoEC/p7/94EJ3RTjNZgeeSD3
	 wydXwrSHCYjknmxw0nDy+SUWs9q2/c/13oy9gJ/Xm2Fr4a1vzvXLebM3glpBMOTbQx2mP
	 2HsAaOP2oZNNvHstfEa/Z/DicqTQ7aSoZgrrbd9Je4JOI0P/GGQlY3yRuD3QbZE4a3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369197;
	bh=rp795R/iVBB/ywy/7XEi4LgJsFBpIcFNyQ89I37yPY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AavO91+rB7l7EEhYHdrrC0vPdjs4JzKrwERs1UjYnu5ZRwtDxuOGndHwemm+/ttPC
	 wMrzbRuddu9XyYaSXCg5E0dfQNPz6k5DF92ypbbNCQsFX6c9JRqGHP3gqbUG2iRdRg
	 Gqk39Q1/NzyMEpQuTw2DovL1I6G9++jKImOrxpiqyzWLtO9IUVWT54QWB8v76j5AeA
	 u6PRO7VRj8JgGav5n7e6BNa41LIRafN5i2ViLy54fkFIl2EjtDRgj/yqtLZ4FgyHv+
	 mBkzp7yTYFzZrGk56NUmgAcUilasef0iddP7VJ58JZJ73RuolP3y8dTNtAGUCvTvyA
	 7q+yM7GLXb7zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D25C811E6;
	Fri, 30 Oct 2026 14:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 761A8D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C38260AED
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvqJuIDgEekH for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7F25C60AD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=ZZSAJL3bitfhIpU5z8GVKXEEaHbWYAYQ+zhWtQyfbtDhnpl9SkkdP+HSKKjMWj36OT1u
 3CWItk4yB8jBp7+Lf/YeAfNmPQdGNUQv2GeewfB+VGg/yHVYW9XDy1Q4Roy4rMq9Ui1gU
 sPWSNEOlslx0Pwz7syS2vfWA5rMiB6MYBNqVamfquRPoENHZf7Uk6M/IaDOLvTX+nL5QY
 IQGyKTEL3XFTkfMKKejHE7/gr00EmkEwfRZ3PPbgUj4vXV8hgaN94XdeTj5LxLifzIAGQ
 n3LZ8Y4YhsEUbbdt3hVVNFQz30su/fjOTioNKpRQqZKMhtVrqQqInzERp4/FlJFZM3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tP5sd+6kt1khMMXfcFSS708KLkygssYDposf+OlV/z8=;
 b=dv7mr9CnL/35erH+i3iagwBIJ2WzEsC2z2MSOu6ULXbxox41aEIbTwhzFgcppYBk2i1v
 4UWX+myd5ajygEkMBWvCjBb2ksIjlyAvFsgZn0I9DPTpiJWnFuQrbD8uO1NGkZ6Ua19jD
 0hidpUM4pAwNCpfIJ2d5Oaci5TYI45M/Id77y1OZeX04uqiu1raytpE/WmWL5lgVbDPmD
 iFNRDu7aXHDFqYjcLJV8DPuLHJnmioFz7vKDRFim8WMTo/aaUNqIBSjWIO4+OoJ7Exc/N
 OJWGzxyQ63ySzVusn6w0F3VpLoukniH3niCjEhDoIS2+62oGq/lasaoGWb+R6Q64Adw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F25C60AD3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 929B79D38A; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e41686f0c6259ba8cc9d31882f82c7ab7d1c1a14
X-Git-Newrev: ddeab96e14b646fbc1f2de5be044d95f29d97076
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.929B79D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/genrandconfig:
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
Content-Type: multipart/mixed; boundary="===============3691369250287402425=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3691369250287402425==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddeab96e14b646fbc1f2de5be044d95f29d97076
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[Raphaël: fix conflict in utils/genrandconfig]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/genrandconfig | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index db03af83d6..a30e9fd778 100755
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
@@ -115,6 +154,10 @@ async def fixup_config(sysinfo, configfile):
 
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
         return False
+
+    if skip_secondary_configs and is_secondary_config(configlines):
+        return False
+
     # libffi not available on ARMv7-M, but propagating libffi arch
     # dependencies in Buildroot is really too much work, so we handle
     # this here.
@@ -545,6 +588,9 @@ async def gen_config(args):
     else:
         configfile = os.path.join(args.outputdir, ".config")
 
+    # Skip secondary configurations 90% of the time
+    skip_secondary_configs = randint(0, 9) != 0
+
     # Now, generate the random selection of packages, and fixup
     # things if needed.
     # Safe-guard, in case we can not quickly come to a valid
@@ -568,7 +614,7 @@ async def gen_config(args):
         if ret:
             return ret
 
-        if await fixup_config(sysinfo, configfile):
+        if await fixup_config(sysinfo, configfile, skip_secondary_configs):
             print("  configuration valid")
             break
 

--===============3691369250287402425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3691369250287402425==--
