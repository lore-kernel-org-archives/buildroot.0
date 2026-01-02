Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714C5FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F69D80A8A;
	Fri,  2 Jan 2026 22:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpppAlm9Q2si; Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AFB380A8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391267;
	bh=noSxRdEJ5GJOHf0hkG1jIE+nNP/9EOCCVZchNHhWiOk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HhUPvUq0RMbLXwk8sp3vweN8eYbjlfv+PotcysoLr9rdd5xYHrTevDJ1cPtXFLMaj
	 ma4Tfr7lXM3w8pF1RMCHUjv9SdunErDUJk4s+xP0XcHwey8UrCUEDi8D2zs9azT/XL
	 fxUGi1KeVm8jc0NhD8PTVCdYyC3fFZaE8pEikUPxfyZyf6rBRbdpf5Zp9yVUS/J/Gn
	 4nqZKANatT+V82ox/kcOboQzJ50O1ylpfz3yPrRJVeA1kj3uLtfsXewOSAeyQ2P1Tj
	 S/nm5dJ95qZog/4gNQcmSToy+WXOh5dzCN9yBw4HuuLSGOiegLTkR99Fc74CV1hHsS
	 5jNTS77McnLkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFB380A8C;
	Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E743D249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D68494039D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9EtgWdH4Gz9 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1725540390
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1725540390
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 107D082136; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:59:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1033e83bb79f13c52164b60f8dbfb8d3bf28d521
X-Git-Newrev: 174ff88a966f561c3f78f8403108c7de9423cf8c
X-Patchwork-Hint: ignore
Message-Id: <20260102220105.107D082136@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-modbus-tk: bump to version
 1.1.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=174ff88a966f561c3f78f8403108c7de9423cf8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-modbus-tk/python-modbus-tk.hash | 4 ++--
 package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-modbus-tk/python-modbus-tk.hash b/package/python-modbus-tk/python-modbus-tk.hash
index c60733b02d..68c2420ac0 100644
--- a/package/python-modbus-tk/python-modbus-tk.hash
+++ b/package/python-modbus-tk/python-modbus-tk.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/modbus-tk/json
-md5  03873278a842535c9069cc0dd352f520  modbus_tk-1.1.4.tar.gz
-sha256  68977766eb10469973dd56a2814bd981b85dd180b79043248786d88008f2593b  modbus_tk-1.1.4.tar.gz
+md5  f05db07a592a17ae8009df905591a0ea  modbus_tk-1.1.5.tar.gz
+sha256  77a72a3ad9d5d32a1d2110bc04216680ca57d7522912e0f271e9bf5f1b701b36  modbus_tk-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  3b6a7f9c478ac1982e86cdadb45eb4788241b95839500eb26839d5053b74a24a  license.txt
 sha256  aa7ca42152a13db6a27b31944f99851efc3b9ee813912ff21d7d6ceadca62e6f  copying.txt
diff --git a/package/python-modbus-tk/python-modbus-tk.mk b/package/python-modbus-tk/python-modbus-tk.mk
index 2e15354b04..8edf824f66 100644
--- a/package/python-modbus-tk/python-modbus-tk.mk
+++ b/package/python-modbus-tk/python-modbus-tk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MODBUS_TK_VERSION = 1.1.4
+PYTHON_MODBUS_TK_VERSION = 1.1.5
 PYTHON_MODBUS_TK_SOURCE = modbus_tk-$(PYTHON_MODBUS_TK_VERSION).tar.gz
-PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/78/40/9ae5c428b1867bfccd3c184dcf18cfef04e3d9c5b9dc22b8e9eb8d480651
+PYTHON_MODBUS_TK_SITE = https://files.pythonhosted.org/packages/53/28/bdfb29ce9bec76015bf3d3ad6103324a0575843ee4b20663c53cc389c227
 PYTHON_MODBUS_TK_SETUP_TYPE = setuptools
 PYTHON_MODBUS_TK_LICENSE = LGPL-2.1+
 PYTHON_MODBUS_TK_LICENSE_FILES = license.txt copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
