Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CDFC30653
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB25405E0;
	Sun, 30 Jun 2024 09:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jybrkOfIOveM; Sun, 30 Jun 2024 09:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9088E408AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9088E408AA;
	Sun, 30 Jun 2024 09:28:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2DB81BF969
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFBBA403F8
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaQlyBOfJ1Tl for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A036E4038E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A036E4038E
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97387817AA; Sun, 30 Jun 2024 09:28:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 11:23:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5080088ceda1e4873e5408e1961dec7b844a607
X-Git-Newrev: e1c86e1cac9f41f930d915cdca03608b57b83182
X-Patchwork-Hint: ignore
Message-Id: <20240630092850.97387817AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crda: update patches to be applied
 with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1c86e1cac9f41f930d915cdca03608b57b83182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, crda fails to build with output:

    Applying 0001-crda-support-python-3-in-utils-key2pub.py.patch using patch:
    patching file Makefile
    Hunk #1 FAILED at 112.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej

Rebase patch to fix the problem, problem was not yet caught by
autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
index f2b9cca2d6..00b5a52ea7 100644
--- a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
+++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
@@ -33,6 +33,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 [Romain: Use pycryptodomex]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd: rebased for version 4.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile         |   2 +-
  utils/key2pub.py | 146 ++++++++++++++++++++++++-----------------------
@@ -49,7 +51,7 @@ index a3ead30..8da38d0 100644
 -	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
 +	$(Q) python utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
  
- $(LIBREG): regdb.h reglib.h reglib.c
+ $(LIBREG): reglib.c regdb.h reglib.h
  	$(NQ) '  CC  ' $@
 diff --git a/utils/key2pub.py b/utils/key2pub.py
 index 9bb04cd..8a0ba2a 100755
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
