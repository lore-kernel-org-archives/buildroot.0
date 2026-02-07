Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2F5EE0AE0
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 14:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D8E40CEF;
	Sat,  7 Feb 2026 14:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRYxD4RLQpCl; Sat,  7 Feb 2026 14:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBBE40ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770474290;
	bh=GIBP05Yl9ZVz0FQ3amxVSuqxbv0/Gk/6C1lkuQIVoaY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IED4l59Jy5RLjFIIpYXKIETO0jsqr0HyuTmW9w69ZoFIDroMlZPJjQkuHNX/RH5XU
	 QSS5ToayBf4oxhPbUZCWq7Qd57hIL8pHIAD8ztQBxWL3XVkuYFBoA0SC0Zse49fO8h
	 gy9ZwwT/8riEQM6CzFURfWtu9Itz0AVUrdKrgVLhV0wIYwTGJ/m3bEfp2Wq6v7iIHw
	 5GlCBH0R+JDcMVX2zZiFD5FynnEjbIqC0IuyHWWkObRrIoKqrPmn7XUzCUoY62MNOd
	 hVMCOQnhz7jImQb6SaI6PjfWuBXuaddyvJc7YOTzULEArvoNT14XHrHx9PYfwpJGvc
	 GCHKzHXoGgOwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBBE40ACF;
	Sat,  7 Feb 2026 14:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7BCA2C5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 14:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8DE740ACF
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 14:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pqlCe-f2Ngl for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 14:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1042D40AC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1042D40AC6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1042D40AC6
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 14:24:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 970449170; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Feb 2026 14:24:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vojEk-0000000GmMN-3HNu;
 Sat, 07 Feb 2026 15:24:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260207111558.3353590-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 7 Feb 2026 12:15:58 +0100")
References: <20260207111558.3353590-1-bernd@kuhls.net>
Date: Sat, 07 Feb 2026 15:24:38 +0100
Message-ID: <87a4xkk4wp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=C7GGp36/vg1KuyJT7eGi9TKseW7KlCNjfoKZ5y4QS++dTwe1Ul8mPS2n/uYcs1IYhQqeT8q7b+PlOuAl1QOotHXtkWuVcd95FJQ4YW6hk2Md/kOoonrArc7Hdu3i1VG1Hu2DeD8vkgIiEu7RoMdH36aPM4KOElYriv106axuthr6CVQeY+SFxwWlVAuYHzjXYEHw2ZoHly8dcbywSWE5AYLzriXPqgPBFggUc7sl35DiwaeLgyqL+u+nwi/pnyvYZxdumGnwMPog7kcgQUsOthJT7aaGfv/GJXSboHPKYeg9TydjGpe46S1OXdQunWc2WXcS/xDlCDkr+oOLG5AjUQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=q0lnfB3wLeh8kPjbtCw9T5nQXQpjiIS9tBmxJYXnk1U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=C7GGp36/
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/swig: add host-swig
 wrapper script"
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > This reverts commit 20d5e36fe86322fa93b285bbe2c658f163368423.
 > Fixes:
 > https://autobuild.buildroot.net/results/e65/e656684298b0462f8044667e7384c64d6508f22f/

Ahh, that one uses the swig4.1 symlink.

Rather than reverting this, how about instead reworking the wrapper so
it works no matter what symlink it is called through:

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
index 61c885fc90..e6cf2df134 100644
--- a/package/swig/swig-wrapper.in
+++ b/package/swig/swig-wrapper.in
@@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
     export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
 fi

-exec "${0}.br_real" "$@"
+exec "$(realpath "${0}").br_real" "$@"

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
