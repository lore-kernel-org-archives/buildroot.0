Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF2606A321
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q9X66L5d;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WOKhbZZu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF88607E7;
	Thu, 12 Nov 2026 17:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44TEFNnTargx; Thu, 12 Nov 2026 17:43:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2EF5607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794505421;
	b=Xg54Q5lAuN2hEaF834cqAT3MucQHbEMbUTL55A+8qwd+0+MQCgXoJ5C3pXT20OnaT5NG
	 Lcv3A6T8LGkjFVqI1iIpwsB1A2BU+vxncI8a5/KhIUg0lKriRdKNZJxNEnQypyexI8gDL
	 T1MWkKjyzHut54euQd+lNK4mnfISfHovwfLV7+cN6nG2m/7jIthYgxRO5dKLqrqZjhuJH
	 qUHBsWKEdjVjOTjuCsqsRRjjQcIpwbZLpdWsjQ8z9B6l2MB6fCUU6r94E/HVB2DQN06du
	 Vi2XF3o1776wonGj1QplwMkO/Cykb7/qN+ydaCmelCzQe7MGDnUZAmoiDGuAF28bhwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794505421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2QSrrDGEgPLlD0RoCw0KnNkv7qPALafXQ7H5rtSgo+I=;
	b=cCsNFKJzQ01/r2O5EgP38YdGn61oqEdn8yvm0CdyYAFKWH/pNY22vwEpUygRPrYUMbm0
	 3UJWOHlF/se44shRpkniSmH5gKKSzeRZnQNz/HNEH2wezf++wKpbX7xfucOICr1j2pS8L
	 +BddJlf9+TR2QrEZFApw+596Q2Xt44eqY7VUdJxfUWcxEE12Jtd00FKHkReL9rXdQkYaf
	 nORnU7y+NujQTxZ/6WSVdN0I/+xygiyrZmAOGJZ9ThS/faixG/CxMDangdz200CmXsqFE
	 vl6X+yKDGtANy/z1pm9F0yHXtXfyN9+FyMVAB73le0KsGTZ2j7iBqLXuCAfGYdXNB3A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794505421;
	bh=2QSrrDGEgPLlD0RoCw0KnNkv7qPALafXQ7H5rtSgo+I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q9X66L5dQQVI4Xya9Hr47kIuR8h7XFypxvcH9FtRzLS7zIEHpSsUMQWO5QmHkmRti
	 y1lKwWqFr/71mAk4YXv3XMFVRempIJdYAN8FLDjpbQnTwdP381NawEbEcmiLmTNPZ+
	 UU/trNReEtLqwWrLshYF1I2AopV/I1mtr0HTBaHVZ6l2bmFR9qqDuEWRvKjAZBEDQD
	 28Rc1MEIAjrv1JUXQkrOxIaYV3HywfLfxCOFKpvj2OA46DJUnDao6Am+dcTb4YdYHk
	 mCP8lWdQshCFHgKgv22W1pHk2qCqxqudnRdQ3GrAR1f8Ltk2MUfZjKYy9dvUHCkmPr
	 NbPwmIPFMIjSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2EF5607F7;
	Thu, 12 Nov 2026 17:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DBA62FE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 102BB81488
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2_XR9egaZs5 for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 17:43:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8443681213
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WOKhbZZu
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8443681213
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 17:43:36 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id RYphx6FlbtleFRYphx8X9b; Thu, 12 Nov 2026 18:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794505413; bh=nYQUC3XxaDaJ54bZto25RKPHq84z3UfjvEr8MTvu4kM=;
 h=From:To:Subject:Date:MIME-Version;
 b=WOKhbZZuSSNa+scXV0UylB9nQJYf2F/Sqr0bhTLAoTv0VTqH6vBf9FKoE/km239+T
 2k5pA6ZoYKdmfYGAdLPdbHN4rL6C3Jwi3hSUOeqs8yXrSGZAS5nZqHCpDXgL6UyI/Q
 kisNNB7pmngKBkRFpSPgqfNFNshA8NyV4jT8F3eDvzD7u0GkkdA7GE+qWOLOKPFhaC
 OItKMVGRcWNcYIwJB/LXyHKH16SrAZBz5bTFalETwkazJbPsm5R8AuB1B1mbz1V1NI
 QkkWeA+DuKZwHX4ldEYGC0m+NKf441w7tTqBzW//pxVbGQXE3f8hLBxlraBLqlz3OP
 hNGpm6rNZXC9g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Thu, 12 Nov 2026 18:31:41 +0100
