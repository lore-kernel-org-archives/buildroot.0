Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FFDC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FEBF60F8D;
	Wed,  2 Nov 2022 22:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEBF60F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wra3jdlN_qeQ; Wed,  2 Nov 2022 22:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 291E060F78;
	Wed,  2 Nov 2022 22:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 291E060F78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D83C1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76D67408DC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76D67408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-tZvZf2GGwZ for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:54:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD6AF40B20
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD6AF40B20
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EB187B1B; Wed,  2 Nov 2022 22:54:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:53:33 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 260a7432716326bef1f171a071373bcf16b353ad
X-Git-Newrev: fb56bbe8f80e88e45b1ea93f595551635f654810
X-Patchwork-Hint: ignore
Message-Id: <20221102225441.C7EB187B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/openssh: fix hash
 of LICENSE file
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
Content-Type: multipart/mixed; boundary="===============3778741067032411910=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3778741067032411910==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fb56bbe8f80e88e45b1ea93f595551635f654810
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The bump from 9.0p1 to 9.1p1 in commit
bb571dc3e87d0e84b3ae121e0d4a9c6039a051fa forgot to update the hash of
the license file. The license file change (detailed below) does not
change the license terms of OpenSSH:

--- output/build/openssh-9.0p1/LICENCE	2022-04-06 02:47:48.000000000 +0200
+++ output/build/openssh-9.1p1/LICENCE	2022-10-03 16:51:42.000000000 +0200
@@ -231,6 +231,7 @@
 	Eric P. Allman
 	The Regents of the University of California
 	Constantin S. Svintsoff
+	Kungliga Tekniska Högskolan

 	* Redistribution and use in source and binary forms, with or without
 	* modification, are permitted provided that the following conditions

Fixes:

  http://autobuild.buildroot.net/results/697cdcea128c3716c9ae81be6c97937ebd80a5da/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 291c6c27adaf75ffd1d84b920e1ed79c3f84cc13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 81cea32d2c..eefb11ec15 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
 # From https://www.openssh.com/txt/release-9.1 (base64 encoded)
 sha256  19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288  openssh-9.1p1.tar.gz
 # Locally calculated
-sha256  d6807e99f3d159145c659060f57c3fa74e109faa39326dbfc38674cb550fd104  LICENCE
+sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE

--===============3778741067032411910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3778741067032411910==--
