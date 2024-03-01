Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B638C54E41
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BF561043;
	Fri,  1 Mar 2024 10:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3am9Q6pJkNW; Fri,  1 Mar 2024 10:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D2B61048
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D2B61048;
	Fri,  1 Mar 2024 10:11:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E17B1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9DE607E1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fywk8VRamb89 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEFA607E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EEFA607E7
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A3E987E7F; Fri,  1 Mar 2024 10:11:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 11:09:34 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ef05ba673b964e4a1887bde7a5fe28a23ac26fc2
X-Git-Newrev: f3c00526a30ea02d60a613b4ea2f8f4c7195ef3e
X-Patchwork-Hint: ignore
Message-Id: <20240301101129.6A3E987E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-bitstring:
 add missing runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3c00526a30ea02d60a613b4ea2f8f4c7195ef3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

python-bitstring require python-bitarray and python-zlib at runtime
since 4.1.0 release [1][2].

python-zlib is now needed for the "Experimental support for two 8-bit
float types" [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/6114047821

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
[2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f1e1b1b171618952725bffdbe73827e062735c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bitstring/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
index 93d7682577..82d0bb29c6 100644
--- a/package/python-bitstring/Config.in
+++ b/package/python-bitstring/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_BITSTRING
 	bool "python-bitstring"
+	select BR2_PACKAGE_PYTHON_BITARRAY # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Simple construction, analysis and modification of binary data.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
