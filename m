Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36CBEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117334047B;
	Sun, 18 Jun 2023 19:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117334047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uC-2MUUG_vXb; Sun, 18 Jun 2023 19:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 343E440583;
	Sun, 18 Jun 2023 19:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 343E440583
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8089E1BF316
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6728B40471
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 19:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6728B40471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkssRRh4rOG7 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 19:28:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B090400DA
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 19:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B090400DA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24D958414F; Sun, 18 Jun 2023 19:28:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 21:21:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f36c57728aa43df2355db731d90712a5a29cc501
X-Git-Newrev: d4a96ee46e3656b95151ab8e27d3fd3407e4633a
X-Patchwork-Hint: ignore
Message-Id: <20230618192803.24D958414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix kernel hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4a96ee46e3656b95151ab8e27d3fd3407e4633a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes commit which added hashes for wrong files:
https://git.busybox.net/buildroot/commit/?id=88108f9793f5824fa058b878974f234ebe834325

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.hash | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ee510f836d..d90f6cb2a3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  927ba93d3da556c8e30b2640aa3f19c3c3cda66c655754e0798024020e2981b4  patch-6.3.8.xz
-sha256  84c638ee9a36e30ef879e2944c5adfc2523a5a1553951b40e8cf4d873426d90a  patch-6.1.33.xz
+sha256  4323d421250e2e444c35d36f4aa8ddb56591dedc25c68d359d19c4ef9dd20955  linux-6.3.8.tar.xz
+sha256  b26f7cbcbf8031efc49f11f236f372fc34a4fd5fc6ad3151b893d1aa038ed603  linux-6.1.34.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c8c39191dc89ccb8f0fd05e4b06c9bcc77672156bdc64fe445d2109c116a3432  patch-5.15.117.xz
-sha256  1bde9f3d8bace93e634ca0841fca14fcbd7b6d53cf877ee3e7f18778bf842455  patch-5.10.184.xz
-sha256  5e627d9086f539e65c91f6e5c59c8bb66b59f9d369173dc0ccb14f70795d1876  patch-5.4.247.xz
+sha256  a9a8331f3c0e004b40a41f30d688b53bf85405597ac41c2c89be7f4fbcf7239f  linux-5.15.117.tar.xz
+sha256  77a9bebc1d1fa057212a3ac62c2a0784aafcdef149032df8898ebc9ed3c62908  linux-5.10.184.tar.xz
+sha256  33010d4f02314dd4eb51ab5d09f49ce970f2cfefe9f2133a2e085cac5dfffed7  linux-5.4.247.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  663669feee6ad4814704bf6dcc89ebbf64e1862f4dc231bc6327e33acea99823  patch-4.19.286.xz
-sha256  faa5db19c03aaa96417c2c3e76fbc10886d25b9f26179ff653e3c29f6707840f  patch-4.14.318.xz
+sha256  47841504f334b24fe411270954423202ed84e21251edf5a61d40bde59051089d  linux-4.19.286.tar.xz
+sha256  c63a327e799b8a30ca96167f66100d4d7788338ac0a8cf5fc492c97e303211bc  linux-4.14.318.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
