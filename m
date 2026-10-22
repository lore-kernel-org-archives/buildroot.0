Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA025606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eH2N2Abm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97925815D2;
	Fri, 23 Oct 2026 12:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o85SiPOVXZZ; Fri, 23 Oct 2026 12:24:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30E8C81565
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758296;
	b=Jtmlbjx254PhZSWh0lxeAaRGvEoW6giUXRdmCrNrf9DMGgZf6dOVhlanbBLd2pFlcio0
	 JqO+RDC0Q5L5HNGzZo7+B1V4Q56BVij9k/LCn7k2bgRDrN1gBVr0skk19GSWRq+WNuDmY
	 2ku/Ed1iN4Shnu3MmMePx9oSeXlelgvIASH17chhRdbNSy+XqRA4pOaDqN7gv3h/3WtcD
	 gPU7QFur5d6t2uMwNPIgo+LpAtR0yFgsWZ0bKBGmJM+tfqIz4b/9cc6lWB13QCbR9Q56u
	 9oSMTqlNSMSk5n17Tuzkg1j0n6s14wBf6IV7dLVY1lYPgVTCLWmr0iUOTKHalruoBMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Sy+P9ZNC/zNzeQD6l3iQDo9qYy86ehzi7x8T29/pQQI=;
	b=g9Bul5nlTBNYCwCr0Hx4ofE7XXQZhxF2tIWp9jkWn09gJugDBiKD8WncB04AM6F9iR3Q
	 zLe4th+LgpSf86UsgqsI058bapR0hpEJdes1F8e6Zp7IqkxdBIK1arKe/Sm/VL+bKFlo/
	 PRRD4bxO5bSDOoBfMr9Npr4Mo2HrDrf1PQPNRogqm+u2jDWSNPs+H2ku3kFExsuOTpbuO
	 +/0EbapU+0rdf5awI2wbLdO6H/6Baj8twjIpcMNsN9kg/DKPfVDGfgSSvTrHewjw8rhB6
	 7cWbqSGr+/jGlweX6rdIqhkFJkfeHqmi7iJu6VMpuava23Ro3sS8HNzQU00c4JZ2hvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758296;
	bh=Sy+P9ZNC/zNzeQD6l3iQDo9qYy86ehzi7x8T29/pQQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eH2N2AbmxgX++eAWQczitN8VGkmDlot1HwuADQOvQmVNclJwMxvV/zBca3nEFYb3r
	 +qfQ6hliK03GeueEHJjtztZvrFduHnwPBv8dMUMJ2PaE2acQ8UiUPcgjHeS6mEFywv
	 ekFBmw2OVdxtfCDsejFrriteiMw3BCJJUZZ4V+RPRna0SvByJTxaJBneVo7ARX1eQ7
	 uo+Ivn6ZxunGGsMnimOIMxjFzjhBN98H8EJekiW+enVCC7W7vXSSMj5tgCaPx6vjIK
	 icwd2UUkdre/qwE0yKxSQMwjRlHbbScOw0jw0qZKf9eGeZU7ELBH0JFdEh1iW/5GhT
	 kjvxB4Fo6j5pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E8C81565;
	Fri, 23 Oct 2026 12:24:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B1FC12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CA23401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTAiM77Scx6L for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B9AF9400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758282;
 b=VVO8p0GeKDTPWvnFp6E6RP9mFGOwETd9REO3ogm7f0OpSyt/mSREsyZPSNyhIvSoUEX7
 sMIJI0ZS6c2UCcmWWb9+e8+ttHQRo28x4Uvx3JnbwYy40TYbGLHL1FlK616j8hIeUKmS6
 MjB7tQb/e7dc0YH+RlFqQHMANxmcufQS/LnS/69n4SSCFHGXiFjaEDvtM+ahgnkgugPWj
 ACpzkFjMejYTJW5tqnpJaW2PvvSl45APAAnI0M7LoaQZwIcbznQQtKAAA1oudiwcUq+0m
 cdKnZ+FimelUQZ4QRAtuStMJyzv8fNXKnvZEwrLnwMjoTe8ErU+AtJnWc0Tp533+PxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758282;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GKA46ZaECVahofJTP3yF4/t3PFJnrpq3+Aaw0d/5Vtk=;
 b=eXFDSI4l4nNurfAK6bVWvHjynyc9LKzfhJhTuxJhjI55bnMv3kSCXxDGg3MAp69U+UrO
 SHrF4jKmeKuPwugONvAPzBkPQZ/1ikVgpi4iiUOsHdBYtRrQJ7XaoADTUlwgL+EB+uq8o
 FStHr6+oF97LE/4XvhKkr9+Qa73fUR5UirveU7gwC4Njzm3l7qFHcsBoB4aJAz61QYM4/
 qxaocEjBH9pI7e4MSdcNKCUjgHkwfPE8P2bwruT8LrUyxH72UiUN2FPHYZeJCdbKPva6P
 m6r0iK75tjuf4JzD+/ooX06oFS/GaenZXXo5OKri0RI6B3RPpPg4gzPge5kel2gJlpA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9AF9400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BFD09C669; Fri, 23 Oct 2026 12:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fe3a392a06f004deab25cb5ca6259af3e1e580d9
X-Git-Newrev: f9b94b567edd26d2e53cd59877133ed9f5383cab
X-Patchwork-Hint: ignore
Message-Id: <20261023122318.4BFD09C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bpftool: disable
 feature auto-detection for host build
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
Content-Type: multipart/mixed; boundary="===============0155233039455244303=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0155233039455244303==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9b94b567edd26d2e53cd59877133ed9f5383cab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

On my system:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]     # ACK
    (NEEDED) Shared library: [libz.so.1]       # ACK
    (NEEDED) Shared library: [libcap.so.2]     # NACK
    (NEEDED) Shared library: [libLLVM.so.22.1] # NACK
    (NEEDED) Shared library: [libc.so.6]       # ACK

After:

    $ readelf -d host/sbin/bpftool | awk '/NEEDED/ {$1=""; print}'
    (NEEDED) Shared library: [libelf.so.1]
    (NEEDED) Shared library: [libz.so.1]
    (NEEDED) Shared library: [libc.so.6]

Host bpftool auto-detects optional features by probing the system.
In my case it finds:
 - libcap which resolves to my system shared object because
   BR2_PACKAGE_LIBCAP=n.
 - libLLVM which resolves to the BR2-built one thanks to llvm-config in
   $PATH. But we don't have that marked as an explicit dependency.

Avoid the mechanism by hardcoding FEATURE_TESTS to the empty string.
Goal is to make the host-bpftool more hermetic to the host system. If
we ever need those features (future xdp-tools package doesn't), then
we'll add the dependency explicitly.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd10a0172fa27be4d2d9a90a756319dc8a3371fe)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bpftool/bpftool.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index cd68d89799..933a8fad4f 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -13,6 +13,9 @@ BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
 BPFTOOL_DEPENDENCIES = binutils elfutils
 HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
 
+# Disable the auto detection of features on the host system.
+HOST_BPFTOOL_MAKE_OPTS = FEATURE_TESTS=
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BPFTOOL_DEPENDENCIES += libcap
 endif
@@ -28,7 +31,7 @@ endef
 
 define HOST_BPFTOOL_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
-		-C $(@D)/src
+		-C $(@D)/src $(HOST_BPFTOOL_MAKE_OPTS)
 endef
 
 define BPFTOOL_INSTALL_TARGET_CMDS

--===============0155233039455244303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0155233039455244303==--
