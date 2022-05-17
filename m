Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68415C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A7481777;
	Tue, 17 May 2022 20:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NIS427oREZs; Tue, 17 May 2022 20:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BB48140E;
	Tue, 17 May 2022 20:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A85B71BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9730881465
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXjfpiTj1qiu for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4AE4813E3
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:51:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AB52385F91; Tue, 17 May 2022 20:40:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:50:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 837e3128687a1c892ff796b80b26edc4b1186d73
X-Git-Newrev: 5468cf1095f236fc01f16015a7cf6cfeee69fe55
X-Patchwork-Hint: ignore
Message-Id: <20220517204033.AB52385F91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-avro: fix capitalizations
 of Parse
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

commit: https://git.buildroot.net/buildroot/commit/?id=5468cf1095f236fc01f16015a7cf6cfeee69fe55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-avro 1.11.0 deprecated schema.Parse [1] and actually error
out when used.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770

[1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24be8cdfa9d8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
