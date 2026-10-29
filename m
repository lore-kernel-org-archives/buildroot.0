Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A6606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LyM5M6N9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED3040E7E;
	Fri, 30 Oct 2026 14:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnHFhreziK1V; Fri, 30 Oct 2026 14:20:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E596140E71
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370056;
	b=YBKwmdkF7cAXH4Jwtw65JKad1Ndd6id2oC3wvYOaX6MSI2VBI0QdOMk/tHRyaN+1vnFk
	 hd+J6siRZ8ma5J7x5/W/dm7bs3IBMJuIDXW2MZnHqJYDn/0zu9vpmGhTHKFt6MTUePpZN
	 tWmBTFwdxuRlKZ8c5GRYbDGMngItA7eBGoPbZbokLH0PvnBH802fZTRcu0ZhfRq4CIsFS
	 Zq3KZOJhiQcqnQ5qwKakpPMvznIqXRr0mClN0AZhaUrC4xVZlOy40+Uk176ZMO+XZQ2To
	 tLh8ng8/S9qlbPf819PXK1oEb36PPQB6JjXlNsHI5qtlzU7BZ5NCmm7wsXww8PfiTPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370056;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=TK093jgqzfX2dATWNclnh8oAha0dXn2LKgx2FM7XY94=;
	b=WGVsmwTvSx4Iaj1rHuSGEqT8qC/wjyM+alSt4LR83MH2W3cDP3Xv+gGE5JSZH0jCsUIU
	 aDx//0p9+qnmyEhw6XLhFj+Rg72k/175w2LOL4ih5R4S8xmlvzCGhcIUOiYI4xcRxSPQX
	 G2WCroPJH9WYVWEXgNrrcp/tRnEcubms8Gq1t9hmZ9fGlXRCyagV788M61VH5sMH6CxLR
	 AECeWQcZu/JAjnm4JlFDaOVAlReXvjUowb9exewZEbZaUE4l1MPzSYn/ycgU5Dcju7IfU
	 6sjJPtqvAKHHvDWX0qddBD9cfHCaQL9fwfEnqBxsfI2fYpJwlarC/VJo/s3FSqCYdjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370056;
	bh=TK093jgqzfX2dATWNclnh8oAha0dXn2LKgx2FM7XY94=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LyM5M6N937sqgLkl0xGKNELW0Fqadw+DTQK1XTSzujtmaAx8xE423JZPMjBHL/QHh
	 WLtyNz4V7vHHojbMQbbFN1j+SqZth4tpTcHZP6FGaOWa5+AA8TFbmPYsK+IIjOlBPw
	 ZWBi+vzCKXoFUfTTEA47eeFoOGGIHlSmDwv/25mgtaVcR51CR3GFsqXlDgyWp4DdKE
	 1ZqVZ9ey5MUoODKu9IwOV+391M0l4NAFoPT9WBzPUi2crLLKh26oQjEPNWxx53rNbo
	 3h5K+ZBA/Tr5VKVYBgPkAR+kmC8z/nZUmsJ69fAc/ve2wTWarSqKionT01f4bEml+1
	 vYT6FBwfrNrdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E596140E71;
	Fri, 30 Oct 2026 14:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D70362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1666760AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8Uj2Jtiu0u4 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36E9A60AFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369897;
 b=BZfJv7L+2FTVXQdwuDKfiZisbEoErMitc4E978RZUm/koe2mmXC2C1fmausm1W5KRZl8
 MKcidMbqOQHeJquX3LYVvFnfvb+Eb/YSeC32gTCEdbHGw1gvqula4rsdFbdWp/Lm+WG63
 xFHhDiNNkEe4LSViOatiOOawv6qr5rzgX36X29KKvVX4ANayPO4RqwxPgITtXRiZ3fS/C
 vq60eMv9XdEiAR2VsODVs5HZB4gBmZkt55iKMDm4/HOTcEzPYRXU9u2DhTed3qSvGUGIy
 C/CYVneabj7jgt1JFPEKtvw1/8MN/Ikhg+ROrkMgAFGmkWPOlvCwvE1f9uJrdf3NVcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369897;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=91QmA3/dUjZNxgPb0yza0PWNe0Qo6Irl9SkeXSwUyHs=;
 b=T/2g4vEeEC+HjJkXjLhUv5FGDtLZLOXmhsIH2B/R/udoEdZHlqvyr/va/p+4W7AwxswY
 9U8RlgrU0uL/pY0aNgK+FozuHW8WOdG31qcEUJ3i6BRtdKdYvPeianY7aZxCa3wxIpU8w
 kfhTCc9qvGG/vy6sSXcoSQMOclafiVudzQJNrpmdXOvsTp9M25XlEumE3BemzcRmpTgXT
 mU87HFcKoB1vw+RgfJaz7eoEmbECg+XYLSZcbYgeSz8XH/+732cpzobCGhixrHrroo5UR
 +C20Dnpq/cvKFZNX4Me6BwQFiLZqzuFD39A5GsYnxBFQtELX9ePDNcc0JokZ9NcnocQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36E9A60AFF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 554339D389; Fri, 30 Oct 2026 14:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:12 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 39c9692236ab6212836e3dffa802f3d88bc1bb53
X-Git-Newrev: d09335179f82122f90b75bfeb801e50256f36d34
X-Patchwork-Hint: ignore
Message-Id: <20261030141649.554339D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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
Content-Type: multipart/mixed; boundary="===============7090946740313821966=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7090946740313821966==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d09335179f82122f90b75bfeb801e50256f36d34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============7090946740313821966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7090946740313821966==--
