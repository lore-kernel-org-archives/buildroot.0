Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A6C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F524040E;
	Wed, 26 Aug 2026 20:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lo3EBJVMIsI4; Wed, 26 Aug 2026 20:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787777782;
	bh=h/VwZOudCyRYcgsu/aDyEja5KWHnwk14dOiDf3m6k98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=roV8EqFYzVk6asJ0HG+F+6A9xRAWQ3v0R6Pc113OiuiBY0tXG4AYbkZWPok8FAaz5
	 FSrxLANO7ieZy7Q9HnP4TMCJN6SUemdnocr9iF+4QftXxzWJT9w+7AK+icP2u8OlOU
	 2MvNNt5c57E7eWYNpPP3fhtXMxYYwoWOy1McZ4UTlfJ3/RqfyvMzBFOu5m9Bq/FTCt
	 ftWCXv25/7D14kKX5MfE5c3X7ClZrpeqHNSGkW1RocgQYGqqCUfsp1fF0RqeLPcGSq
	 eJK9kYJh/VtSk8oqaL80EY6QnOkwgt+WP1QB0oH2CUeY5xQ/GlLpLq0TbYgkf0asql
	 PMKxs7pC8zF8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00D9406C4;
	Wed, 26 Aug 2026 20:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E46829B
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84588406C4
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyGEHZdRVYW6 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D09264040E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:56:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA2B59208E; Wed, 26 Aug 2026 20:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 22:51:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0619dfc6bb21e6b43fe75b19ee164521a59367e
X-Git-Newrev: 52ae04257a05da271623dd6375ca1cc7171a9ae1
X-Patchwork-Hint: ignore
Message-Id: <20260826205524.AA2B59208E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: upstream patch
 CVE-2026-19654
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52ae04257a05da271623dd6375ca1cc7171a9ae1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- CVE-2026-19654:
    A unauthenticated remote peer may lead rsyslogd to crash due to a flaw
    in the optional imptcp module. A crafted input sequence during
    oversize-frame recovery can cause an invalid internal message length
    and terminate rsyslogd. No confidentiality or integrity impact,
    privilege escalation, or code execution has been identified. imtcp and
    the default imptcp framing modes are not affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-19654
  - https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...p-guard-regex-framing-match-at-line-start.patch | 47 ++++++++++++++++++++++
 package/rsyslog/rsyslog.mk                         |  3 ++
 2 files changed, 50 insertions(+)

diff --git a/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
new file mode 100644
index 0000000000..5eff609fdf
--- /dev/null
+++ b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
@@ -0,0 +1,47 @@
+From 07b3c40a5a78c79ed9109251f842ca7e955dd586 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 20 Jul 2026 17:19:28 +0200
+Subject: [PATCH] imptcp: guard regex framing match at line start
+
+Why
+A regex match at the beginning of the receive buffer can form a
+negative message length after oversize-frame recovery.
+
+Impact
+Regex-framed imptcp listeners reject that invalid transition instead
+of submitting a negative message length.
+
+Before/After
+Before: a match with a zero line offset submitted an invalid length.
+After: only a match following an existing line can submit a frame.
+
+Technical Overview
+Mirror the line-offset guard used by the shared imtcp parser.
+Leave existing regex framing and oversize recovery behavior unchanged.
+
+Security advisory:
+https://github.com/rsyslog/rsyslog/security/advisories/GHSA-cj5r-wh2m-7w29
+
+Reported-by: Raphael Eikenberg (@eikendev)
+With the help of AI-Agents: Codex
+---
+CVE: CVE-2026-19654
+Upstream: https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
+Signed-off-by: Thomas Perale <thomas.perale@mind.be
+---
+ plugins/imptcp/imptcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/imptcp/imptcp.c b/plugins/imptcp/imptcp.c
+index 838e1648fc..90a7d6f7ed 100644
+--- a/plugins/imptcp/imptcp.c
++++ b/plugins/imptcp/imptcp.c
+@@ -1009,7 +1009,7 @@ static rsRetVal ATTR_NONNULL() processDataRcvd_regexFraming(ptcpsess_t *const __
+         pThis->iCurrLine = pThis->iMsg;
+     } else {
+         const int isMatch = !regexec(&inst->start_preg, (char *)pThis->pMsg + pThis->iCurrLine, 0, NULL, 0);
+-        if (isMatch) {
++        if (pThis->iCurrLine > 0 && isMatch) {
+             DBGPRINTF("regex match (%d), framing line: %s\n", pThis->iCurrLine, pThis->pMsg);
+             strcpy((char *)pThis->pMsg_save, (char *)pThis->pMsg + pThis->iCurrLine);
+             pThis->iMsg = pThis->iCurrLine - 1;
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index dedecdc572..bcc66167af 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -12,6 +12,9 @@ RSYSLOG_CPE_ID_VENDOR = rsyslog
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 
+# 0001-imptcp-guard-regex-framing-match-at-line-start.patch
+RSYSLOG_IGNORE_CVES += CVE-2026-19654
+
 ifeq ($(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),y)
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
