Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39A5CD98E4
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5EE811B9;
	Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ki6wvGB5Avie; Wed, 17 Jun 2026 12:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CAB58101D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781700831;
	bh=P59RYNplskvSt3leQvhTjfcAjXDPNyrRJXV7puYeiws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z7S8CWQaBpupBrKq9sl86eHuwE31CNW1fD3mifqw1CCIUJxjYzUjCPirrMq0koe9W
	 daLqxo4sg1ffWPbxvNcrwZAIgcYB1I8glT8nAPIhsVP9XVhiugxSY6OYbTsGkIfXY0
	 7IGfWOELiSNf2sboraxIVGjJh2Y5fqLm774eWCbb/PZDXx0734HPIWC0/q2CvECJbE
	 tuk8qH9GFrZEqy4/KoZeGj+60B779rqiZeeS4ia6EGxU2lchrv0PdLsS8ZElriwep+
	 15s4BJ2flC/iJqimUd8D7RT7huFdC/Phlo1dVk60cHrlh5hcm2T734pJGEYpSIbcli
	 LG8Ukw8KnBFOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CAB58101D;
	Wed, 17 Jun 2026 12:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6109ED8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F2F160F4D
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSrfYlTLmN8m for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9F160E9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E9F160E9D
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 978DD81216; Wed, 17 Jun 2026 12:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:52:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e2cc4e46ffd0d3a6a3ffa14bbe0645e7336933f
X-Git-Newrev: dabaf4ab46909ce9b91f27793c91bbefe8be6618
X-Patchwork-Hint: ignore
Message-Id: <20260617125326.978DD81216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd/S40iwd: log to syslog by
 default
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dabaf4ab46909ce9b91f27793c91bbefe8be6618
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The built-in default of iwd is to log to stderr, which is lost when
sent to the background.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/iwd/S40iwd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 1a2d0e9780..978912c67f 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -3,7 +3,7 @@
 DAEMON="iwd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-IWD_ARGS=""
+IWD_ARGS="--logger syslog"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
