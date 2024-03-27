Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFD2C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 21:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C854F600BB;
	Wed, 27 Mar 2024 21:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvVTAHb2-E51; Wed, 27 Mar 2024 21:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6FA560603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6FA560603;
	Wed, 27 Mar 2024 21:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8DE01BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5BAE415B1
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 21:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABA6sKaVTp1X for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D598D40199
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D598D40199
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB0538431E; Wed, 27 Mar 2024 21:17:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 22:09:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dde89fe703507798e52c8250e3a38dd4d4fa5a36
X-Git-Newrev: f0bc79fc8dd6be999f11df9b9f774434d1ba513f
X-Patchwork-Hint: ignore
Message-Id: <20240327211724.CB0538431E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: add cython for
 python-sqlalchemy
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6754670087640726463=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6754670087640726463==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f0bc79fc8dd6be999f11df9b9f774434d1ba513f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When migrating to setuptools with pep517 support we need to add
host-python-cython which is a pep517 build dependency for
python-sqlalchemy.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-By: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-sqlalchemy/python-sqlalchemy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 400ad92f63..167c3a4498 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -12,5 +12,6 @@ PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
 PYTHON_SQLALCHEMY_CPE_ID_VENDOR = sqlalchemy
 PYTHON_SQLALCHEMY_CPE_ID_PRODUCT = sqlalchemy
+PYTHON_SQLALCHEMY_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))

--===============6754670087640726463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6754670087640726463==--
