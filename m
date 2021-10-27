Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A29C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:46:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C984160EFE
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C984160EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AC5E60B27;
	Wed, 27 Oct 2021 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdyK1PEpX-22; Wed, 27 Oct 2021 19:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A2160B20;
	Wed, 27 Oct 2021 19:46:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3B541BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEB8760B26
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPpp4cTcZ61q for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:46:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 314E560B5C
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:46:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D5C8188FCB; Wed, 27 Oct 2021 19:42:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:33:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23186356a1c8f6cb8a104e783034e25633a0fe40
X-Git-Newrev: 18bbeefb9990d81cef892b63e843563b4ae5b768
X-Patchwork-Hint: ignore
Message-Id: <20211027194244.D5C8188FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.txt: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=18bbeefb9990d81cef892b63e843563b4ae5b768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The directory that containts tests is "support/testing/tests/", not
"supporting/testing/test".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/contribute.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 193e9f65b0..36512c0ee3 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -609,7 +609,7 @@ be the maintainer of that test case.
 
 Within the Buildroot repository, the testing framework is organized at the
 top level in +support/testing/+ by folders of +conf+, +infra+ and +tests+.
-All the test cases live under the +test+ folder and are organized in various
+All the test cases live under the +tests+ folder and are organized in various
 folders representing the category of test.
 
 Lets walk through an example.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
