Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Og6d70FG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E4E881750;
	Fri, 23 Oct 2026 12:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHxgYVvxcEQi; Fri, 23 Oct 2026 12:32:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA98581704
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758766;
	b=bR/B4lV63uTPGnZJC4ZOShBJAGW3TBIq33zTOBmt2+uK7a3UyzxZjBwL+w4qDBD69CKC
	 e5sy5B7V1k3jwhdqWx9zg5MAq63/OUq8TEXqD3CR/WYbdon1EDR6XANu5OzzP1b2Zk5lh
	 mdSmjzXNWnXKQWhr5JwsP6GwboNnga47p3r+VGErVoaXGdFRdM3Ufxf0pO0rwWcjvRbz9
	 euKuzdmhBwZl4boIerZZ99K23zdWkg4Mzhughhw5UuzO+v7bK3m2qhaBC7istxBoNG4mE
	 t10deOsmWjxNINGA78PzxRbXqOxFKb4rSs2ahpC0yhijzIvma49Jz5Z1UTkrEXZBk6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=vyIKIskj/IROMqtRpvCOxpPqNZS7KuKPZixVNKkzuho=;
	b=PsxwSorVJUvaTVDojdSaQi3d9DFVf4IMT4SijW44hB8eTgEWyRcfe0KhswvlUsihrDtE
	 ezVE7gxfiq7i6UpF2qLVxQBbbI3BPtdXhNsH9+VtxkRv2ub1BMfMTm16vqo7mTpWaWW7S
	 sFaVHNG5CLZL/0BWZJDXVuZnRsoY+1z4vNvgbV/aBwPIFzMvAa2LK/kPLfdQ1Bm23j1AR
	 SKX+CFmyA++JhK5N5Qdnhdg3B6ZktSWJ/CuKu6yLRUmZa+I1So6A2oPOqvdMwpzd5KDnX
	 zOw2Nd20RziCVBD5fvYwTtT5DUcQWxboBQomQAF1EDH7ZUzzSXZsDoTP5RjK2V0GsIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758766;
	bh=vyIKIskj/IROMqtRpvCOxpPqNZS7KuKPZixVNKkzuho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Og6d70FGiEiTp+fdthWWE9zYfW2nf+Vs2BysPsYX+kRT0hoHtfLDUaF8APPkVj7YE
	 wG2K6j7wwmcPwt3+hbV8FaxqDlAvOUBENpQX5BOPscOPy8AW23+fHQ09gUtQIfYSWY
	 2eR3Z8ZBGls+CraaeB32cz4QmAWDuNTclYLIn+Zz4+oL/9kR7h0xujYxl2q/L2W5se
	 aD1QaN02C44t4929E3sYnx/yiolylmNxmbcJfg46jTvI66+OLVDbYyNt0Kkk+jDbB1
	 K2i2/kGMOhn66gDPAHaMqIc5F+FM+K4jaXJIkhkI3JlbNFvR+IJtXJnZ+E79l+iJXE
	 usqPbRVT6rD4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA98581704;
	Fri, 23 Oct 2026 12:32:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E3549D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAD8940119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHGXChLSKSCs for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ED398401CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758728;
 b=M7z+MG3+DHYScU/WD/5V82N4lkHIY0Ry8fDZW7NosUpb9ifOlAXY8nrgFgC1NV3VzM4C
 /kB168BMWD9a9u00TYBNMAhOKJIqJ2E+KmEGJiqQpfIrFMGDzx1dQWAFuv2zIyawORDkN
 8O7wbXjPhag1o+OF2ZJef9l04Pm0sDpg9tUBMsDiTDb9GhoWqvmc0qAa37sySN3L5nDq4
 bYHVQ3lZyZorDob9l2N8ZSd/g3EZXTtbBzrECooVj/BsElAni9IJsPtmdeq0d9IT05+sf
 e2Dxv5VWqUtCRC1+3o0OYtZsuxMRpxfrN5THD2SEOs7Jj6IaO/Uwz+BvTKgzosx8r9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758728;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LBYYMycuJ2htwzr4MJwOWYrJq9gjkd4RvYjmW0DHX4o=;
 b=YHzMxRe73AZRsFGy4+zMXASdjgn7aoYR3WZdcTCJTn6s3wySM/UuYu878zPQJz+ws0TU
 N7wkre0W+znWW+nSMufA1BXbiKNK1dUDhgn/odq04b3EhdqxvsoPR3J793n7cAxFEIiBp
 nIe7avR2A7NxmrKLB1+GE4kkPlxVN+QsLi5Yti/6zxgvjJb3pbV4pFONE7hWYI3PEpVu/
 vVqJIhJ4BEKeUoGpnI+zgxlnN/GssNldAYq47w3f2egpbYgcPxTHFdl5MrjPr5P20LPGY
 Vy3aYZgRWZ5VqapVK2Csar+H+j23UbSDBengBBE0arvM2LVJP7VwJeMzJGr8WDShrVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED398401CE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 800F99C66A; Fri, 23 Oct 2026 12:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bf7b5b7ae1ada12b1ac9ab138da117e8b3b76863
