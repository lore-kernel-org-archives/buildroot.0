Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D87F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8039D40BF0;
	Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8vDx41yt1wK; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5640BE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295248;
	bh=Ma53Gh0rbXO/5OA5PwPNe4NTaiBhNZcWSgQPlBWgfwM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hH88psIcGVYQfSbOtal5WDH9tVQh+Z5qtFJ9qtI4Cpt8gbu4C1XHi7irdbz02msJe
	 7UfYazHRr5/JjU1zI2oGw8DPo5zareOb0RXIMrFZI9+L/zDVzUOQwqkVSEsjN2nLRP
	 lbDUHQUJXCYzdhMipQnnxVUXDVTbevIdhybGXuJreg2N3fSQBXyq1Hg0fzUtpD6sBx
	 VcnxpKoMqITIkBLkssHErfYmv5sOJ0yPO38rZVn92U/D4o6+CKV64ey8ReOWX2BM9L
	 WKPoIvbArrhzgA7+uxV8zYTIaZvw4h9+w61UtmbGhhzXWeDRxK5y/X61Q+4um6wCt5
	 PIGKTmGcaiWQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF5640BE9;
	Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D984F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEF6F40BBB
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlB4HMqF6t_0 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD18B405D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD18B405D6
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1A7784C28; Mon, 23 Mar 2026 19:47:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:51:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ba2393e088d3a13c507bdaa38c0df89bf4b67b16
X-Git-Newrev: 60c8ad4b008b955570b6ce732ac2908efd1277d1
X-Patchwork-Hint: ignore
Message-Id: <20260323194713.F1A7784C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: remove Marcus
 Hoffmann from no longer used packages
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60c8ad4b008b955570b6ce732ac2908efd1277d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Remove myself from packages that I'm no longer personally interested in.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1210e4efeb88b4e6c298ce20fb8fc4f660fafc8d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c6b384f935..d9fbca8898 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2214,29 +2214,14 @@ F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
-F:	package/pico-sdk/
-F:	package/picotool/
 F:	package/python-django/
-F:	package/python-immutabledict/
 F:	package/python-jc/
-F:	package/python-pydantic/
-F:	package/python-pydantic-core/
-F:	package/python-pydantic-settings/
-F:	package/python-ruamel-yaml-clib/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_django.py
-F:	support/testing/tests/package/test_python_fastapi.py
-F:	support/testing/tests/package/test_python_pydantic.py
-F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_requests.py
-F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_django.py
-F:	support/testing/tests/package/sample_python_fastapi.py
-F:	support/testing/tests/package/sample_python_pydantic.py
-F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_requests.py
-F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
