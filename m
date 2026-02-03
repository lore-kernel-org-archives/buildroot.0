Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03472E73165
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 10:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A779A81E5C;
	Tue,  3 Feb 2026 10:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RY7xk9pDqgqc; Tue,  3 Feb 2026 10:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B53481E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770113846;
	bh=Du1LlnIAYfOsfcgrpVQOfBq7VfnpkrU1tG9CgdJJX9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q7EszQOs+wySbaf1L93bv5yr3kqA1bR6jrqgi5CV/y6Ew/9o/Y7UOeqjXHH137OfI
	 gNq4KlTSZlj9nvlD/RTJomuue4QH4ZpdllzWgsxYaBKJ8JPuiIjO+wqYFNeeOtmHQE
	 x2YSqz+hvXnONhfNKI/vm9JomnD/k1xDCNqQhaWTcY/rPjUHM93Cm/x8f/R9TUkgbC
	 etE40AaJVPdUtbTKWbes3JqNOusPd9GhdXePWdvOV06yuSEUmZcxCzrzMtmAwkQ9Ma
	 5KB7ZaVkUcLHnilpvjmnOmiZK4ojuMnYy4+14NPc/k/tQwnAW9VfdJAT/wUttoj3v9
	 igw4IQ+J5MlfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B53481E78;
	Tue,  3 Feb 2026 10:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BCA8F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E269160E8D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMa_XcxFgtNz for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C1060E68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07C1060E68
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 10:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4937865DB; Tue,  3 Feb 2026 10:17:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 11:00:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02386bb34d9a313d75d4aaf24c59062fe2e66557
X-Git-Newrev: 287d06f5d7a99521a6a2ccf0f0c39159d5e5f2ef
X-Patchwork-Hint: ignore
Message-Id: <20260203101720.E4937865DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing:
 test_python_sdbus_modemmanager: remove unneeded systemd vconsole
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

commit: https://git.buildroot.net/buildroot/commit/?id=287d06f5d7a99521a6a2ccf0f0c39159d5e5f2ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test failed in the past, due to kbd build failure. See [1].
This specific issue was fixed by commit [2].

This commit was originally written to workaround this issue, which was
unrelated to the actual package being tested. Since systemd-vconsole
is not needed anyway, this commit removes it from the test config.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/12363929666
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/d98d9ba28ffa5b468fa243ae1a359aadef3ed0a0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: reword the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python_sdbus_modemmanager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
index 58e02f99ef..736c34b724 100644
--- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
+++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
@@ -8,6 +8,7 @@ class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
         + """
         BR2_PACKAGE_PYTHON3=y
         BR2_INIT_SYSTEMD=y
+        # BR2_PACKAGE_SYSTEMD_VCONSOLE is not set
         BR2_PACKAGE_MODEM_MANAGER=y
         BR2_PACKAGE_PYTHON_SDBUS_MODEMMANAGER=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
