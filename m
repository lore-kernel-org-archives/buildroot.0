Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE3C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8775480DD6;
	Sun,  6 Sep 2026 12:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gvqdfcfvq3aT; Sun,  6 Sep 2026 12:18:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B8ED80E38
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697132;
	b=ZVeHVMelSFTzn11C/A21i1aJjkXKSQxoN3MV5R94ZGS9JvtPEzONkFKpJRxQVKdc8lxd
	 LMM4m/wiJI6PH63IoKsbBkvLrso0hE0Ip/29wUDcA+9w6wb21RyFk415cWloF9XKvhwTV
	 PsyfTqMJVb2gh9jikD2hOaRl9LgiRnYD23vE6eiJECslualHTkLZHqn/9SximGWcktVea
	 wERR1Sy+yyAGAgCoFnPzPYd71AxaSsUqcZ6aN2H6fsiEzJmXc+o9G+6pJ8IyzZinB2z5U
	 DT5fd5ap2ytCXfeKjKS1+7JBew7sqPAJz3KdGaeEimCVjNrbDP3/WvL9p1fhSjDscFA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EWk3fHPP/qUeJkpnpINNt5ormSZG2zJ6+MR9vPCurqM=;
	b=j9qnL2oEzi34rUszwra2HJiy/f3zHN1fId/AgM8b0QeV96lE+z16DL1XxdU6a4kUsY26
	 q6ogaB2QbtQ5b4MZHD4+yP+qGKGdE0YlGHjZIS8of8pFmbqnzyJL2pKxvGDluB+Kddfi9
	 lv+Bj69449hwM6aeIoeXf9lVkPwY2KYrfreG3c9h30Dh1LdxjAM2Idz4ajsx+qEyL3B9y
	 5jcHFL+0hQM+izJU/tIRHwq9Ne4ojM4s2QJ/8S/x42L3fT/hnWCSC5ZpX8bp4pWF4OWNv
	 9EG0YS8o8uYthFwWFkHv4GObM9qpH0iHKTj1fJ/GUn08NhyH0o1UYjyru/80XB0Myrw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697132;
	bh=EWk3fHPP/qUeJkpnpINNt5ormSZG2zJ6+MR9vPCurqM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iZ4Qo32hgqmowyAi3oHjAaGSb90RtUm5pHEbyxXfgPLUqqmDg5LZPYHRIZgMWLHfK
	 E7pH78JcLXi7rE4i6S9RqmbB5Q9W5NMvFL2If9HalZ+/AwTBACOh5tyI1Q/PPFpYWN
	 gr0eKa1GGU5vNDYovoDRi82PgzENCCFZbJw+ECnODASLjDLtYYHCSkRXLwH1XBUTlW
	 gzoYSQlrVpX/HazXwPfYkwufPHd994DCcR40ysd6i3Z7HvmV+iRAolZMa9M1NVRZtJ
	 PvYfRwbPxTiSTMQwXWJIAe80P7iLxHTRL78OFL/tOxJ6+XzmBgPVThNtUkM0aDjk+v
	 grBY2TMURcFiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8ED80E38;
	Sun,  6 Sep 2026 12:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31D0CA58
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A8FF80DD9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQelLoAqItmP for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E117480D9C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697127;
 b=gf8YpvI0+oJRaMVy6MIwqXvYpKJybLCoqgoxC4rAtOAmMXCrlMDLcgj+PRgM3oX/GOQE
 CqA7lZqH+11h50rmmNw2bbtYK43f0e1nP7YfcHKb3hnwQ0VF2SfH6EIATXCkOB3WNK0TI
 NfFddZBFIZxFw8mjxjwbMKPJTwk3SpvLhV/CYOkTSlp6OQKC/dWAVGuD+DmrWG9iZLYkM
 1x1j10/rByFOdHqyGHdPPEHCFmeU4BVV0VUlPt/FN7NxTDagdfruKp/dLivNDwObRPNYZ
 xVJFu5+B7+pLgfc9iwSxjxcq47Ml2Z9yz/0Kb9hcaJVHGMl+mqmZ7v/XhpNohvTpecw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697127;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZKwb0LYI2TGSos8Z9W7MDBezF6RaNCmqp9C8PmESk34=;
 b=gyA7mTroQDY9dEp2wP3xKL9PvyCelndKNzDosJTMbM+XG1HFbe/lT4eNiI70qvBQKOn+
 xojZeFTU7wHnvTGPoQ+RAV49hEPpjrAoawHbyF2OUP9rZwlmVPyVvV8NSqlxNb3kmh+kk
 PiIgFpao8dWJLprkSHPdYIgfF2HprT6voeF4EMJ6awwpRDStULhvOHWwSfjCAz1NqcZPs
 H8IniAJDwJW9Ucib038BNs2/wtZ9xtQG+un1pp9L6NFpPgS5w7ktSrmSNiygso9Uf61lo
 tkN6bst+KottcMdIPwBveQW6kO2fSHNfyx2k20zx7nWpo/4rzHEJ6JmWPea6cY1OoDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E117480D9C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6622095434; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1e25fe7051be4463ce58e492e2e0e183219d449
X-Git-Newrev: 6528b3e3f86d08b473fc5eaa85575d4aeb3e9bad
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.6622095434@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 7.2 headers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6528b3e3f86d08b473fc5eaa85575d4aeb3e9bad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/from-6.17/linux.hash                                  |  1 +
 package/linux-headers/7.2.3                                 |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3c5e96ef4c..3aecea4fad 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.2.3 b/package/linux-headers/7.2.3
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.2.3
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 433fb363ee..365fe11931 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_1
+	default BR2_KERNEL_HEADERS_7_2
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_1
 	bool "Linux 7.1.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
+config BR2_KERNEL_HEADERS_7_2
+	bool "Linux 7.2.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -133,8 +137,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_0
@@ -479,6 +487,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
+	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 128f8faef2..ad73204b14 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -684,6 +684,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -697,6 +701,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
 	default "6.19" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_19
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 003887f025..721fd272e0 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_2
+	bool "7.2.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
-	bool "7.1.x or later"
+	bool "7.1.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
