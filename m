Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30EC001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 17:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A55E80B4E;
	Sun,  6 Aug 2023 17:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A55E80B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GXIpb8kCR7N; Sun,  6 Aug 2023 17:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B29F381E28;
	Sun,  6 Aug 2023 17:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29F381E28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C72E1BF286
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43C4A4028C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 17:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C4A4028C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoLFLGzN66wM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74232400B1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74232400B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 626A18454B; Sun,  6 Aug 2023 17:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 19c12a521701035c166917919c220c33bf71ced0
X-Git-Newrev: 31a12000486d17d7009668ef4732892e581c4dc9
X-Patchwork-Hint: ignore
Message-Id: <20230806172337.626A18454B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-dicttoxml:
 switch from distutils to setuptools
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31a12000486d17d7009668ef4732892e581c4dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dicttoxml/python-dicttoxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index c26c16b72a..eb0049fd03 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -7,7 +7,7 @@
 PYTHON_DICTTOXML_VERSION = 1.7.16
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
 PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/ee/c9/3132427f9e64d572688e6a1cbe3d542d1a03f676b81fb600f3d1fd7d2ec5
-PYTHON_DICTTOXML_SETUP_TYPE = distutils
+PYTHON_DICTTOXML_SETUP_TYPE = setuptools
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