Message-ID: <20261112173141.400268-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAd48zaKeTxGjm94xhw1ehdNfBFL2P9ENw9gJgEXrA8hiiJV2XkZfxnx+IiRokEabWtdykZnwSbVgrdSJoVRrUD3cVGoLVGiaDLQWp169bfP3+QNgBo1
 z090tSPlTl/Gpep2lqYWJMDelbP0OKh6K8OVcQH0Pw67aBwRykPNiAtCKzlr2tBfJjWOyuHBWrkXmBQWS6i21LrlHof2Mcov1gFnhlBP0jzCWlWnH383RgpS
 w2go8jOlQXwDB2y0bTSRpwim2HlioCgXG0MAT0g+1QOMCpLPREplaKYfkQX8gzW8t0f2GJsFnjJEClRA4zq8bsqeOOa/o83U4QBrowlx/owE7w1I5qn+qnx9
 UeD2Ai2A
Subject: [Buildroot] [PATCH v3] package/nfs-utils: fix build failure with
 musl libc
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since nfs-utils 2.7.1, with upstream commit:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=c0bdcb67c5c30951b497fa794bacec282b524331
printerr() is declared with __attribute__((format(printf, 2, 3))), so
its arguments are now checked against the format string. Together with
-Werror=format=2, which nfs-utils always adds to AM_CFLAGS, this turns
printing a pthread_t with '%lx' into a build failure on musl, where
pthread_t is a pointer type. Buildroot picked up this change when
bumping from 2.6.4 to 2.8.1 in commit 37a33d865d ("package/nfs-utils:
bump version to 2.8.1").

Add local patch pending upstream to cast pthread_t to unsigned long
wherever it's printed with '%lx'.

Fixes:
https://autobuild.buildroot.org/results/7c52ec55756d30da14609d57766b85340dc020dd

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ssd-fix-build-failure-with-musl-libc.patch | 226 ++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100644 package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch

diff --git a/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch b/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
new file mode 100644
index 0000000000..9c54473586
--- /dev/null
+++ b/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
@@ -0,0 +1,226 @@
+From bd17dbf6c32d04622e6ef5fbec3dfa023422d49b Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 12 Nov 2026 17:27:45 +0100
+Subject: [PATCH] gssd: fix build failure with musl libc
+
+gssd prints thread IDs with the '%lx' format specifier, which assumes
+pthread_t is an unsigned long. This holds on glibc, but on musl
+pthread_t is an opaque pointer type ('struct __pthread *'), so building
+with -Werror=format fails:
+
+gssd.c:546:78: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'pthread_t' {aka 'struct __pthread *'} [-Werror=format=]
+
+Fix this by explicitly casting pthread_t to unsigned long wherever it
+is printed with '%lx' in gssd.c, gssd_proc.c and krb5_util.c. The cast
+is safe since the value is only used for logging and unsigned long is
+pointer-sized on all Linux ABIs. The output is unchanged on glibc.
+
+Upstream: https://lore.kernel.org/linux-nfs/20261112172732.397411-1-giulio.benetti@benettiengineering.com/T/#u
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ utils/gssd/gssd.c      | 14 +++++++-------
+ utils/gssd/gssd_proc.c | 18 +++++++++---------
+ utils/gssd/krb5_util.c | 10 +++++-----
+ 3 files changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/utils/gssd/gssd.c b/utils/gssd/gssd.c
+index 022f0a89..5203d0a7 100644
+--- a/utils/gssd/gssd.c
++++ b/utils/gssd/gssd.c
+@@ -544,7 +544,7 @@ cleanup_active_thread_list(void)
+ 		default:
+ 			/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
+ 			printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
+-					info->tid, err, strerror(err));
++					(unsigned long)info->tid, err, strerror(err));
+ 			break;
+ 		}
+ 	}
+@@ -554,12 +554,12 @@ cleanup_active_thread_list(void)
+ 			switch (err) {
+ 			case EBUSY:
+ 				printerr(0, "watchdog: thread id 0x%lx still busy on shutdown\n",
+-					 info->tid);
++					 (unsigned long)info->tid);
+ 				/* fall through */
+ 			default:
+ 				/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
+ 				printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
+-						info->tid, err, strerror(err));
++						(unsigned long)info->tid, err, strerror(err));
+ 				/* fall through */
+ 			case 0:
+ 				saveprev = info->list.tqe_prev;
+@@ -611,7 +611,7 @@ scan_active_thread_list(void)
+ 			 */
+ 			if (tret == PTHREAD_CANCELED)
+ 				printerr(2, "watchdog: thread id 0x%lx cancelled successfully\n",
+-						info->tid);
++						(unsigned long)info->tid);
+ 			saveprev = info->list.tqe_prev;
+ 			TAILQ_REMOVE(&active_thread_list, info, list);
+ 			free(info);
+@@ -628,14 +628,14 @@ scan_active_thread_list(void)
+ 			if (now.tv_sec >= info->timeout.tv_sec) {
+ 				if (cancel_timed_out_upcalls && !(info->flags & UPCALL_THREAD_CANCELED)) {
+ 					printerr(0, "watchdog: thread id 0x%lx timed out\n",
+-							info->tid);
++							(unsigned long)info->tid);
+ 					pthread_cancel(info->tid);
+ 					info->flags |= (UPCALL_THREAD_CANCELED|UPCALL_THREAD_WARNED);
+ 					do_error_downcall(info->fd, info->uid, -ETIMEDOUT);
+ 				} else {
+ 					if (!(info->flags & UPCALL_THREAD_WARNED)) {
+ 						printerr(0, "watchdog: thread id 0x%lx running for %lld seconds\n",
+-								info->tid,
++								(unsigned long)info->tid,
+ 								(long long int)(now.tv_sec - info->timeout.tv_sec + upcall_timeout));
+ 						info->flags |= UPCALL_THREAD_WARNED;
+ 					}
+@@ -656,7 +656,7 @@ scan_active_thread_list(void)
+ 		default:
+ 			/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
+ 			printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
+-					info->tid, err, strerror(err));
++					(unsigned long)info->tid, err, strerror(err));
+ 			break;
+ 		}
+ 	}
+diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
+index d59c8a19..6bf5f2b5 100644
+--- a/utils/gssd/gssd_proc.c
++++ b/utils/gssd/gssd_proc.c
+@@ -186,7 +186,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_private_data *pd,
+ 
+ 	if (get_verbosity() > 1)
+ 		printerr(2, "do_downcall(0x%lx): lifetime_rec=%s acceptor=%.*s\n",
+-			tid, sec2time(lifetime_rec), (int)acceptor->length, (char *)acceptor->value);
++			(unsigned long)tid, sec2time(lifetime_rec), (int)acceptor->length, (char *)acceptor->value);
+ 	buf_size = sizeof(uid) + sizeof(timeout) + sizeof(pd->pd_seq_win) +
+ 		sizeof(pd->pd_ctx_hndl.length) + pd->pd_ctx_hndl.length +
+ 		sizeof(context_token->length) + context_token->length +
+@@ -212,7 +212,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_private_data *pd,
+ 	return;
+ out_err:
+ 	free(buf);
+-	printerr(1, "do_downcall(0x%lx): Failed to write downcall!\n", tid);
++	printerr(1, "do_downcall(0x%lx): Failed to write downcall!\n", (unsigned long)tid);
+ 	return;
+ }
+ 
+@@ -225,7 +225,7 @@ do_error_downcall(int k5_fd, uid_t uid, int err)
+ 	int	zero = 0;
+ 	pthread_t tid = pthread_self();
+ 
+-	printerr(2, "do_error_downcall(0x%lx): uid %d err %d\n", tid, uid, err);
++	printerr(2, "do_error_downcall(0x%lx): uid %d err %d\n", (unsigned long)tid, uid, err);
+ 
+ 	if (WRITE_BYTES(&p, end, uid)) goto out_err;
+ 	if (WRITE_BYTES(&p, end, timeout)) goto out_err;
+@@ -388,7 +388,7 @@ create_auth_rpc_client(struct clnt_info *clp,
+ 	/* create an rpc connection to the nfs server */
+ 
+ 	printerr(3, "create_auth_rpc_client(0x%lx): creating %s client for server %s\n", 
+-		tid, clp->protocol, clp->servername);
++		(unsigned long)tid, clp->protocol, clp->servername);
+ 
+ 	protocol = IPPROTO_TCP;
+ 	if ((strcmp(clp->protocol, "udp")) == 0)
+@@ -432,7 +432,7 @@ create_auth_rpc_client(struct clnt_info *clp,
+ 		tgtname = clp->servicename;
+ 
+ 	printerr(3, "create_auth_rpc_client(0x%lx): creating context with server %s\n", 
+-		tid, tgtname);
++		(unsigned long)tid, tgtname);
+ #ifdef HAVE_TIRPC_GSS_SECCREATE
+ 	memset(&req, 0, sizeof(req));
+ 	req.my_cred = sec.cred;
+@@ -583,7 +583,7 @@ krb5_not_machine_creds(struct clnt_info *clp, uid_t uid, char *tgtname,
+ 	pthread_t tid = pthread_self();
+ 
+ 	printerr(2, "krb5_not_machine_creds(0x%lx): uid %d tgtname %s\n", 
+-		tid, uid, tgtname);
++		(unsigned long)tid, uid, tgtname);
+ 
+ 	*chg_err = change_identity(uid);
+ 	if (*chg_err) {
+@@ -632,7 +632,7 @@ krb5_use_machine_creds(struct clnt_info *clp, uid_t uid,
+ 	pthread_t tid = pthread_self();
+ 
+ 	printerr(2, "krb5_use_machine_creds(0x%lx): uid %d tgtname %s\n", 
+-		tid, uid, tgtname);
++		(unsigned long)tid, uid, tgtname);
+ 
+ 	do {
+ 		gssd_refresh_krb5_machine_credential(clp->servername,
+@@ -976,7 +976,7 @@ start_upcall_thread(void (*func)(struct clnt_upcall_info *), struct clnt_upcall_
+ 		return ret;
+ 	}
+ 	printerr(2, "start_upcall_thread(0x%lx): created thread id 0x%lx\n", 
+-		tid, th);
++		(unsigned long)tid, (unsigned long)th);
+ 
+ 	tinfo->tid = th;
+ 	pthread_mutex_lock(&active_thread_list_lock);
+@@ -1041,7 +1041,7 @@ handle_gssd_upcall(struct clnt_info *clp)
+ 	}
+ 	lbuf[lbuflen-1] = 0;
+ 
+-	printerr(2, "\n%s(0x%lx): '%s' (%s)\n", __func__, tid,
++	printerr(2, "\n%s(0x%lx): '%s' (%s)\n", __func__, (unsigned long)tid,
+ 		 lbuf, clp->relpath);
+ 
+ 	for (p = strtok(lbuf, " "); p; p = strtok(NULL, " ")) {
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
+index 7ad67131..0e8f889b 100644
+--- a/utils/gssd/krb5_util.c
++++ b/utils/gssd/krb5_util.c
+@@ -435,7 +435,7 @@ gssd_get_single_krb5_cred(krb5_context context,
+ 	pthread_mutex_lock(&ple_lock);
+ 	if (ple->ccname && ple->endtime > now && !nocache && !force_renew) {
+ 		printerr(3, "%s(0x%lx): Credentials in CC '%s' are good until %s",
+-			 __func__, tid, ple->ccname, ctime((time_t *)&ple->endtime));
++			 __func__, (unsigned long)tid, ple->ccname, ctime((time_t *)&ple->endtime));
+ 		code = 0;
+ 		pthread_mutex_unlock(&ple_lock);
+ 		goto out;
+@@ -495,7 +495,7 @@ gssd_get_single_krb5_cred(krb5_context context,
+ 
+ 	code = 0;
+ 	printerr(2, "%s(0x%lx): principal '%s' ccache:'%s'\n",
+-		__func__, tid, pname, ple->ccname);
++		__func__, (unsigned long)tid, pname, ple->ccname);
+   out:
+ 	if (opts)
+ 		krb5_get_init_creds_opt_free(context, opts);
+@@ -631,7 +631,7 @@ get_full_hostname(const char *inhost, char *outhost, int outhostlen)
+ 	retval = getaddrinfo(inhost, NULL, &hints, &addrs);
+ 	if (retval) {
+ 		printerr(1, "%s(0x%lx): getaddrinfo(%s) failed: %s\n",
+-			 __func__, tid, inhost, gai_strerror(retval));
++			 __func__, (unsigned long)tid, inhost, gai_strerror(retval));
+ 		goto out;
+ 	}
+ 	strncpy(outhost, addrs->ai_canonname, outhostlen);
+@@ -642,7 +642,7 @@ get_full_hostname(const char *inhost, char *outhost, int outhostlen)
+ 
+ 	if (get_verbosity() && strcmp(inhost, outhost))
+ 		printerr(1, "%s(0x%0lx): inhost '%s' different than outhost '%s'\n", 
+-			 __func__, tid, inhost, outhost);
++			 __func__, (unsigned long)tid, inhost, outhost);
+ 
+ 	retval = 0;
+ out:
+@@ -990,7 +990,7 @@ find_keytab_entry(krb5_context context, krb5_keytab kt,
+ 					tried_upper = 1;
+ 				}
+ 			} else {
+-				printerr(2, "find_keytab_entry(0x%lx): Success getting keytab entry for '%s'\n",tid, spn);
++				printerr(2, "find_keytab_entry(0x%lx): Success getting keytab entry for '%s'\n", (unsigned long)tid, spn);
+ 				retval = 0;
+ 				goto out;
+ 			}
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
