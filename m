Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A724FEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A438465E;
	Fri, 13 Feb 2026 19:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mo_Nf7Yxfv3h; Fri, 13 Feb 2026 19:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 593E284794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011495;
	bh=vxQOjLje2Ut+A2XSU7YiEVQqH2d7D06hRMwPOG0Rw0I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gbAbzz4EbikowOLSM5rjNulbic/JYe4UpLxarYy5huB5kyIzn9m9XSxsXqdSsKsye
	 Kk7+EU1dhGUAJF4sywro/msKTJLsVsEkG0IO0rc9wx7gCaN5Xy0DiSYol1c4SsMOsy
	 iO7IV6CysZwQgECiqMwIR+wq1tVzlTN5wQp9XmIP1gpRe0XEiPeb57LkW1o5TByd6v
	 kn92Dpp6EZh/OUGTEwyHt6s7LnNNm+l5DwdhSEHBf/kB9IpjjHHZSAy0ZZyKaqG0nO
	 hz3V1t9CIMzZKR399G7Sx44ZoTsabQubpiCJG2E0Is1ioXDCWG6cwONCUxCvwDj3IY
	 RIXsYZR5hOsyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 593E284794;
	Fri, 13 Feb 2026 19:38:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6115F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1CC3413F0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joUI7eDZ7YW8 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201A7412FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201A7412FA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1556885DA7; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:54:07 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d2caf50d543036b1f50c5cf9b86cdc2e09a51cda
X-Git-Newrev: bdc77eddfec4256741f2dcb1de3e5053936670c2
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.1556885DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdc77eddfec4256741f2dcb1de3e5053936670c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
(cherry picked from commit 287d06f5d7a99521a6a2ccf0f0c39159d5e5f2ef)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
