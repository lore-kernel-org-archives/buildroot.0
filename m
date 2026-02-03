Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60CDE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8A6608D0;
	Tue,  3 Feb 2026 09:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzYaGHnLqkGN; Tue,  3 Feb 2026 09:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B214060B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109811;
	bh=YihZ4gNV2Sh6h75XuCsGK6MDHwklsJ7FFtjuSpGV2Oc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Evc1mJhXqmc+stn4sjiotFuRr04QiJq1/RpJtX49xGoJ9v3ncokVCL4ptONKUkjct
	 whUJDsf9QzAcmsnJpKG6RfnQ7fWVMGGNCXudWmK1Rd50FQ0uyq5/DUbD8sBe0kGfHK
	 33WLDbTZpLWkiDI4UJNTj0EDiEcvZDBF2cehDjktvZRu861mIgFgvlEDJTX6Q8DBvp
	 qU0BG6EZkNGttSYysj0sI4A+1ao9rvHxBxi1jnll7vRFaXuKoHmrqzKnVuZP/RVkE6
	 eOPEDnLlKHBXPs1HA8/yY0KXU8rblUdeaPaMADmO5gqcoaXbRaalU/mLcE2fX1cfWE
	 6WD9DEiFi+uRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B214060B7B;
	Tue,  3 Feb 2026 09:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4E11A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A101B402DD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXx_b8ILTDO9 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDEEB40452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDEEB40452
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5458865B4; Tue,  3 Feb 2026 09:10:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 10:09:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bfea99b11e34862f1527bd9d823c580fab5a66d
X-Git-Newrev: f5a8cb5564bd4129e1a55f40fcc45b5ff9385e2b
X-Patchwork-Hint: ignore
Message-Id: <20260203091009.D5458865B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zipstream-ng: select python
 zstd module
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5a8cb5564bd4129e1a55f40fcc45b5ff9385e2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since zipstream-ng v1.9.0 the python zstd module introduced in python
3.14 is required at runtime [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12857413941

[1] https://github.com/pR0Ps/zipstream-ng/commit/1e3754cb26a422e94984db38535139c2c92473af

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zipstream-ng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-zipstream-ng/Config.in b/package/python-zipstream-ng/Config.in
index 2de36dd861..b60f2ebe41 100644
--- a/package/python-zipstream-ng/Config.in
+++ b/package/python-zipstream-ng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ZIPSTREAM_NG
 	bool "python-zipstream-ng"
+	select BR2_PACKAGE_PYTHON3_ZSTD # runtime
 	help
 	  A modern and easy to use streamable zip file generator.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
