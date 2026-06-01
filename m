Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9CCD6E56
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 09:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59BBF41EDC;
	Mon,  1 Jun 2026 09:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPL7i9YkEoVC; Mon,  1 Jun 2026 09:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81E2941EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780306398;
	bh=ODDkXkeeLYXOkKTg/mEpKfBA3n0nBB7OtYCYzOjX+Z8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OFakp2CS/GSHwk+KG7WqHbLq3/SHfEMktyuQC+nGmsZcsBWLYyyOswwIYMJe8pJMp
	 mMsu9kjTbyWjJnfoHnINGSXUNDU7S3lyl+2fIa9iAdQx/UGdGoDbFPf6YNX+t7plEy
	 8uqL6oTLcJ+BLehqsMFznUrS8ZMlIyf6MB10vaHU2cO5nWenyIPKxKG88nqdct2KYg
	 lenXuSxuly3UxUwufrvMeE98EptUQ72CJPRtmIARfulhKgDBtiXGBUJMGRq+3OfjFQ
	 jXSvWnuZcz/EqvIDUuAf7/t9l+4h7186qkiP3hqvEqgmwoMNTbzMNq8gpc3V7jExZc
	 b3HpQZXxltUSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E2941EF1;
	Mon,  1 Jun 2026 09:33:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE764294
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9433D84CBC
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7p2x09mPoGX for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 09:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC1F84CAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC1F84CAE
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 09:33:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5069876F3; Mon,  1 Jun 2026 09:33:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 Jun 2026 11:32:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a9486d7d6595d37b0a8c096408a51503a1d1f59
X-Git-Newrev: db75a8eea0bda678e651fe2b2ba85c3e0b2bed31
X-Patchwork-Hint: ignore
Message-Id: <20260601093302.D5069876F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: needs host-pkgconf
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db75a8eea0bda678e651fe2b2ba85c3e0b2bed31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The configure script was regenerated for the 3.0.15 release but it now
error out if pkg-config is missing.

Add host-pkgconf in build dependency.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335870 (TestNginxModsecurity)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index c06d890979..8920cb012e 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -13,7 +13,7 @@ LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 
-LIBMODSECURITY_DEPENDENCIES = pcre2
+LIBMODSECURITY_DEPENDENCIES = pcre2 host-pkgconf
 LIBMODSECURITY_CONF_OPTS = \
 	--without-pcre \
 	--with-pcre2="$(STAGING_DIR)/usr" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
