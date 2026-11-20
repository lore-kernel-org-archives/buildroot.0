Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB66606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YeUdkvIm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C0C040E0A;
	Fri, 20 Nov 2026 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu6m3reQk1Q2; Fri, 20 Nov 2026 10:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D51FF40E0E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168885;
	b=rT2YVOJmzfsI5Y98XGRcfsbtc6y1SUVIaqzhuKEW+fGUOv9TBrkgvad++atTMesfRAVp
	 Uzs+f766RxeaN4tdyS5eJcGxu3H8yPO18i2yI7Uon4tpYoIPmGaGz0Czh6YMXKB+u1twR
	 buBuWkcClC44cimYvdRdlwnl+YuI4VOk51okSLb28yTSp3KYTa7SEYr9W4XX2i3KGooDX
	 B3rGzkhQIzIp+6hkfMDicBGThDdN3TovYzQprI/WhpN5FTH8/OwEht/7E8MP1qycze6IY
	 h5fZYDWsz/MIO5Mzc/F3wFf80SLO5akEj32nRAvN/Kodmw7tXT0okB3sB89DeIFHhUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cNNQrp8UmmCtGDFZCmFjLinv13oB8rh1uoZzlUmWIdc=;
	b=s+gAwwHmooKenfJdWhowqXtjmnlyM1NWl6XV5MlkQgDmP6uLwVyWSyS29HMNOHjszzOl
	 XIxSO1teONloAk4xF2Ffksd/U0VIMz6ot5K/w9rqh9MHfZLz/vNoGEcAZKswOkbByrxds
	 rFdMDX5qtYKrEMuCPaUvSnsFz6q/cpJ6E2/+p+oYU2YWHYAMij9Pkqfj0ss5iBLZTa2TT
	 3w2gpvtIlszCJjKxR0N0MWg1SLgOdlWxohNDyQmgwZkjoLcYxR7dd9B6cFSEuV8P0DQva
	 Vk8NX58ngk18g+8TKJ0O7xGoC+QI2oqAAv6rJD6G3piSoJt7iTMLcUFSPnuochNhERA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168884;
	bh=cNNQrp8UmmCtGDFZCmFjLinv13oB8rh1uoZzlUmWIdc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YeUdkvImZGpWc44mlBTJa0RSy/m2qL5nYgkVf9WPNC7vkVUL/ufLlPn82uQL98HXq
	 9ZbcA+BxUAR9foWuK/24z16Mrnya2JGN0KLEDYnfNX7Ap8ECgbv/eL+ylskwXws0YH
	 uSpF17y5ehxpwggcF6yXNT39pdPpEF57Rua55zY143KrYfjmShYZzo9ZVmJX+ukBb8
	 s2Zkni2QAey9W9pqdGtXrcDU5ZUnJItyZPCg6ZS0mNayYJUgk8rDYpdGr7Ow+nhw0Z
	 R63M4meX24SQky4skZxPvjWfQdwrQuEB3CAVX5Aeb2JHh77OZqxoT5LciA64EG8MJ5
	 oVcf7HUXZQxDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51FF40E0E;
	Fri, 20 Nov 2026 10:01:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4D4E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A6260E3E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmOnn_EC1PUp for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3A61C606A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A61C606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so556978f8f.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168880; x=1795773680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=idF7NYnq+HSaE3uehs46/7LAphJsupuIimPWgbgTixQ=;
 b=dXNi/3qGt+9NgAuPvXpXsVehCBSYrVY594pq/e//L0giFZF7GJnV43BXVVdQQwHLmE
 zaDk8lJJ4kzK6WOS3wg2ObIs1vz798I8sgGKaA5k/RHUdpq0MKfkxQLnyqcuS7QWPzb5
 /FhjC+erNjORbcBW1ynzJhOBQGjQDTRe/3WGmR1GvNY8Xn7y9m3LZYqgti9TYOmuzZmx
 wMUQUal/ycF7zciT97tOJ6hoEvS/TYRgqheabH7rBj/HBXR5VniQZEOl8ehtljDD03ZY
 Uxh6F84X8HU3P5mH35N4aSlYSxSWoIWymkGaZ7JseHhKO9iJ0OJIF8YOAKDflZQaHLRZ
 JQvA==
