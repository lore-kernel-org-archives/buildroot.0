Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB0606A32F
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oSr+n8Fn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DEE40732;
	Sat,  7 Nov 2026 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0czvCqD1yGJ; Sat,  7 Nov 2026 17:15:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B233640723
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794071717;
	b=HNYYtEoVRoOqJFj5k/+jqGjn7pI2EIix0kDHd/PBjKsyNx5wBdsh+HBn5mp8Bk2BXU0g
	 akGiOCfR9M8ES0nUNux3RI5VzTK7gUkcFdlZLqFn0VjW9YqiKyfSewEgHPpxmhBpdTaIZ
	 LbgMy1afCBnb44lpaChtT0gVVd8zw9f8rgPbOSH1pFU7Tpn1yZDvdmcuKEQXO0/mNcVaI
	 tXp+tEfMHoj07HnnBrls55HpFzlQxvnBmXiYhUgQXfRr9wszrySQ/JiaMfaxjuUfnuX+r
	 /5FlE1JMdwHdu0E+7XadsBsakSQdhUUqTx6GVtRANIdZecnXNhWniEA14SaaRDO09Aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794071717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=80rKv6iC571GiycGH7S3txlWByC4hEge+WE+UtCb+U4=;
	b=ekVP1HCBGqsnckRA+MaXSwdfTuBF1HWku3Aw0vB3GWIMYNMqGRmD+bCDdEQKtwwrSIS0
	 TGKvMBL7oAABGb3afjD0uydt6LXndUVAvHA6xZfGYtTdoMsyDJXxjIzeza/MDp6pWzN3z
	 3cDql7CzZKWZgNKDQHVQ6DCOoYLFVbDo3Frltw7g+UZT428VcFWg3df9yA7MnVkMKsAj7
	 b2XN0zOC/8jdJgXoj2w7LFZoBYNvTiedfDoRRU39KWns8Gdx9WAlDPBFwPF6USwIXNik/
	 LsgX6PdNCcMBR8X6XyGb6TQvKqHZrx8HzfMQLkEbT1hQ7Y/7ibjLoSMhUk/GPINkntQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794071717;
	bh=80rKv6iC571GiycGH7S3txlWByC4hEge+WE+UtCb+U4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oSr+n8FnKCDrfcFlU/UBIhZ/vF5f6upKUpme5rV+nS1DWYpMv+TuuzDu/S4+beo7C
	 eZh6pIqQVG2oJ6HgUdJ1M8slR6JVf22NA7yQXy6CIOQQ+7FJ7iZff0u30/KEyISxvg
	 JUNZqdq6vyqBLwx10vkBXt7OOVbdIlpCk+zJHID0d51E7EXyPb1C1eV4ofe+Qouc0y
	 YGdl/9ln4PNJSsI2SWU4En1qAlYOIujlVzv6u4AXL/VsYtYC34JGkD9IoB49U6P7CN
	 PlLX8SFHUpFQ2PAfwGc6MSvv5u9ZOTRGzL1Pc0Ny570Xzfxuca6tzXcri9FKprtHdw
	 MfE7CKjhOLISw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B233640723;
	Sat,  7 Nov 2026 17:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1B6432A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B148125F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nyNGOSYJzMK for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0BD6481069
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD6481069
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB97185F5A; Sat,  7 Nov 2026 17:13:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 17:50:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1de081c25b823d10a43921fac4c381ca3e70ef
X-Git-Newrev: 98de30557a490523487f880f843a0ae17970cc45
X-Patchwork-Hint: ignore
Message-Id: <20261107171342.AB97185F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: swugenerator: new runtime
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98de30557a490523487f880f843a0ae17970cc45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_swugenerator.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/testing/tests/package/test_swugenerator.py b/support/testing/tests/package/test_swugenerator.py
new file mode 100644
index 0000000000..2bfa1e7efb
--- /dev/null
+++ b/support/testing/tests/package/test_swugenerator.py
@@ -0,0 +1,13 @@
+import infra.basetest
+
+
+class TestHostSwugenerator(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-swugenerator"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_SWUGENERATOR=y
+        """
+
+    def test_run(self):
+        cmd = ["host/bin/swugenerator", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
