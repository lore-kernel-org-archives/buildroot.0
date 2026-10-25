Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d1xxnZlm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E8B360618;
	Sun, 25 Oct 2026 21:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbqlhARJEYxe; Sun, 25 Oct 2026 21:18:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7E77560607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963086;
	b=Fm8JCzHaBGjbriVbVgHJBGyxCF1cRv4qkTQH6wD9uFbf5G1bd5GGuPHrAXiigqU77mDU
	 9GbMjNbTtyWu29N0UR5HuFrDtomPocvS5zSOe21JzPT6mB5tJcoou50nkVJCDV3LIXmnJ
	 j+AzbYPNVVxyyc933EgnZItCdsv3Pqy58ZCNPXii5U8EibIeUqDlpjBfTgvxRv0ORyKQV
	 nwS4MsT2p2IoFFu1gTsyOVB4SFS6KLtaHJ2Y+bLWnXY0psf9NLJu0NzJvSmpgEja+pazY
	 f7ZNAz8suRXcr0Wnge3bNiFCVHWSPawARacU4yGNUy31MbVs4honUvG215JMs91bxWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cq9BZ0Pbu11kLEPKs1E9hy9bxr3lJS1wz+pCzA9ygQ8=;
	b=FQUbZsGP5oE6vAeMklGRK3OfyL/vCCHNNpIA7XphSXSq3ohDkMGlEciuxTbMaxkmeUbf
	 smZa0WdH0hi7bfGWXZm6ag+7NqNaeyxB15aoCuzFqjqSVgyvFJjRjwUYqOAIpQXDv7uRB
	 WlcFCxtKqt50HvLdw46EOWrjVouPpDUj03hGsuaDNgRW8NcYOCE2uN7OeV3crarb0GlLj
	 TepvhKZHCBW7sKT69KVGO2KPqRJ9E+UXEGZ+UenFdGBo5Fz/mgZ36ixCE2/gji2xxlUqc
	 BaKodmRX7rSKIGPd0ldqSFqJQwpyTF4vC1GKBkJqTyX/e1oiV1EV7Vv2PNIOtoNdvoQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963086;
	bh=Cq9BZ0Pbu11kLEPKs1E9hy9bxr3lJS1wz+pCzA9ygQ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d1xxnZlmMeSZOJmY3DmgtrkMNgafeg8ocI/JojskWG4Ps95IDk5gbtrgDPUcECDKr
	 GQN3SBpRHb4NgCzIWnNhTdK3fSs1CsvGJxMUnirIcLWg18stXhTilxEUikh+agInr4
	 +hr1rgTkeVYig2e8xMOIYw1V5EZWR88zs2E5r+eoqx/nugl9M5VQJXsMvfRcVzBiI4
	 8BOyH7ERf0M/lvuO5TI4Dxm2GIw9JggmExudaMbvo8bnzLFgDiWNggOkU0hJSaSovr
	 MrFrVWrAEughDVw7dc2EhHsah9amn4QUQMSYwtgHjaMWv1E5wB+IxpwKmdH1uEOIng
	 YqQocCCMEBKiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E77560607;
	Sun, 25 Oct 2026 21:18:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E533279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246E160607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvZZwqczLHUe for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57B7B605ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963084;
 b=KkVQihWRWx9DRb1dJ393K6MWPnoPQdKBxLIN1Escvyu6u3jt8USWSHI6y4VZk5wuX1eE
 y6e7qHo1OX66PLfCq5lcUGi1r+AcW3Qj0UCx/dXz/+VJYuN3aRnWhg7jswOL1f9UHmrxU
 6m2yLf+5jJIOPr/rcvqPc9GsV5M/D+9xPhFXyccN17mO3cHj7S38FvLNfr4RvH07eUu/H
 lEcR89c+DwnNJ0nFJNOBLUlQbjYGW/gdyMVg4kLlSEAEet0VMN/dqkl2eRCwlk4r2Xjw9
 HVfxVytNajPOAgQSVy9JIyrdg504ApZZMmi+I/xGAg4O0YJZptOe1V4AyRyiuNAYvDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963084;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nQF9AWR/uM23BqARVCG2gJQBZunWxJZaMFqpR6emkTw=;
 b=cDMr2Ngc3drWfJoIocWMWfj84KuA9D0vHV4EGlZyLpkhhPZQOct+O+KPgp5EIeU5nces
 ADaLCgVfkbOecDyyugBjncSRKHljhHGCo4AGZicWmX8EtkY8XD92smv/dfUGTb3fcOh/o
 vIWHX9yG7dMmensxS8+MqFyXT3K6Z0C+6MLoW2i1QyDsSjwbMamKHygleBjbT3bwvRp69
 hD7bygfPiyoI/4ZtyeufiZ0+Pry8EA7sUVfZkzfQbLDXHeINZAHsn070i0T1ZWFx4GchS
 1FwCxSoOZh2DGCU8xvSvGSPQjS7VghwAeZe23yLoE1pe9dPPjoTEs1OXgaSD+Rfcq1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57B7B605ED
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC75F9CECD; Sun, 25 Oct 2026 21:16:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:17:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77fb7aa0c4fb7619a426fd37aae04a0455a51af7
X-Git-Newrev: 49e3806198097567ca57a0b75d9c7d7a258b794d
X-Patchwork-Hint: ignore
Message-Id: <20261025211638.AC75F9CECD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools/linux-tool-perf.mk.in:
 fix doc build issue
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49e3806198097567ca57a0b75d9c7d7a258b794d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 8c91c2cc6b..3271fd5683 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -141,12 +141,17 @@ endif
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
