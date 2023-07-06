Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC87EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29B7F417D3;
	Thu,  6 Jul 2023 10:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B7F417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TquNh7Pd5rbE; Thu,  6 Jul 2023 10:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D526D40156;
	Thu,  6 Jul 2023 10:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D526D40156
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDFD1BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77F5C405A8
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77F5C405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OigGZnz4s1SU for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D37C402A7
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D37C402A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F17CE86816; Thu,  6 Jul 2023 10:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 12:37:11 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 157ecd6d6e2856a1b8ae95d167e1cc459bb47914
X-Git-Newrev: f7ae6d3148f6428383209ca5745d2d09eea39a62
X-Patchwork-Hint: ignore
Message-Id: <20230706105249.F17CE86816@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] linux: fix kernel hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7ae6d3148f6428383209ca5745d2d09eea39a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes commit which added hashes for wrong files:
https://git.busybox.net/buildroot/commit/?id=88108f9793f5824fa058b878974f234ebe834325

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d4a96ee46e3656b95151ab8e27d3fd3407e4633a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
