Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8B5D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15CE68114C;
	Mon, 15 Dec 2025 21:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDl11X4nXOMY; Mon, 15 Dec 2025 21:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 263328114D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833015;
	bh=YNxKPI1mJLA5EQwpMLzg7mQhkcliKiKmAE3669Gz0Vk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r5kmeIClmIsMqIXGipv4+SjER+jmtCZh4NsiGGu9p8HcfxjAFVUqGNLhB6wdrP79p
	 s5FiR+zrcxo32NZzFBKVSYan5ZcY+uw4Of/lK+Fp2T3Yw6U9wKbP3nKp6syf787irt
	 4aeCg41jnB/TwYnQTwwCNBE54tmjt/WwzHfL/bfyq5OoD0rx7V9I3U/Gqz7TFfGAGc
	 T+ZWITIAgWclpKeovLWM/7BZfrVOb2IaIIrLjgJc/WGXdvr0JrbQrEPWewvI/Gjtxd
	 xNMPmJHqk9EI9dEW3GjmcXbM+qVGUBh84801q9m3OGmR29aetjSol1PBr6zglZwdBc
	 TmqCzZTM9xj7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 263328114D;
	Mon, 15 Dec 2025 21:10:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CBE5151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC67A40AC3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JjoLZBRlvSR for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D5240AB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D5240AB6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EABB86FB0; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:32:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a17185606161d7a03198e249c02bdc2bdc972d0
X-Git-Newrev: 41f18ab2211c6a4481d94bc1ce7b1469e3f2c53b
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.6EABB86FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema-specifications:
 bump version to 2025.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=41f18ab2211c6a4481d94bc1ce7b1469e3f2c53b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-jsonschema/jsonschema-specifications/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-jsonschema-specifications.hash                             | 4 ++--
 .../python-jsonschema-specifications.mk                               | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
index f68e57cd5a..b4725068f7 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
-md5  e8f726a5b9647031d9ee8b922cf9b56f  jsonschema_specifications-2024.10.1.tar.gz
-sha256  0f38b83639958ce1152d02a7f062902c41c8fd20d558b0c34344292d417ae272  jsonschema_specifications-2024.10.1.tar.gz
+md5  ef8e5a762c7ef39dcfb775c81336a690  jsonschema_specifications-2025.9.1.tar.gz
+sha256  b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d  jsonschema_specifications-2025.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 4637c14f04..eaeb06c3d8 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2024.10.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2025.9.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/10/db/58f950c996c793472e336ff3655b13fbcf1e3b359dcf52dcf3ed3b52c352
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
