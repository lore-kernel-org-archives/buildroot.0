Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BC606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 14:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JtKPRZ88;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y3dF41cu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28AF86067D;
	Mon, 16 Nov 2026 14:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSCjV2lOmEYe; Mon, 16 Nov 2026 14:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1E3160739
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794839383;
	b=gOx8LgPe2QGyQqCvuKpp/7ml6dwSZAMk9sQEJG33E5M5CTerYGo07yYTSFaQC7aJ0SyP
	 4TF/SKejcczqokYhvVy4eqPlXYmK8HNPieI6ucJaa43JLnAGEDTdbZQc3ErMSgLzc2x23
	 P1WSqFM5nIbgwM5uLY1rotfscghV47ZVHdZqqfsQwl+Ju8eP5SHot/AoFT4/jyN+kOppI
	 wtgCoWRkyQsDd+kZMzhX/LS6jke0aGZK2F5puYRpPY8rTjO0tM0RRBi9ioDRy6MqqgZGY
	 lhmh2g+cxgJyEibpMmrXxLquTA5bJEv478LZWAkkvDL2CzX3M9ztc+LLa9q3pLE3N2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794839383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=awzv04bzOBwPmpt7ft6iJGs/1QHPkaLFQ3HfXbJIdJ8=;
	b=kcdqhCKB7Fm8FJQTXqBI30gfLRV7WpNJHNhpZvpHrPvwYUa/9+/E3WWS4m83y3CuXPok
	 WX4Np+CnV5+HeASz7jxtT2KYYbzqk0eG8J8ZFXzhq8ykYjVIAtz817fGihdQZEw7gnPqy
	 nNzYcjlotj24VbrAZmqKxHLXqWcIyriqkP+Ez8tbh7W/zjznzwqhZ4jSrDmA7HsFsiCA7
	 alhGgrOwnIX80bSYDd4bQEJyqn1YogcqX14oP8O5h+mSYECHs396Ufn7VuRuSbjpjCt58
	 keNDJUdkbBnPaUIXldZhshojqIRkI/Do9qTnNvpqg/i3yO7HoTvCE06ZewFaCSAKeLQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794839383;
	bh=awzv04bzOBwPmpt7ft6iJGs/1QHPkaLFQ3HfXbJIdJ8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JtKPRZ88BP6yFeUZSSk1yUOBcVlsJs90smrKzRdeqV7vHBhaumQJUP67osqt+tMWR
	 gU6m2pza4mjzvFOj/5xkJ9zGNm/yCpvcJbSAV2QNtNVRK6cTjxF0PHI7rNtcOszvqx
	 X17m0vuiM7vZhRzITCEKBslE4nS8xnc8OdLnwUUeE0odbU+T3Tqlx4yUy8SmM1TcTV
	 riUnh3rOZkJVeM2oFM/hv3ERHRd42C18rAv5R5d3KTuxFLqIGiCHf3X7gciLIHhke4
	 +4MYX0PEa2YSh12xsw39kScLFsxrqnho4fQBLQTqyBiiptriV0/kTPo12+LSub1BHx
	 5d0/4+h+0ArwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E3160739;
	Mon, 16 Nov 2026 14:29:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C40DC260
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2F6940274
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5yJIkg4WcSIo for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 14:29:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 331AF4009D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Y3dF41cu
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 331AF4009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 14:29:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb55cda775so15861515e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794839378; x=1795444178; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w7ANZTT4ZADjNGDbA7QtA5vL+IXLJZYC8vpoeFvV0xs=;
 b=Y3dF41cu9XdpM5iVQ8rl0ZBdOXp6muUOGO6+v646OPU+7+zkr3GNVoQeLkjHtz3lwg
 84WzaGkKRAsDoQp40VmwpSVWLFDlKxvR8pHrnj2M73vsdtCYAp1jMilGIYKu524ePzNi
 d9uVz0s4lhw3IsAjcYauBid1kKZ5rptNbj8nsHnzZsEIbCUgNXMW22P7l2P1vUtvao8l
 f5N0taC1QNbwdKY64sZPnHxN99wgnjycxyKpOgi/gyxFkjWZJ/sccUTVpMVlYYDC0/AU
 XPlh5TQGirSssYV2io2XjIsEOyj2PtEvj8UvSphWXSFzIvx6Skk8kJ5KtuI5K2T2FjQm
 fFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794839378; x=1795444178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w7ANZTT4ZADjNGDbA7QtA5vL+IXLJZYC8vpoeFvV0xs=;
 b=TojJJCL0wJQdDz5lCdJLeoBPNfvm+uXzHpVpuz53GKP0UP1Mj1Jo2XTyqQv+pJX4mN
 K/Agb/Y7BbDFhGBPwvpFxDYKvRVWkpdyS1CYaoLaduaoQSRxbLEcntP+aJVB0PlRKlvi
 XAj73BoAZzX36C1azTlX9XkmmalfytywknzlcRBaihiAGsTt4ayltb7EGn5Q/t2pVb5l
 zIBsENhgut3IGfasD3F1KgtHnAppsGZrF3auEyp1/hzgbcidrYAxvxUaogkqV0y2MCpW
 48XyUGpy5H815EWV24HsR5+J/VfAkHtzQ2nPty8MnVR08PpR5QwmTueJauTCf+pGWPB9
 JJeA==
