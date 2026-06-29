Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A40C43602
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 351D540A38;
	Mon, 29 Jun 2026 21:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ABbtp-EKUz4; Mon, 29 Jun 2026 21:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C38640A86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782768413;
	bh=zWKC6tzWAYyHmir03++bQOsLxVN2xWxxp+JvVO0TkSg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qO2roJgNov2BS0z4jOWHFbrGw2xlOUxBbn8snp06rDEk9Y8sskAyE0il8Hl0S1FJF
	 iZOQrO7JOu+YXV+1r++hcsbjiJvietu4XwCRKWG+rnuE6b2+GD7JJ3quCHgI1v8DJt
	 TUysUUqJgmtbDHrePdaF3DY5skx9f8M4jgeQnF7waatPQhGVzhaZJlMnt42GHDzdk/
	 oKaFp34FWWt2v8Wc24SYoJ/Ams9eSF1FVH6SdrDQSuHp6XlEI89sr7WIXRfD4q/dHZ
	 sWX3ih+EK2jVEXoUUBOknorRC81D7XIdJbxHHMF56x7+scxYdt7cjLw882gRb1OlUl
	 MkppHqBAd8Juw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C38640A86;
	Mon, 29 Jun 2026 21:26:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7585A149
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B9D040A86
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zc71bipOE7yO for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC03740A38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC03740A38
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:26:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07AC38742C; Mon, 29 Jun 2026 21:26:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 23:22:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad9d4c8351016c0501eabaafde56d9f719d7ce1d
X-Git-Newrev: f38f5bb5939fc3fe896ace714182e2ed8d8c0a2f
X-Patchwork-Hint: ignore
Message-Id: <20260629212623.07AC38742C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing:
 TestPythonPy3NetworkmanagerGoi: check we actually get data
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f38f5bb5939fc3fe896ace714182e2ed8d8c0a2f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The sample script would've passed even if the connections list was
empty. Check that there is at least one connection, and that the
sample script can read loopback device information.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/sample_python_networkmanager_goi.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/testing/tests/package/sample_python_networkmanager_goi.py b/support/testing/tests/package/sample_python_networkmanager_goi.py
index 240e8437fd..dff68e66f9 100644
--- a/support/testing/tests/package/sample_python_networkmanager_goi.py
+++ b/support/testing/tests/package/sample_python_networkmanager_goi.py
@@ -24,3 +24,11 @@ for c in connections:
     print("{}:".format(c.get_id()))
     c.for_each_setting_value(print_values, None)
     print("\n")
+print("found {} defined connections".format(len(connections)))
+assert len(connections) > 0
+
+# check that we can find the loopback device ...
+loopback = client.get_device_by_iface("lo")
+# ... and read its type and status as expected
+assert loopback.get_device_type().name == "LOOPBACK"
+assert loopback.get_state().name == "ACTIVATED"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