X-Git-Newrev: 7d842ce60dd53f62c03043677a39a18d850fd9e2
X-Patchwork-Hint: ignore
Message-Id: <20261023123043.800F99C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/testing/tests/package/test_uboot_tools.py: test FIT signature on
 target
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
Content-Type: multipart/mixed; boundary="===============2392137404815866759=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS,T_PDS_OTHER_BAD_TLD
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2392137404815866759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d842ce60dd53f62c03043677a39a18d850fd9e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Adapt the code added to the host test with
928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools: fix
host FIT signature support") to run on the target.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6bd698cdd6b9ea2fb4ead725780c963311100852)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/tests/package/test_uboot_tools.py | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 13f77c3379..7caff3e66c 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -38,7 +38,10 @@ class TestUbootTools(infra.basetest.BRTest):
         BR2_PACKAGE_UBOOT_TOOLS=y
         BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
         BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN=y
         BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+        BR2_PACKAGE_LIBOPENSSL_BIN=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -68,6 +71,65 @@ class TestUbootTools(infra.basetest.BRTest):
         # Python does not have built-in CRC16 support, just check it is present
         self.assertIn("crc16-ccitt", reported)
 
+        keydir = "/tmp/keys"
+        self.assertRunOk(f"mkdir {keydir}")
+        # We generate a public/private key pair to sign the image.
+        self.assertRunOk(
+            "openssl req -batch -new -x509 -nodes "
+            f"-newkey rsa:2048 -keyout {keydir}/dev.key "
+            f"-out {keydir}/dev.crt -subj '/CN=Buildroot FIT test'",
+            timeout=30)
+
+        # We compile the empty dtb that will be used to store the
+        # public key.
+        self.assertRunOk(
+            f"dtc -I dts -O dtb -p 0x1000 -o test-key.dtb /{KEY_DTS.name}")
+
+        # We sign the image and write the public key in our key
+        # storage dtb.
+        self.assertRunOk(
+            f"mkimage -f /{SIGNED_ITS.name} -k {keydir} -K test-key.dtb "
+            "-r signed.fit")
+
+        # We check there is a signature present in the FIT image.
+        out, exit_code = self.emulator.run(
+            "fdtget -t bx signed.fit "
+            "/configurations/config-1/signature-1 value",
+            -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(len(out[0].split()), 256)
+
+        # We check the key is marked as required for the configuration.
+        out, exit_code = self.emulator.run(
+            "fdtget -t s test-key.dtb /signature/key-dev required", -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(out[0], "conf")
+
+        # We actually check the signature is valid.
+        self.assertRunOk("fit_check_sign -f signed.fit -k test-key.dtb")
+
+        # We "corrupt" the signature, by setting it to zero.
+        self.assertRunOk(
+            "fdtput -t bx signed.fit "
+            "/configurations/config-1/signature-1 value 00")
+
+        # We check again the signature, and expect a failure.
+        out, exit_code = self.emulator.run(
+            "fit_check_sign -f signed.fit -k test-key.dtb", -1)
+        self.assertNotEqual(
+            exit_code,
+            0,
+            "\nfit_check_sign did not fail as expected: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+
 
 class TestHostUbootTools(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-uboot-tools"]

--===============2392137404815866759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2392137404815866759==--
