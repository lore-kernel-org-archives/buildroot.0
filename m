Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADACE606A32F
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iXj/mESl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E60814AB;
	Fri,  6 Nov 2026 21:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLPIpuf5ckEp; Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A0C49814C5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999717;
	b=YAFhZz4jnd9GYH1JfM9Qe7h9mbOMRKWjeevXvZbtQPikZ7LchM0oRB9H9ghGE/zIRDeT
	 MUnKL99Y4fQrQ5xHknNbp7SoeOCgKrS/mBpzrAcvIUlR+PKSMODkzIj0ygUzluPdV1U3S
	 hWVvvwnkqK54Etu646MPnhLt5UFGVIMZjQgqXLfsKx0PfZpF10o8LCab3UODv08Bvqw4v
	 sCoCQUEQM+QBUG3ACGMx2+Ivl2fkiTB27LnC1zwVE3H8EIH2Yov7MJHOCCm5lkBsVdUIi
	 86Twi361WDGKlb/Cfe6UidTy7vknc5h2Nkn6cqz2E1j/xpWME1CJaBL2+XJGMyMERFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Fi3FVfbURI+L3/ALnSRg4lAuj2/GC2It5FOyOSdBTbE=;
	b=FwSrH/ZGWsSjoh7aizwVgL+5SN16FHf40O8uQy9haKlVDsP+tw30SF6OxdFlGTzVpK4r
	 4PwMNjOR4j77ihHoS5vPw1agRQvKZt2vL65w0t5ZCp0UXl0xE5dM06kQRlDO3WK8YkXlW
	 ZmG0o6qcPDaioerttH1jBpu/LZqT8JOmzaP8PKrdUR5UW+VhEFXkWckwfM9Y6iI8hTBdf
	 eZAk5PcCxFsJQjnZ2wgj9VYQ8EHssUnjLTR7/PijT8o7kH2j1Hg27OkMbQBrbMRORXEq8
	 dfg4CGLKY1dhGjtUdMy8mx5igwVFvKoJqzO85HhbgEZn1mSW/edEEAiBdg2CXe1ODPA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999717;
	bh=Fi3FVfbURI+L3/ALnSRg4lAuj2/GC2It5FOyOSdBTbE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iXj/mESlEKkg0UKeQerFBIDCluZGHIbpkLjcAB5RR+j0oJmP/P91syTibONskdjua
	 roX6id+uqHzVI+WJtMQgqaQqvGkNJ2J2uh4Rr8kuKgQH8YeZ2xPXI5Aew+2FCNNTw1
	 M0lcP4QRPN0NwPB/dSfIsLNRUEucWuI0lauR84JETiVI3J/sCLYEVFx8eyRgkxkN9A
	 v8Pd49e8EvwrZINtJgnMnorS3VmOV3f8G9WOFZm3EM/ELc1jEILni+POsQ59MFmUX/
	 6zm5qls5e9fsp2XohcSt7vfkFN5jezLCmZ4x81OHvjsVnjLLJ5BPBLdcPg5oDl9PNZ
	 hmAVRYNOQe7vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C49814C5;
	Fri,  6 Nov 2026 21:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F58B31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648BC81220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo03bJ4bnD2f for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD7A581281
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD7A581281
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA1F49E0B7; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b91230282c2964a70c56a037167aa31b97f37bf1
X-Git-Newrev: 60a3423e958dc4266565c6bdfbb619dd95839314
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.DA1F49E0B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 3.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60a3423e958dc4266565c6bdfbb619dd95839314
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 48be774f62..19ed245314 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  8251238be8923c56314d24d133546aba  wtforms-3.3.1.tar.gz
-sha256  9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c  wtforms-3.3.1.tar.gz
+md5  a6f11f4e6b9c1d3c158a6ed8c758ad3f  wtforms-3.3.2.tar.gz
+sha256  49bb51d10b7832d497e758736da4d56f7d129a015db24756f36f28992f175404  wtforms-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 93b37acd76..0bc84866f0 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.3.1
+PYTHON_WTFORMS_VERSION = 3.3.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/ef/5b/588dc20774f4cebeac23908a87e493f2f6fb2a4c54756675cd59afb8cc72
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/52/3f/742cb21320840bcd80bf9de3d0486126f364664fff12b805086371b1fd1a
 PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