X-Gm-Message-State: APuU4Z/kzb5HGOrrmQ7b+AgpdDE6OT+r32XPxHJ0dO3Psrr4pXlJgqC4
 X2xEgIHqBIXZKt60pvqpsO61NvSTav0XZj+2ViiCT0fQY8j0xfsHxcOcBVjYHL+XJZLBk7cXqUb
 RUvs3D9T59w==
X-Gm-Gg: AZFdTZc87IlE5+KVZ4HJx/4H6GLlqA0kUZKby/jJUJ3BcRX1MMt//mussxILpEr/iId
 gE+Lv3R5K7uc1jtESDC6/IIpfdzR4cHI7hrdYhZKOlWwJAE1N9sfBcDbsMWXNXtxIk8zooZVTzA
 diUcvQHE9NU2zBKlUGXdh4ZpSLnrgoDnC7ZxE3haPNgqsd45Fh29SD4uatC3RlYAPhkRoY+iz0a
 I5KDLC5yHVUlJ60p683ybAshGaYUHdR/MEyaVJPLqK6rYbrAOSaLzQO1fF7EkCmY075DnUapDN0
 Teuorl2R4zhi4rB+XusVaIKbz+FvLXD7BG3aDBUC4Rd0UUshKY2Hip6YvJSl3NytqK0QUwBOP1Z
 iG4NYW34kIV/L3c0lNIrRad439P6nNmpCRDZovpdbGFIPi4oadTnynEg1p4GioQZaldhmBk+wzf
 n4FYD9yp5X5hzkyNC3r97XusbZDc28IqBuJxuZ1hPlyLNXOqNf29vqyT3RYkX7DN3/ZWvMONx/U
 Q2U6joZDLGv70uEP6n9oYsUMe8m5+s1Q/s3QsMBqWWIPtJB9FzzJjQ1uzImHGojhPiH1MVYxqK6
 ExQMNGzhHVRF5i23RXo0tT+prUVBfdxJ7fW3rwK5L8aB0A==
X-Received: by 2002:a05:6000:4617:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-4abab5ea335mr4869294f8f.1.1795168879827; 
 Fri, 20 Nov 2026 02:01:19 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989e3sm4836538f8f.52.2026.11.20.02.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:19 -0800 (PST)
To: buildroot@buildroot.org,
	Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:16 +0100
