Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF3FC6180
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5224812FB;
	Sat,  3 Jan 2026 11:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptlEjXxI4XNI; Sat,  3 Jan 2026 11:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBD3C81310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441527;
	bh=ppzQIOEPa0ouqHu9OkiD1ZuGydeasVFGAZsCtkZHNM4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=slH3lEvkWgYGn/I7EJLIfDH3c9pU0C+GIg7Vim8YmJ4rDRiCfjncvIitIH5f1Gsm6
	 HPmLL9lr2Rw0bUo4zQkhiIJnduMO/Pmbf8QtOrxQo5fa0DdnHMKcBVS7sMiJtcFV0X
	 q4efNCpGGxpNLXqj0fA4RLvz9EcnScwnNK0GVYEZICoafTObA6A2j2obYbjzbBsgCB
	 0u/ndX8rOpB5v8HtuzLTBf90/S41moy9CbrPMrtgQUcbjzvPWST3Z+oKY5F4VL9Kou
	 PuODT3QQFrNyrRy9VGS6QskI6fzyBIIl8EHBgqfPKre/lWDwxOzPUYN39JiCQATyVX
	 Zybl6eY9A7Q9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD3C81310;
	Sat,  3 Jan 2026 11:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 863EF249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D3C440459
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_BA_dxYVZWb for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CC54041F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4CC54041F
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9688488118; Sat,  3 Jan 2026 11:58:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:43:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f28805de4d9bf520a00f3f9f3b8f1bb060e7dc3
X-Git-Newrev: a336746832ef24c22f4f37b322f4e5b378c3c0cd
X-Patchwork-Hint: ignore
Message-Id: <20260103115842.9688488118@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: bump to version
 2.17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a336746832ef24c22f4f37b322f4e5b378c3c0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/python-babel/babel/commit/b50a1d2186c20f3359f7e10853d2b2225a46ed40

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index cb41750386..436e49a9bc 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  1dbf17974d7ccc9950757ed3c9618db0  babel-2.16.0.tar.gz
-sha256  d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316  babel-2.16.0.tar.gz
+md5  726d2ed119255a011d248ac0c9caa24a  babel-2.17.0.tar.gz
+sha256  0c54cffb19f690cdcc52a3b50bcbf71e07a808d1c80d549f2459b9d2cf0afb9d  babel-2.17.0.tar.gz
 # Locally computed sha256 checksums
-sha256  3f9142a40859dfcb33f45c16ad872b500d683cc4a20b17091478b404e900520f  LICENSE
+sha256  7801a84fe811279cb350bdb4fb18f94c36b18ef813fa6aac043b6c6d39484d0d  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index dd10abbfa3..57e372fc1a 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.16.0
+PYTHON_BABEL_VERSION = 2.17.0
 PYTHON_BABEL_SOURCE = babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/2a/74/f1bc80f23eeba13393b7222b11d95ca3af2c1e28edca18af487137eefed9
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/7d/6b/d52e42361e1aa00709585ecc30b3f9684b3ab62530771402248b1b1d6240
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