X-Gm-Message-State: APuU4Z+eI676gbswLbgyQxvbgM68Aqvi3QfTGAzTvpQh8WIosenoC0ZE
 CiUuyOmN2C6ZleQfcBX1jLSFZ3L4Nks5oIRTdST83JI2V+P6GjzBmXNKiI0MMw==
X-Gm-Gg: AYBFou1tAKIlFqUrKObnXbBqII/eQKJWR0DBvo93yKeljNeChYs6b9I1F7lkIeQtc10
 y5+AuOlnYhKNn0eldlY0RQzNQkpcBajstgbwj9Om7etLv7ZRI+e5bkZHZ/noomTfoSAtZY2IQcw
 UCOKfRz9zfL+16tD0LFmk5J6jhWhnQiwlnq41RHTB6wxHX8itu0uTQQij8YL+URl3BSHESpyHMS
 Yqwq4M9t1LaPXU0COnVkoKo0ieeG6XiuPts8eUnX94M+qdB1qUS2TCVyz5m5zwr1K9Z00kSsb/Y
 W8qps6tIwvfsh7hflaM9WXx1hPgqEpa/ELZnizHAcH3oR06f9LmZA6H05o0xDDTLj7XPaXH6SFF
 W6jxQin6T4l6DEQ5mKCKawK9f8bNpw7sJuC5dsvZejG639Jcug5ePmd/fvHCZTWJaxKLK6Nrie4
 sWdxed43h6gcsCCd1z6lFCCCPaFbOskDgy9+UruK7hVNADmLQyI5FIMZ8lqnMBxTIxCLSbu4g93
 xsANVfUgJyxD/c9Pq7PYU0m8D0SSvxR8B9HoOdS9kaIj5QRLL3J23lR+n+KlPAVlRRGSlQAENDf
 jK1Am+AVfbOu3l0xnqxiAKquueMIr17XTzTiInMD+lE=
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id
 5b1f17b1804b1-4bb5e8c13e4mr199740425e9.7.1794839377687; 
 Mon, 16 Nov 2026 06:29:37 -0800 (PST)
