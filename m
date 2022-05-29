Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD58C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2DA849F6;
	Sun, 29 May 2022 08:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1LxjuhXTjt1; Sun, 29 May 2022 08:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9BBD84843;
	Sun, 29 May 2022 08:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 643FE1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63DE360C18
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2EJDXvQ_sto for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD42A60DC2
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:54:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 35E4086573; Sun, 29 May 2022 08:43:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:50:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 238be7ae978c706ff8d9c189443ca032d4cfc95a
X-Git-Newrev: 5f24587ded47bc3df653fe6b98d956dc8c0520bb
X-Patchwork-Hint: ignore
Message-Id: <20220529084303.35E4086573@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-avro: fix
 capitalizations of Parse
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f24587ded47bc3df653fe6b98d956dc8c0520bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

python-avro 1.11.0 deprecated schema.Parse [1] and actually error
out when used.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770

[1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24be8cdfa9d8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5468cf1095f236fc01f16015a7cf6cfeee69fe55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/sample_python_avro.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/sample_python_avro.py b/support/testing/tests/package/sample_python_avro.py
index 79d2dcdb22..46363ad2bf 100644
--- a/support/testing/tests/package/sample_python_avro.py
+++ b/support/testing/tests/package/sample_python_avro.py
@@ -1,8 +1,8 @@
 from io import BytesIO
-from avro.schema import Parse
+from avro.schema import parse
 from avro.io import DatumReader, BinaryDecoder
 
-schema = Parse("""{
+schema = parse("""{
 "namespace": "org.buildroot.package.python_avro",
 "type": "record",
 "name": "Developer",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
