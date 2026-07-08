Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB8C44508
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F2F80FF5;
	Fri, 10 Jul 2026 13:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eRHRSWhBxR1; Fri, 10 Jul 2026 13:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50114810BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691089;
	bh=FdQPbWwM++vBh0/OnwZ68x/rsXTQDbaWw5JUMBMGmg0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DDSKrEu1Jza8kuCcCA4x7xKN3kgitJmWg+7qRTFgon4Ibz5fewVd2NbcOali/owHb
	 k+7Fz1UxSRH6opf8mglxxGO7phQcIhCSWJJBk1nH/NKM/whbw46UXVpX2eyESeuAOw
	 l7h6yWFFcUxdn94EtG9vMvs4BVKqiyUXLBWWuTKoYbJdNOUAH65HhLNWznO1NP82An
	 y1htk8OhgHKefa7MQpmkykl2zHh7bnb7cEHzwuD7hBisCLGwAliGzmQATwK3Uyuy3+
	 15JrXH45t4OHmYpVSmh94YxqVJIbPgOM95uvX/6aWH9SY8r29qwPfOm/CI7Qo8fkZO
	 WpfRzZSHuP4zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50114810BC;
	Fri, 10 Jul 2026 13:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B17FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E715606A8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGnDT1gTaO3Q for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 872646068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 872646068F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF7698868E; Fri, 10 Jul 2026 13:44:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:48:32 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 68895e688225e21e6d2d2a9d1af615ba82e968cc
X-Git-Newrev: 2723abb9f43e99257371a4f89f6b72a79f256921
X-Patchwork-Hint: ignore
Message-Id: <20260710134408.AF7698868E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2723abb9f43e99257371a4f89f6b72a79f256921
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The sample script would've passed even if the connections list was
empty. Check that there is at least one connection, and that the
sample script can read loopback device information.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit f38f5bb5939fc3fe896ace714182e2ed8d8c0a2f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
