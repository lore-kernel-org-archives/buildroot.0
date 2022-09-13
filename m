Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAA8C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35514404A6;
	Tue, 13 Sep 2022 12:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35514404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOdIZ285q45B; Tue, 13 Sep 2022 12:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D104C40510;
	Tue, 13 Sep 2022 12:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D104C40510
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D49C31BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B094182F13
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B094182F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEJQIqQV-XMF for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C163783046
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C163783046
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A96F08377E; Tue, 13 Sep 2022 12:39:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 14:38:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1616816e13fbd95934e7647cce3e3acdbe1b072a
X-Git-Newrev: c0ee83d10bd8902c889b773b25a6b96d880f2fad
X-Patchwork-Hint: ignore
Message-Id: <20220913123955.A96F08377E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump to version
 3.10.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0ee83d10bd8902c889b773b25a6b96d880f2fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-10735

https://github.com/python/cpython/blob/v3.10.7/Misc/NEWS.d/3.10.7.rst

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch | 6 ++++--
 package/python3/python3.hash                                        | 2 +-
 package/python3/python3.mk                                          | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 880277eb1d..0458283c18 100644
--- a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -16,6 +16,8 @@ https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979
 [2] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Daniel: updated for 3.10.7]
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
 ---
  Lib/crypt.py | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -28,10 +30,10 @@ index 33dbc46bb3..4692a5270c 100644
          result = crypt('', salt)
      except OSError as e:
          # Not all libc libraries support all encryption methods.
--        if e.errno == errno.EINVAL:
+-        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS}:
 +        # Not all libc libraries set errno when encryption method is not
 +        # available.
-+        if e.errno == errno.EINVAL or e.errno == 0:
++        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS} or e.errno == 0:
              return False
          raise
      if result and len(result) == method.total_size:
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 596f3e7c18..c625e7a8ea 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3  Python-3.10.6.tar.xz
+sha256  6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48  Python-3.10.7.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e34e7d1750..b7df26781a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
