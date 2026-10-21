Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D70606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OIadRNfA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4AB04105C;
	Wed, 21 Oct 2026 19:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNHy2lU2wLu0; Wed, 21 Oct 2026 19:22:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 86FE041100
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610575;
	b=r1fzvy/ML0dgwTezQynuIseoolCbq6YhRFE+IgUgtfMqSLKiOiOV3+1AY7D0zTqpySNL
	 QdTsQWRD3un+W2tV1CQVHJkcX14f1i/TLqgr3XDLffFgCOyC6jBF4tia35dS7JCMW77n/
	 N1sLaMofzhBC5sn9Q1+8JDL6bjBDZyBnAik/HUYjYdDnGMkQXUrV8w+e+AnNU+mR8/QCY
	 vh3QXWoNKbbN8wYs6sLUDR9Hg2C8OcKx7KSt9SQrGHT29ObpsftdOOympL62vKwNa21l2
	 rxHaF6hRKOKO+d0ctwhlx2lG4YHDN52ihTMGhnNJvZcqxcEpHmMfogZcDnJ2+CJR6Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ifvDHDaFMYG96uq4EhC8l7i3c3VK7bqf9Xjqi1GyBwk=;
	b=ULVY+sWwsGlZ3sDSohcke49RLajDaf3WIgONOZ1qg4vHk7R5dhQLiNY8R9iCQufxPg12
	 pjDQKAzzGnx5/bq1um836kf1sKPXTPxxk+Ltl74ptFcm35ua8MSFLoS9Ikn79Soow/MNB
	 zvCYEoJMvncA7vneyYnHzNkViPHXG2CCI4sfXiYFqHfnaeAdnT9rZzoLcD6revTQdp26U
	 uYbDfxy5epN4AAY7D2j10LTRPsy1ubzhcJg0RFnoYlyQjtZjadCzkBIwyy8Kfypmup4KM
	 fubqLhz2L5ckbs/6mZYn3vhriy5mHpuZaquePmL+8J3VHyQqRZKg9eh37Qxmte7nttA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610575;
	bh=ifvDHDaFMYG96uq4EhC8l7i3c3VK7bqf9Xjqi1GyBwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OIadRNfAf8ppjpRvudR0Cn3vv6aUQ8O8t8FEOqqk4k554v4E/BnEHjEIZSP0qrF81
	 +C391C5EymBe4uQjpuqIJ+/+f5VHxo22l+k/jmXjhQzFeamhyKeP1e1k+PujZ7aapT
	 eqPcfShhBqMZdhPge4HJhXirmj8hRvjFFuEACGlW+TE48I6DgxwBKzHCbIImV6hcF4
	 u/GVNvuoBJEYdcCPzL/2epmFRDwJ0LyGJ4C+fSgK5I9hSdGObayFWHtyygb76RWfJ6
	 jT8XOAkrMJ8JaWuFtPCfZosxl4gRZWOa5fxqOzf/Vw8doOQxSTRaDKjl4ua1NVoDyp
	 bemqq+yNQf56Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FE041100;
	Wed, 21 Oct 2026 19:22:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 409FF3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26AE341083
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EagLcZV7D_q0 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3782D4105C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610570;
 b=R8ZDoxXCzskKv8pYh1BcT9ipyrZjq6CDCzcdER5RkcBH+YxutIDE4JgY0a6KCzaZuHIz
 OzAPebRQ4A3KfmoBGnD9UPqyKbShVa4gSYqanVmw7DC9mcQ7vLjtoD3CT4pqAsyZEmKbb
 HFrYC30jbn+Uno/sssUJkC4cQZX+ljv+XxK6C5rl2M+4pZNdkET/UIbl3PlrpGCDfh0//
 NC732BP2zIQ3JoCStmNOhedBlLRJgUyy6IBOydqtbpFiE8x0FOexQlptXwluUuTa+X8c/
 508ErSQD/dcF8VgYnQr+JYN9MeWR8Bvqkormk2TqnzSvcEPHVETQVFXfuNG7j1fLbBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610570;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=if0Z4AzJoH4HoGAZgJmdRDe3ARk1W2PyZu+aLM+rIis=;
 b=Q4j6pQKf9+Mj50m18NmN2DANFAmmmfxpJ3w3EYHJEHeThgMsDZRYjn6Y5QocWpmUxiPc
 RNniys8t21/8qo/JSyh/jJgz6qqysmD5EviOzr6DarOyJyfOjCtV3d69DB4jk3Xh3BoP1
 02BlaI3s9PyyApbK5DZLUTDl2ilGciJm/LSuHYD7DOlHjxaxuPJA3CscTIF3dkVp3bKiP
 KBvbCsbL7LaVY5ZqlfTNcKGxxSnDKANY0Q+/hBFDS3irYBcQTzd6L4l4Y+bBlkMkkCbuI
 otPHyXpbRK3/7EnL/86S2NDjDZP4HBox6nJFWOts1g2rEHAPI4PXNQlVxxom9vs2nEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3782D4105C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A05799AB3; Wed, 21 Oct 2026 19:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:22:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07c23d76938c403ce3d1e6b4ca8849c07a3d7712
X-Git-Newrev: d3f718b33612ef2ab09640dcfd41cf417312302a
X-Patchwork-Hint: ignore
Message-Id: <20261021192126.8A05799AB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: implement secondary
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3f718b33612ef2ab09640dcfd41cf417312302a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
