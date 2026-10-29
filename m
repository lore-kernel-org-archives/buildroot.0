Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A96606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k4fdXr61
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F98640A6B;
	Fri, 30 Oct 2026 14:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLbjNotxKEek; Fri, 30 Oct 2026 14:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 29B5E40611
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369310;
	b=E0WGd1zXTi+biX9Enj2xPhUrcEZZaqtlwTBnCAlD9u+91NYfc5SD1ruTQZlCR9Hk+X9w
	 Sugt/q1bOsyivteYII13pj9GZXBiurM3905Fk6RW78/aL5LHDhp66YizF4xXGdY61QtQv
	 L3rn5vD/B1tFcQOumManQglWPUPmzwPz6/ijA01nnNcLXKWw6kiGVPKOKA3WnLOoPu4/V
	 D8LW6JL7V4Mf0qtNZaZdYjJyuJm2JxATvk9f1aS7KvYvYXrkx5X1Z8d+KMieI2eRzqLs/
	 3w6A4E1n0+dNsYcqlk0dCeWCm+Eqb4ZTvwGb7ccPon0DMUSkcQY6MVKy3AE33yaI+Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7FYNPyFvg0xcvlzY70SI2J/EqSiK00tOQcjZW5bQPPs=;
	b=qwN0A/WWy+y0k4jPqDelE04RlfIxM3G943yf3r+NIam40j4Tcmt31age27Z2nG5gM8C2
	 9SlKA/PNzi74GXCeee2ZDyvwzpYt8agiIHfLnKsMIe5/O9H1dgC8nFdFctFLxU+FiDf/S
	 JzZp6H+1VB12cQRclUhWFC5ORfZbrSehCs0ucgcf/zpJYCexxhOnrvso+Py4Dba2Vx/OO
	 gJuW3w3Zg+4PPkGAu4tPxB18VkhNymQJYEO1/DO123ZuDyCIzubWuJhw4DNA+c6y571zv
	 XgyEchCRZevCn5kzYg8UEMx34MZQXyiGfd7ycqAS2ktNQg2YXmpdEH6+OTupm1kmeiw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369310;
	bh=7FYNPyFvg0xcvlzY70SI2J/EqSiK00tOQcjZW5bQPPs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k4fdXr61x+zBMC69JGDmvzWLv+CI2n7gztkTH3K7dGPI6gkPCBWbqOF9lurCQ02dl
	 YCG6xesjEIuzORGajUYAqWF0GK8HnxdzFVuH5C+1ynP/s/GycilK6CNHqxOMWUZVgA
	 c4OHlGZhMmrFzEFk0LdcPeiMZmrGjq6Yh+g3StkcLS3kyeRZeYS6AoCFc6+BxHAgAU
	 7bRscMWOQttIm6riGRj7hDLvBijgecMoDeELlT4tRz2iGsVDPTEnRS3HDjDNtYxNeL
	 JzzxOydONk6Qhzq07m5KID+v/MKgSr52F3slbE30gUNSBYW9IJ71L9ZWRuxhD77KGI
	 TUk5mdJCRsl3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B5E40611;
	Fri, 30 Oct 2026 14:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AA3F362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F061381180
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNTyHfsbGe-6 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 282358116F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=GWBy3aQ2+p2Iuyqc+CyZWngywvtsb6+XgdFje4Rotz1pcTev9if/oRR350FKNSBv8+ZO
 1zd8+0yghP2/YRi621dL5dSXbMzFBRlhIorTlsN39hII5jdRompWsITSaix8+K24h1RBu
 eU2kLZeA7bzIwT5dbKnii1baUT/hTIYO4D+Ydg7WKTtqLsIeH06HFEUjsya4gI7la3oH+
 8ckIZGXRkuTxvRMphBsq7tlCafVDbeUB15JhRb+3HVG9b3XEwnl5tLXUoYkBs6Kc3EqRh
 Ww989Ptn60QMktB1rIilcNyZxt+wCdKP89+M18oxOCRSTH6d+7nXenaBBfeWLRypTaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=z26S5kK7dXMk5mNE/myDkhwHXEQ6Ugjb5BsbMEHSEQA=;
 b=aMzgb2A/nUY83686hI68eOGkw3jsigdqGRMQ3qJ27U0mhQZfJOLvPNwxg49iufqSK1pB
 nB2CgtVQXEZJWSfBMyMCXLjbnMyis2dIYqlyCZs5sINzCBtwG+PVEZBtralvhI8UE1hwp
 PRYJwfVoLbcTmnvusVvfjF/+2Qy7kSZh9+HRq1povEyMyET6n7S4Uj0FSo8qkLAI7nNbu
 yqzbNvRDSowh4xvAU1IkQEdwdzOCAPNoxHzCwl2IeqSzTfNm5O6lztYge96+ahmceWbiT
 l2cbC9onlL4ii9RuaDcZhQDHWKV5Aou23Pr52NKbrNhDFqD9gY31F4oiBJluJrYhQyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 282358116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47C049D389; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c26db32f9a30c897541608afbe3705c6252fd738
X-Git-Newrev: 419b96be31207e6849ee850b72c1ac9276607665
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.47C049D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/linux-tools/linux-tool-perf.mk.in: fix doc build issue
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
Content-Type: multipart/mixed; boundary="===============5477857050087944592=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5477857050087944592==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/419b96be31207e6849ee850b72c1ac9276607665
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
is enabled.

The perf package wants to prevent the documentation from being built,
since it won't be installed anyway. The trick is to create an empty
GNUmakefile in the proper place. It did this by using a POST_PATCH hook.

The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
is that the build system ensures only one package builds at a time, so
Linux's "extract" stage and Linux Tool's "patch" stage can never execute
in parallel.

However, with per-package builds enabled, there is no guarantee that
Linux has finished extracting by the time the linux-tool's POST_PATCH
hook runs. This means the creation of GNUmakefile could silently be
skipped if that portion of the source code hadn't been extracted yet.
If, in addition to this, asciidoc happened to be installed on the build
host (/usr/bin/asciidoc), perf would detect this and enable the doc
build stage. At actual build time, it would use host-python3 (not the
host's system Python), which does NOT have asciidoc, and the build would
fail.

  INSTALL libperf_headers
  SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
  INSTALL libbpf_headers
fatal: not a git repository: '.'
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
fatal: not a git repository: '.'
[...]
  ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
/local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
No module named asciidoc
make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1

Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
problem and guarantees that the "fake" GNUmakefile can be injected into
$(LINUX_DIR)/tools/perf/Documentation as intended.

Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 49e3806198097567ca57a0b75d9c7d7a258b794d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3238948d76..08aeafd9d7 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -140,12 +140,17 @@ endif
 # distributions.
 # We name it 'GNUmakefile' so that GNU make will use it instead of
 # the existing 'Makefile'.
+#
+# This must be a PRE_CONFIGURE hook, not a POST_PATCH hook. Only the
+# configure step is ordered after "linux" (via LINUX_TOOLS_DEPENDENCIES).
+# For a POST_PATCH hook, tools/perf/Documentation/Makefile is not
+# guaranteed to exist yet.
 define PERF_DISABLE_DOCUMENTATION
 	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just

--===============5477857050087944592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5477857050087944592==--
