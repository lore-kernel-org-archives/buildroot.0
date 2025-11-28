Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E25D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9913F84008;
	Fri, 12 Dec 2025 07:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9F34IFBQ9u8t; Fri, 12 Dec 2025 07:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AC583E62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526253;
	bh=gG9r6ubGv8QrfprBuAkNr7oMo9e//CHEpeC9/2frVFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fayQjR82gzPwmm3TMmvl/zOYkrNpWl7SfiVcMUvkusKyCUla+FhaAI0PYAT4OY/id
	 dNXMUSCIhvTmYbXocPEmcQdWZkZEhuf/SCCSvEWBESNbkikkbOwuempNgfhKSiupA7
	 PA688sNJlvue5ivcPn4JfmiEcHoEU+KeuVUkpdsVhcmMJ/m52TZYOMH6o4csqOTpCc
	 BYG67ExRlrLsnTyOMeBNyov04OMPR2yUUyIwEyuQfsGtdmbItlQZmJ5cc2lWR581hv
	 o6OYhq6DxjVrVv5ej+4gj52nuYJGLq5WJb1UvfPwTu0RYpLYzqnohiTO15e7z7hogf
	 pu+ANcXuBjf2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AC583E62;
	Fri, 12 Dec 2025 07:57:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1477F2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 423134111F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-ARcj5yhJ0r for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4976B41130
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4976B41130
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4684486C9A; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:32:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b86191f5be04ccadf6dfb1a5974874f3e9a57e60
X-Git-Newrev: e37bde990acb7622f807222958bce1652694a0c4
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.4684486C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-settings: bump to
 2.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e37bde990acb7622f807222958bce1652694a0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/pydantic/pydantic-settings/releases/tag/v2.12.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-settings/python-pydantic-settings.hash | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 3d0f053968..90a1260219 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  bfd7d2cc366483b19181428756e6a58a  pydantic_settings-2.11.0.tar.gz
-sha256  d0e87a1c7d33593beb7194adb8470fc426e95ba02af83a0f23474a04c9a08180  pydantic_settings-2.11.0.tar.gz
+md5  597adf8b487b9297eda123b211666e98  pydantic_settings-2.12.0.tar.gz
+sha256  005538ef951e3c2a68e1c08b292b5f2e71490def8589d4221b95dab00dafcfd0  pydantic_settings-2.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index ab5205b7e1..a7c50b8027 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.11.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.12.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/20/c5/dbbc27b814c71676593d1c3f718e6cd7d4f00652cefa24b75f7aa3efb25e
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/43/4b/ac7e0aae12027748076d72a8764ff1c9d82ca75a7a52622e67ed3f765c54
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
