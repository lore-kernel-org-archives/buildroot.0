Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9CCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F75681334;
	Sat,  3 Oct 2026 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8du2oe4UL4j; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BB22780CE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042852;
	b=K6T8v5HUY0aPsHYhPgyClAo1GxVnGFnzSGN2BryC6Q1j+BZlyktKhhKffV2U1RXfaqvJ
	 nw0/dlyZQ91p27aGngmLhUNGoIQpGo1AsAL6m1uLJ/9EpmMd38my38wl3cC3iKNyKAc3Y
	 hUdHVysz/0H8JEhGtrOfkcCJFsXQtmsex3ObKBlvLes3rKflvv8Tmfm/RhuJEGBOEaAGD
	 52YntWygv4RQkYoNDJ0KN9iRc4j8Zuj0yNaNkhMgdObo50HtfB7JIKZLrCiRnaBZWbf3B
	 yQYJohr+vje0rj6+FQWjO8P03Hnxbq8eqZBLjBWw2V0PF8rL5qabegliyZo3b+guJvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sO3X8J6k5dyRh3lV5zZ/ZnoU8JSJxWfPq3neuEKdFpc=;
	b=r8zQHjtrMv7/F5uO0gkhUMyDebn40T0QmpzdSkh3+VhhTG4s/x3ggxqh+VHWY0IZf4tn
	 QoPfa4p+1pAjFdSTUhAiFqjBZ8zvTRxe2eEdwUHEm0DGxTWogkqapWFb5qKPvkm371TrK
	 kMeV+wKuCnoPBzDFe25KXTLU0i7DX5DL53atV27gkoKSBGKCFjHCFZWUfDvD7WJ4L8WXm
	 32uvrhTFwBs3wewfeGrealMvxj1g3V1usVqJIvD+9ru/NMZmMGKsJ5cKRqyupt/uhH8Ec
	 MG5yU92a1rYWP6nyoLeCfCWKqY5L4/+/5WkNifl09g5WqjyRM2KxOnmp/5VoqsQdzrQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042852;
	bh=sO3X8J6k5dyRh3lV5zZ/ZnoU8JSJxWfPq3neuEKdFpc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qGqKwPmqxTDOPF3OZrNaa4xQu+pZIYfQzFIg2ao8aNjvEqgcgxKgt88szkXU66O3u
	 ct9cGFi+mwnRoWmmxdlqgAMKwcXllsG/tRyTaulZhyrjdAPGptn04dv5QismUsTAS9
	 LGHvQP7CDBzXh+ZleMMAPyYyL7UbIjnvqeN5/QxStRaomHfyEWHjcG6bsWILCAcSe0
	 MvS6831Y4t5Rb8OYpFdn3pI8k9tHfvRZPUk1+ZMo7HtR1SWY+SYgl+8THdx7AUP/6o
	 FPBVN+ZFn19qACzazOfsWzS9JQWL3Moo/HSHq5Ib63HhF5qU5wBio1hkSx9RRHOZZ7
	 BcuWc5kMYIpkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB22780CE9;
	Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41FE19DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231B760680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLk-_OBqeMh5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6F8E460628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=RsUaYWhf8jJ8a71SR8Fk4Js3ESVuXvQHlhhJDXcMgWUCgmkjGg+LuVuXkCCD+PPmKLuM
 VkceL0ISKCCKSDFkEZkVqli5WQt+VA/hMxfyT26cAGffRygPf4xauZrGG5HfjkNe1A4Dg
 TQj7Kvk7aO21XywKOgRK4lg7luDEQR8vj9kHnq5xqqrrvwLhxogyuJ2qT2IyPKOVTGGYP
 m9/6CF4L9snMYo8NdMhPr3tKljXwDqN+Vzj9xDhvPeSO1TzcM0B3HSsPPHSNT1ZdMEB26
 s4sAzzB8DO9Ns7xBOy8SHO4j9QrwRF+sKUTJcakOaVXNE6wZeRqBUQqeL/vTgmXPKGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CdoN2bzoYNFGg6QcL21jFHM9bf4kixCa8O2baiBEC80=;
 b=MJeyC5+xduoGErMESfP8bkcpeiNgIbEoxIX2/XUh/LJOhMg8P2CRX6FrU6qr3+zEPI6J
 RFjv89YrW4nmPOCUAfhIVdw9dvdFDHSZGoS6M4pPtq6V0DLbwhXpKcfGY9nwpM6vVXVCw
 5uXSQSMs3jnIPDMAFrjkNIPx5GlvLDvvsw4q2I2nxBe1AgLLqF4ki5Ps4aObAW9MsDYIe
 M0QTN8/BNgmHBrxY98i3JDysFVTIIRYsVYh/WiJMd3SLSIhd/h6CaZJ5YerVgI1btKSEx
 qljNA7GwTsDlcF/sAtON01Nz+cbgmdvZyJcU5zTnURGVySyaQeG3xqv2fDa5CEE8MUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F8E460628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3E0F8A2E8; Sat,  3 Oct 2026 15:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:10:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e88e0315ac9b8719f680ec83a72cc5bba0d8b756
X-Git-Newrev: 69f0e36ee04488fe165009f5db4b426663b85495
X-Patchwork-Hint: ignore
Message-Id: <20261003155248.A3E0F8A2E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wcwidth: bump version to
 0.9.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69f0e36ee04488fe165009f5db4b426663b85495
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index 8c43b3729c..db635d2a1b 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  c179ab1aff6e3b48ac9617cf19f580d4  wcwidth-0.2.14.tar.gz
-sha256  4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605  wcwidth-0.2.14.tar.gz
+md5  326db5f3f49128f6b69d967ee633c44b  wcwidth-0.9.1.tar.gz
+sha256  5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5  wcwidth-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 15b5f495e8..32acf28e93 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.2.14
+PYTHON_WCWIDTH_VERSION = 0.9.1
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/24/30/6b0809f4510673dc723187aeaf24c7f5459922d01e2f794277a3dfb90345
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/dc/ac/3a943d2792c9bb368aaa8b50121c0f778460ba2d7fbdc0a0366201d9e761
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
