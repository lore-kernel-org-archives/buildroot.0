Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD9C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F3F605E1;
	Tue, 11 Aug 2026 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pB2SRyALNdWo; Tue, 11 Aug 2026 19:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E703860872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786474870;
	bh=ISz3px1UFLNW/NWqjY64L2QGBi/VYTRrNtvyRg4663M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nw2aoWjLdoHhtNdO0TdHLFSlNzMQGdT4JXPHwqDfZGuv9+y8Nv1vfV/yHuWUm/I5/
	 U0dZd2bxwgv2w0+TjLJei5TTicrlUaSvc/4tkZY8CHRIpnNzwUZeOkj3fLAGk67gm+
	 X9AFStWVhhRefGD1rxf92HYMZQBpgOKTZFuiYo1u8X+aBR8vzL6vxMjbEcKe5iEQoY
	 luIufPIysE56lDCDGOt/0agEGYJYNcLXQhg62acFoNv+ptdDZu0kVkDlXLxKkZAw7u
	 cVGYLaOhkuOxxZGteae8IMPTRqAadul/glwwSJNbHnfQ6ZbgrDuOePxeLdCbNDVj4j
	 9fKgMGQb/HYNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E703860872;
	Tue, 11 Aug 2026 19:01:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6522740A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 571D9605E1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnZ-9psjsFkz for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547B060871
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 547B060871
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 641D88D3C0; Tue, 11 Aug 2026 18:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 20:51:00 +0200
Subject: [git commit] DEVELOPERS: add Alexis Lothoré for libldns and python_scp tests
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d38b4915e9437c5492836914c0a0fff12b4f1031
X-Git-Newrev: 1209f3f7a1daf68cdf1846af9a014d769d1e0a68
X-Patchwork-Hint: ignore
Message-Id: <20260811185128.641D88D3C0@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============2163379083861858927=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2163379083861858927==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1209f3f7a1daf68cdf1846af9a014d769d1e0a68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When adding the libldns and python_scp, the corresponding tests were not
added to DEVELOPERS, preventing correct notifications in case of tests
failures.

Add the missing entries to enable proper author notifications in case of
failing tests.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75607183c6..4460523447 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,6 +158,8 @@ N: 	Alexis Lothoré <alexis.lothore@bootlin.com>
 F:	package/libxmlsec1/
 F:	package/openscap/
 F: 	package/python-scp/
+F:	support/testing/tests/package/test_libldns.py
+F:	support/testing/tests/package/test_python_scp.py
 
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/

--===============2163379083861858927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2163379083861858927==--