Received: from WL2200093.evs.tv ([208.127.174.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb52bab8bbsm296178035e9.13.2026.11.16.06.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 06:29:37 -0800 (PST)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Mon, 16 Nov 2026 15:29:34 +0100
Message-ID: <20261116142934.204607-1-fred.lefranc.evs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/openssh: fix
 CVE-2026-73281, CVE-2026-73282 and CVE-2026-73283
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport three upstream security fixes to OpenSSH 9.9p2:

- CVE-2026-73281: allow session-bind@openssh.com requests while
  ssh-agent is locked so forwarded connections are correctly tracked
  as remote, while continuing to reject other locked-agent operations.

- CVE-2026-73282: avoid a use-after-free when adding a remote forward
  through the multiplexing socket reallocates the forwarding list.
  Store a forwarding index rather than a pointer in the confirmation
  callback context.

- CVE-2026-73283: make the authorized_keys restrict option block tunnel
  forwarding, preserving the existing CVE-2026-59999 DisableForwarding
  check.

Keep each fix in a separate package patch, adapt the changes to the
9.9p2 sources and mark the three CVEs as fixed in OPENSSH_IGNORE_CVES.

Upstream:
https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5f
https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0
Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
---
 package/openssh/0022-CVE-2026-73281.patch | 70 ++++++++++++++++++++++
 package/openssh/0023-CVE-2026-73282.patch | 72 +++++++++++++++++++++++
 package/openssh/0024-CVE-2026-73283.patch | 35 +++++++++++
 package/openssh/openssh.mk                |  6 ++
 4 files changed, 183 insertions(+)
 create mode 100644 package/openssh/0022-CVE-2026-73281.patch
 create mode 100644 package/openssh/0023-CVE-2026-73282.patch
 create mode 100644 package/openssh/0024-CVE-2026-73283.patch

diff --git a/package/openssh/0022-CVE-2026-73281.patch b/package/openssh/0022-CVE-2026-73281.patch
new file mode 100644
index 0000000000..91efd11442
--- /dev/null
+++ b/package/openssh/0022-CVE-2026-73281.patch
@@ -0,0 +1,70 @@
+From 6a57081dc35acf3ee298108d4bc3580489608d5f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 7 Aug 2026 05:18:05 +0000
+Subject: [PATCH] upstream: Allow session-bind@openssh.com requests when the
+ agent is locked
+
+Otherwise forwarding sessions established while an agent was locked
+will be treated as local, rather than remote.
+
+Reported by sn0x-sharma
+
+Backport to OpenSSH 9.9p2: omit the OpenBSD revision update and adapt
+to the existing extension dispatcher, which has no query extension or
+replied/generic_fail handling. Keep its failure reply for all extensions
+other than session-bind while locked.
+
+OpenBSD-Commit-ID: 524f210c6f2b3a06e0a2f6d0af5188a9a75fa2c7
+CVE: CVE-2026-73281
+Upstream: https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5f
+Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
+---
+ ssh-agent.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/ssh-agent.c b/ssh-agent.c
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1782,10 +1782,19 @@ process_extension(SocketEntry *e)
+ 		error_fr(r, "parse");
+ 		goto send;
+ 	}
+-	if (strcmp(name, "session-bind@openssh.com") == 0)
++	/*
++	 * This function can be called while the agent is locked to allow
++	 * session binds to be processed for new channels.
++	 * Other operations should be refused when locked.
++	 */
++
++	if (strcmp(name, "session-bind@openssh.com") == 0) {
+ 		success = process_ext_session_bind(e);
+-	else
++	} else if (locked) {
++		debug_f("attempt to use extension \"%s\" while locked", name);
++	} else {
+ 		debug_f("unsupported extension \"%s\"", name);
++	}
+ 	free(name);
+ send:
+ 	send_status(e, success);
+@@ -1835,16 +1844,19 @@ process_message(u_int socknum)
+ 
+ 	/* check whether agent is locked */
+ 	if (locked && type != SSH_AGENTC_UNLOCK) {
+-		sshbuf_reset(e->request);
+ 		switch (type) {
+ 		case SSH2_AGENTC_REQUEST_IDENTITIES:
+ 			/* send empty lists */
+ 			no_identities(e);
+ 			break;
++		case SSH_AGENTC_EXTENSION:
++			process_extension(e);
++			break;
+ 		default:
+ 			/* send a fail message for all other request types */
+ 			send_status(e, 0);
+ 		}
++		sshbuf_reset(e->request);
+ 		return 1;
+ 	}
+ 
diff --git a/package/openssh/0023-CVE-2026-73282.patch b/package/openssh/0023-CVE-2026-73282.patch
new file mode 100644
index 0000000000..00babb6c58
--- /dev/null
+++ b/package/openssh/0023-CVE-2026-73282.patch
@@ -0,0 +1,72 @@
+From 9910d5ef53124ce1157d57bc11e222658aa41299 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 7 Aug 2026 05:03:56 +0000
+Subject: [PATCH] upstream: avoid potential realloc use-after-free in the client
+
+A remote forwarding may be added via the local session multiplexing socket
+while a remote forwarding open request is pending with the server.
+
+Report and fix from Brian Mingus of Cognatory
+
+Backport to OpenSSH 9.9p2: omit the OpenBSD revision update, rebase the
+functional hunks and retain the u_int32_t callback argument type.
+
+OpenBSD-Commit-ID: c7888d566576386d0e96859f9ec7310a1e2d3609
+CVE: CVE-2026-73282
+Upstream: https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
+Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
+---
+ ssh.c | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+--- a/ssh.c
++++ b/ssh.c
+@@ -1840,14 +1840,24 @@ forwarding_success(void)
+ 	}
+ }
+ 
++struct rfwd_confirm_ctx {
++	int fid;
++};
++
+ /* Callback for remote forward global requests */
+ static void
+ ssh_confirm_remote_forward(struct ssh *ssh, int type, u_int32_t seq, void *ctxt)
+ {
+-	struct Forward *rfwd = (struct Forward *)ctxt;
++	struct rfwd_confirm_ctx *rctx = (struct rfwd_confirm_ctx *)ctxt;
++	struct Forward *rfwd;
+ 	u_int port;
+ 	int r;
+ 
++	if (rctx->fid < 0 || rctx->fid >= options.num_remote_forwards)
++		fatal_f("invalid forwarding ID %d", rctx->fid);
++	rfwd = &options.remote_forwards[rctx->fid];
++	freezero(rctx, sizeof(*rctx));
++
+ 	/* XXX verbose() on failure? */
+ 	debug("remote forward %s for: listen %s%s%d, connect %s:%d",
+ 	    type == SSH2_MSG_REQUEST_SUCCESS ? "success" : "failure",
+@@ -2025,6 +2035,8 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
+ 
+ 	/* Initiate remote TCP/IP port forwardings. */
+ 	for (i = 0; i < options.num_remote_forwards; i++) {
++		struct rfwd_confirm_ctx *rctx;
++
+ 		debug("Remote connections from %.200s:%d forwarded to "
+ 		    "local address %.200s:%d",
+ 		    (options.remote_forwards[i].listen_path != NULL) ?
+@@ -2039,9 +2051,10 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
+ 		if ((options.remote_forwards[i].handle =
+ 		    channel_request_remote_forwarding(ssh,
+ 		    &options.remote_forwards[i])) >= 0) {
++			rctx = xcalloc(1, sizeof(*rctx));
++			rctx->fid = i;
+ 			client_register_global_confirm(
+-			    ssh_confirm_remote_forward,
+-			    &options.remote_forwards[i]);
++			    ssh_confirm_remote_forward, rctx);
+ 			forward_confirms_pending++;
+ 		} else if (options.exit_on_forward_failure)
+ 			fatal("Could not request remote forwarding.");
diff --git a/package/openssh/0024-CVE-2026-73283.patch b/package/openssh/0024-CVE-2026-73283.patch
new file mode 100644
index 0000000000..9938435547
--- /dev/null
+++ b/package/openssh/0024-CVE-2026-73283.patch
@@ -0,0 +1,35 @@
+From d322f2ccf7da095ce94d1d99cb563246f61487b0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 14 Jul 2026 01:05:05 +0000
+Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
+ correctly to tunnel forwarding
+
+Tunnel forwarding is administratively disabled by default.
+
+Reported by Erichen, Institute of Computing Technology,
+Chinese Academy of Sciences
+
+Backport to OpenSSH 9.9p2: omit the OpenBSD revision update and rebase
+on 0015-CVE-2026-59999.patch, preserving its DisableForwarding check.
+
+OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
+CVE: CVE-2026-73283
+Upstream: https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0
+Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
+---
+ serverloop.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -498,7 +498,8 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
++	    auth_opts->restricted) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 39b67f9d98..d887c36581 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -53,6 +53,12 @@ OPENSSH_IGNORE_CVES += CVE-2026-106583
 
 # 0021-avoid-password-authn-bypass.patch
 OPENSSH_IGNORE_CVES += CVE-2026-123158
+# 0022-CVE-2026-73281.patch
+OPENSSH_IGNORE_CVES += CVE-2026-73281
+# 0023-CVE-2026-73282.patch
+OPENSSH_IGNORE_CVES += CVE-2026-73282
+# 0024-CVE-2026-73283.patch
+OPENSSH_IGNORE_CVES += CVE-2026-73283
 
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
