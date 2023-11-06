Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCA2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82532417D2;
	Mon,  6 Nov 2023 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82532417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAoAJiJL5Utf; Mon,  6 Nov 2023 21:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A98417AE;
	Mon,  6 Nov 2023 21:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A98417AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 164401BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E27F5417B4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27F5417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxbksSiG9Y_s for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAEAE417AD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAEAE417AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7512869A9; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:05:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9233db918edc05ceecca78fd23de9110507a231
X-Git-Newrev: 4ec5e32762757110c26f67c84661841880f94d03
X-Patchwork-Hint: ignore
Message-Id: <20231106210558.A7512869A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ec5e32762757110c26f67c84661841880f94d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For an unknown reason, hash added by commit
c1d5eada4d4db9eeaa1c44dd1dea95a67c8a70ca is wrong:

>>> host-nodejs-src 20.9.0 Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758
ERROR: got     : 93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e

Fixes:
 - http://autobuild.buildroot.org/results/a199f128bc1d59a311f3ae683dcc14a1d6f3bb7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index da027cc17a..2d60437a7c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -5,4 +5,4 @@ sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v
 sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
 sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
 # Locally calculated
-sha256  a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758  LICENSE
+sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
