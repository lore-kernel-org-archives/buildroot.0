Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9011EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBCCA847FB;
	Fri, 13 Feb 2026 19:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXrid0Sfwe9A; Fri, 13 Feb 2026 19:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C01CF847F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011514;
	bh=dAj7QQW7ZyzHsr/OIv49nPOguS4hC1f+zMtTmjMR7J0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rfUlTLcbENpPjTTmIQfpwqmH6KLqZMpjh2Fcva10tL/6NUrZZh91lGyfAPn9MFGPe
	 oakM3Fu8Wu2Ydy6GsnJFDVVeqsVZ8kSjlSNmCNyM28WZKCYacGpF13K1o1EquyCGRa
	 T6NQk+yYV94zmkds3u6OojSPpBOReXxmlFl2fkO7mSJcfLpnMhpFLrnpLMwaBZvdfW
	 +vcKz8+VfzjVcMQx5NlJo4ZKRA2yhm7+Yz2thgEicg+u0T8AOfrmDwPtXfkKzUfmvp
	 UZjeO8Ktp98vJ7lYFGJK9PKG6ArsppbuyNGxHviMMx4dajmZzN7KK0TueLuajYoZxO
	 S7CeAaTzW77zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C01CF847F7;
	Fri, 13 Feb 2026 19:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52FE0EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86EE941319
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meLb49Syw1qd for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13835412F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13835412F9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08F1E82A80; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:53:51 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 311c0536e8f29eee3fedb1f13df5ecadaee511df
X-Git-Newrev: d2caf50d543036b1f50c5cf9b86cdc2e09a51cda
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.08F1E82A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: fix
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2caf50d543036b1f50c5cf9b86cdc2e09a51cda
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 02386bb34d9a313d75d4aaf24c59062fe2e66557)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
