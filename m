Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A47E95A74
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEA3B407F0;
	Tue, 30 Dec 2025 10:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAxUxuoy16IS; Tue, 30 Dec 2025 10:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB6F407FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092273;
	bh=zcmfxZWXyViNcwrWV3dwXx+ef0bc6DNSfLcqksRq7v8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z3vJ3fsAwMCkVnJDpr0CKJHGkkeodvT4xJMq/zuFDj9V1z+P6UgSJ0w6AmKtix6VE
	 vF+jtpkE1HsaAgzm8gfKY2KqXJd+P8GBC/ZfcegccKvjpHfXUDx+7023VfUGKYHwVW
	 JSXTUadBxaiTz9Gbi/WWaplNEh7SeKCSmhpSRJrdqAqyvPI29cQH6IaJc3J02XIU7G
	 xH7uzrl4r+T8osjcV2G/GpGfzA8lXpl88sKs2ePL1e6AiF6qvjzNmNODw543KWvH+E
	 MAb1goyBevuLoHRWq5D76gXwJN6RUH0aEx+8WkUHofAcJJpqidUZder01UkkZUZ0av
	 jdBoNngJsWGwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB6F407FB;
	Tue, 30 Dec 2025 10:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD99E35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1068402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hvUpacIL16F for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753034026B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 753034026B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C8CB87BD1; Tue, 30 Dec 2025 10:57:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:53:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0729cf0832bcdf4e1a25e1de8c557953cc2cb44e
X-Git-Newrev: 7a8524a70173953e3a8a11456d25ec3fea347153
X-Patchwork-Hint: ignore
Message-Id: <20251230105734.4C8CB87BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xinetd: add CVE trailer in patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7a8524a70173953e3a8a11456d25ec3fea347153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                     | 1 -
 .../0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch     | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3e274f391f..4df0438291 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1124,7 +1124,6 @@ package/xinetd/0001-ar.patch lib_patch.Upstream
 package/xinetd/0002-destdir.patch lib_patch.Upstream
 package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
 package/xinetd/0004-configure-rlim_t.patch lib_patch.Upstream
-package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
index bb2ee1fc9a..c99879b478 100644
--- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
 
 Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
 
+CVE: CVE-2013-4342
+Upstream: https://github.com/xinetd-org/xinetd/commit/e7c1ba41f4f86b436fb82b0d55cd5d387bd4ecc4
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  xinetd/builtins.c | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
