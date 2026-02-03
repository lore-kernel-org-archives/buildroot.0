Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1218D172B9
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915F981A27;
	Tue,  3 Feb 2026 10:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPXgkx4sOD1F; Tue,  3 Feb 2026 10:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D80781A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770113843;
	bh=V3BeCheFpJlBzSl/zEl0Nj8YnoMruJCr6FWFJVmWsDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aZfIGCiSs5th/SLnRAAZm1l7sLzzJsx3kyTRXPDBzbVNVySOa+/ulkOwhdpQHXSSU
	 CWZsDk6tAsNS9HzSvOxF6K9n83dU4dQ2OATpGYcppciWxH3GCsonXQ0twnSIuAlH/6
	 X4Tqlp2jQynLvSPjzUTbNXyg8RY4XgUHGFFDX1qhLBfqpuEaxXBYONoLs8+nVLII4b
	 /+R167yG4VGCdzos3ANzMtoNdsRBap/LVVSwlk4FpfylJVmdgpb2+06l8X1TfyzrjY
	 zMgFs/n/lbenFO7YQQvCOu5s3m7jzO+nXyi1NZSgV9el0OSAK7yOuQZHBNljeJeKc7
	 9MPiyHpQYYevQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D80781A8E;
	Tue,  3 Feb 2026 10:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A97DC1A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95EC081A27
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA74_NqSAAxz for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E455A816F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E455A816F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7E6183A3C; Tue,  3 Feb 2026 10:17:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 10:31:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bad9ad584bd8b02fec1bfe161c3cb2559461b0c
X-Git-Newrev: 02386bb34d9a313d75d4aaf24c59062fe2e66557
X-Patchwork-Hint: ignore
Message-Id: <20260203101720.D7E6183A3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix
 SdbusModemmanager/SdbusNetworkmanager duplicate test name
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02386bb34d9a313d75d4aaf24c59062fe2e66557
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python_sdbus_modemmanager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
index 34ab66e3bf..58e02f99ef 100644
--- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -1,7 +1,7 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
+class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
     __test__ = True
     config = (
         TestPythonPackageBase.config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
