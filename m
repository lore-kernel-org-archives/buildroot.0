Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2560C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 937A2436D7;
	Wed, 10 Jan 2024 20:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 937A2436D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8xqe2CK0V0G; Wed, 10 Jan 2024 20:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85A1543748;
	Wed, 10 Jan 2024 20:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A1543748
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1107D1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDBD143771
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBD143771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yiiuui2SU0Gc for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3FFB436D7
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3FFB436D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFDC985CC6; Wed, 10 Jan 2024 20:16:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:41:28 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 611458d90a8b6c5763ca54a765f959cde4fe0157
X-Git-Newrev: cae61066297f7a94c84fda4fe9c923270a30fc82
X-Patchwork-Hint: ignore
Message-Id: <20240110201651.AFDC985CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcap-ng:
 disable python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=cae61066297f7a94c84fda4fe9c923270a30fc82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

python3 is an optional dependency (enabled by default) since bump to
version 0.7.7 in commit 4314c86b0b932c3d381ae59b641366697906868f and
https://github.com/stevegrubb/libcap-ng/commit/02fc25f9d3a00c7d7ccd619d8d678511a73b940b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4d21ec5021f6ec9ba40a9f71a9028b7b55bc6aea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap-ng/libcap-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 46f72c702e..c33460d951 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -12,10 +12,10 @@ LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-LIBCAP_NG_CONF_OPTS = --without-python
+LIBCAP_NG_CONF_OPTS = --without-python --without-python3
 
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-HOST_LIBCAP_NG_CONF_OPTS = --without-python
+HOST_LIBCAP_NG_CONF_OPTS = --without-python --without-python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
