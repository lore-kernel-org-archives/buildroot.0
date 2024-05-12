Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8753C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7103D4010C;
	Sun, 12 May 2024 07:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPbOjH9-EpKX; Sun, 12 May 2024 07:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A74E4011A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A74E4011A;
	Sun, 12 May 2024 07:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45B511BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31DC5607FF
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njNZteBaWvtV for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 373F7607E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 373F7607E0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:56:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C972E87057; Sun, 12 May 2024 07:56:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 09:55:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe64a69110928c69d1573281f99b8a3204e9c35
X-Git-Newrev: cfda1f0b87ebfb7686b82f319c531d4d28fdfd67
X-Patchwork-Hint: ignore
Message-Id: <20240512075602.C972E87057@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gr-osmosdr: add missing
 host-python-six dependency to python support
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
Content-Type: multipart/mixed; boundary="===============1251499154506134898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1251499154506134898==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cfda1f0b87ebfb7686b82f319c531d4d28fdfd67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Osmosdr failed to build docs when python support is enabled.
[ 41%] Copying osmosdr docstring templates as pybind headers ...
Traceback (most recent call last):
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/update_pydoc.py", line 22, in <module>
    from doxyxml import DoxyIndex, DoxyClass, DoxyFriend, DoxyFunction, DoxyFile
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/doxyxml/__init__.py", line 69, in <module>
    from .doxyindex import DoxyIndex, DoxyFunction, DoxyParam, DoxyClass, DoxyFile, DoxyNamespace, DoxyGroup, DoxyFriend, DoxyOther
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/doxyxml/doxyindex.py", line 31, in <module>
    from .generated import index
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/doxyxml/generated/index.py", line 13, in <module>
    from . import compound
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/doxyxml/generated/compound.py", line 15, in <module>
    from . import compoundsuper as supermod
  File "/home/martb/Schreibtisch/DiscoSAT/satos/output/build/gr-osmosdr-0.2.4/docs/doxygen/doxyxml/generated/compoundsuper.py", line 15, in <module>
    import six
ModuleNotFoundError: No module named 'six'
make[2]: *** [python/bindings/CMakeFiles/osmosdr_docstrings.dir/build.make:73: python/bindings/docstring_status] Fehler 1
make[1]: *** [CMakeFiles/Makefile2:332: python/bindings/CMakeFiles/osmosdr_docstrings.dir/all] Fehler 2

Fixes:

  http://autobuild.buildroot.net/results/b60e339e52fbc7ed7607a94381aaab6ec64b7a99/

Signed-off-by: Martin Böh <contact@martb.dev>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 8491c005d8..316ed80887 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -24,7 +24,7 @@ GR_OSMOSDR_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
-GR_OSMOSDR_DEPENDENCIES += python3
+GR_OSMOSDR_DEPENDENCIES += python3 host-python-six
 else
 GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif

--===============1251499154506134898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1251499154506134898==--