Message-ID: <20261120100118.542895-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116142934.204607-1-fred.lefranc.evs@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/openssh: fix
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Backport three upstream security fixes to OpenSSH 9.9p2:
> 
> - CVE-2026-73281: allow session-bind@openssh.com requests while
>   ssh-agent is locked so forwarded connections are correctly tracked
>   as remote, while continuing to reject other locked-agent operations.
> 
> - CVE-2026-73282: avoid a use-after-free when adding a remote forward
>   through the multiplexing socket reallocates the forwarding list.
>   Store a forwarding index rather than a pointer in the confirmation
>   callback context.
> 
> - CVE-2026-73283: make the authorized_keys restrict option block tunnel
>   forwarding, preserving the existing CVE-2026-59999 DisableForwarding
>   check.
> 
> Keep each fix in a separate package patch, adapt the changes to the
> 9.9p2 sources and mark the three CVEs as fixed in OPENSSH_IGNORE_CVES.
> 
> Upstream:
> https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5f
> https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
> https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0
> Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/openssh/0022-CVE-2026-73281.patch | 70 ++++++++++++++++++++++
>  package/openssh/0023-CVE-2026-73282.patch | 72 +++++++++++++++++++++++
>  package/openssh/0024-CVE-2026-73283.patch | 35 +++++++++++
>  package/openssh/openssh.mk                |  6 ++
>  4 files changed, 183 insertions(+)
>  create mode 100644 package/openssh/0022-CVE-2026-73281.patch
>  create mode 100644 package/openssh/0023-CVE-2026-73282.patch
>  create mode 100644 package/openssh/0024-CVE-2026-73283.patch
> 
> diff --git a/package/openssh/0022-CVE-2026-73281.patch b/package/openssh/0022-CVE-2026-73281.patch
> new file mode 100644
> index 0000000000..91efd11442
> --- /dev/null
> +++ b/package/openssh/0022-CVE-2026-73281.patch
> @@ -0,0 +1,70 @@
> +From 6a57081dc35acf3ee298108d4bc3580489608d5f Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 7 Aug 2026 05:18:05 +0000
> +Subject: [PATCH] upstream: Allow session-bind@openssh.com requests when the
> + agent is locked
> +
> +Otherwise forwarding sessions established while an agent was locked
> +will be treated as local, rather than remote.
> +
> +Reported by sn0x-sharma
> +
> +Backport to OpenSSH 9.9p2: omit the OpenBSD revision update and adapt
> +to the existing extension dispatcher, which has no query extension or
> +replied/generic_fail handling. Keep its failure reply for all extensions
> +other than session-bind while locked.
> +
> +OpenBSD-Commit-ID: 524f210c6f2b3a06e0a2f6d0af5188a9a75fa2c7
> +CVE: CVE-2026-73281
> +Upstream: https://github.com/openssh/openssh-portable/commit/6a57081dc35acf3ee298108d4bc3580489608d5f
> +Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
> +---
> + ssh-agent.c | 18 +++++++++++++++---
> + 1 file changed, 15 insertions(+), 3 deletions(-)
> +
> +diff --git a/ssh-agent.c b/ssh-agent.c
> +--- a/ssh-agent.c
> ++++ b/ssh-agent.c
> +@@ -1782,10 +1782,19 @@ process_extension(SocketEntry *e)
> + 		error_fr(r, "parse");
> + 		goto send;
> + 	}
> +-	if (strcmp(name, "session-bind@openssh.com") == 0)
> ++	/*
> ++	 * This function can be called while the agent is locked to allow
> ++	 * session binds to be processed for new channels.
> ++	 * Other operations should be refused when locked.
> ++	 */
> ++
> ++	if (strcmp(name, "session-bind@openssh.com") == 0) {
> + 		success = process_ext_session_bind(e);
> +-	else
> ++	} else if (locked) {
> ++		debug_f("attempt to use extension \"%s\" while locked", name);
> ++	} else {
> + 		debug_f("unsupported extension \"%s\"", name);
> ++	}
> + 	free(name);
> + send:
> + 	send_status(e, success);
> +@@ -1835,16 +1844,19 @@ process_message(u_int socknum)
> + 
> + 	/* check whether agent is locked */
> + 	if (locked && type != SSH_AGENTC_UNLOCK) {
> +-		sshbuf_reset(e->request);
> + 		switch (type) {
> + 		case SSH2_AGENTC_REQUEST_IDENTITIES:
> + 			/* send empty lists */
> + 			no_identities(e);
> + 			break;
> ++		case SSH_AGENTC_EXTENSION:
> ++			process_extension(e);
> ++			break;
> + 		default:
> + 			/* send a fail message for all other request types */
> + 			send_status(e, 0);
> + 		}
> ++		sshbuf_reset(e->request);
> + 		return 1;
> + 	}
> + 
> diff --git a/package/openssh/0023-CVE-2026-73282.patch b/package/openssh/0023-CVE-2026-73282.patch
> new file mode 100644
> index 0000000000..00babb6c58
> --- /dev/null
> +++ b/package/openssh/0023-CVE-2026-73282.patch
> @@ -0,0 +1,72 @@
> +From 9910d5ef53124ce1157d57bc11e222658aa41299 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 7 Aug 2026 05:03:56 +0000
> +Subject: [PATCH] upstream: avoid potential realloc use-after-free in the client
> +
> +A remote forwarding may be added via the local session multiplexing socket
> +while a remote forwarding open request is pending with the server.
> +
> +Report and fix from Brian Mingus of Cognatory
> +
> +Backport to OpenSSH 9.9p2: omit the OpenBSD revision update, rebase the
> +functional hunks and retain the u_int32_t callback argument type.
> +
> +OpenBSD-Commit-ID: c7888d566576386d0e96859f9ec7310a1e2d3609
> +CVE: CVE-2026-73282
> +Upstream: https://github.com/openssh/openssh-portable/commit/9910d5ef53124ce1157d57bc11e222658aa41299
> +Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
> +---
> + ssh.c | 19 ++++++++++++++++---
> + 1 file changed, 16 insertions(+), 3 deletions(-)
> +
> +diff --git a/ssh.c b/ssh.c
> +--- a/ssh.c
> ++++ b/ssh.c
> +@@ -1840,14 +1840,24 @@ forwarding_success(void)
> + 	}
> + }
> + 
> ++struct rfwd_confirm_ctx {
> ++	int fid;
> ++};
> ++
> + /* Callback for remote forward global requests */
> + static void
> + ssh_confirm_remote_forward(struct ssh *ssh, int type, u_int32_t seq, void *ctxt)
> + {
> +-	struct Forward *rfwd = (struct Forward *)ctxt;
> ++	struct rfwd_confirm_ctx *rctx = (struct rfwd_confirm_ctx *)ctxt;
> ++	struct Forward *rfwd;
> + 	u_int port;
> + 	int r;
> + 
> ++	if (rctx->fid < 0 || rctx->fid >= options.num_remote_forwards)
> ++		fatal_f("invalid forwarding ID %d", rctx->fid);
> ++	rfwd = &options.remote_forwards[rctx->fid];
> ++	freezero(rctx, sizeof(*rctx));
> ++
> + 	/* XXX verbose() on failure? */
> + 	debug("remote forward %s for: listen %s%s%d, connect %s:%d",
> + 	    type == SSH2_MSG_REQUEST_SUCCESS ? "success" : "failure",
> +@@ -2025,6 +2035,8 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
> + 
> + 	/* Initiate remote TCP/IP port forwardings. */
> + 	for (i = 0; i < options.num_remote_forwards; i++) {
> ++		struct rfwd_confirm_ctx *rctx;
> ++
> + 		debug("Remote connections from %.200s:%d forwarded to "
> + 		    "local address %.200s:%d",
> + 		    (options.remote_forwards[i].listen_path != NULL) ?
> +@@ -2039,9 +2051,10 @@ ssh_init_forwarding(struct ssh *ssh, char **ifname)
> + 		if ((options.remote_forwards[i].handle =
> + 		    channel_request_remote_forwarding(ssh,
> + 		    &options.remote_forwards[i])) >= 0) {
> ++			rctx = xcalloc(1, sizeof(*rctx));
> ++			rctx->fid = i;
> + 			client_register_global_confirm(
> +-			    ssh_confirm_remote_forward,
> +-			    &options.remote_forwards[i]);
> ++			    ssh_confirm_remote_forward, rctx);
> + 			forward_confirms_pending++;
> + 		} else if (options.exit_on_forward_failure)
> + 			fatal("Could not request remote forwarding.");
> diff --git a/package/openssh/0024-CVE-2026-73283.patch b/package/openssh/0024-CVE-2026-73283.patch
> new file mode 100644
> index 0000000000..9938435547
> --- /dev/null
> +++ b/package/openssh/0024-CVE-2026-73283.patch
> @@ -0,0 +1,35 @@
> +From d322f2ccf7da095ce94d1d99cb563246f61487b0 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Tue, 14 Jul 2026 01:05:05 +0000
> +Subject: [PATCH] upstream: make authorized_keys "restrict" keyword apply
> + correctly to tunnel forwarding
> +
> +Tunnel forwarding is administratively disabled by default.
> +
> +Reported by Erichen, Institute of Computing Technology,
> +Chinese Academy of Sciences
> +
> +Backport to OpenSSH 9.9p2: omit the OpenBSD revision update and rebase
> +on 0015-CVE-2026-59999.patch, preserving its DisableForwarding check.
> +
> +OpenBSD-Commit-ID: 5b3cc987a64749c94b20e12755db32a83f8f01e6
> +CVE: CVE-2026-73283
> +Upstream: https://github.com/openssh/openssh-portable/commit/d322f2ccf7da095ce94d1d99cb563246f61487b0
> +Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
> +---
> + serverloop.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/serverloop.c b/serverloop.c
> +--- a/serverloop.c
> ++++ b/serverloop.c
> +@@ -498,7 +498,8 @@ server_request_tun(struct ssh *ssh)
> + 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
> + 		return NULL;
> + 	}
> +-	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
> ++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding ||
> ++	    auth_opts->restricted) {
> + 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
> + 		    "forwarding");
> + 		return NULL;
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 39b67f9d98..d887c36581 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -53,6 +53,12 @@ OPENSSH_IGNORE_CVES += CVE-2026-106583
>  
>  # 0021-avoid-password-authn-bypass.patch
>  OPENSSH_IGNORE_CVES += CVE-2026-123158
> +# 0022-CVE-2026-73281.patch
> +OPENSSH_IGNORE_CVES += CVE-2026-73281
> +# 0023-CVE-2026-73282.patch
> +OPENSSH_IGNORE_CVES += CVE-2026-73282
> +# 0024-CVE-2026-73283.patch
> +OPENSSH_IGNORE_CVES += CVE-2026-73283
>  
>  OPENSSH_CONF_ENV = \
>  	LD="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
