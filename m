Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF09606A32A
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j+lZg4Kt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=kJCVvt7a
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F410407EC;
	Wed, 18 Nov 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r63wqBbHSemI; Wed, 18 Nov 2026 21:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5371E4058A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795037370;
	b=UzUr6+/g/Ri0wp1PaWYzdrOrdSjhBr1+1Q1mKWGC89+w/0z2QRXBg6tmvSiflhWjvVrM
	 BOWjL4WHLGMfY+VpoZHDKhmgPJ8RR/tLKLPHuphgO1kVA0LtCSaBFMK+31GRfx6B+2E0f
	 hbHAvv6WaBwqJV3h6LWFnA0/ABkJw4Lj/+bcmW+ZBfkr3RxSyCpEkU4ahGgL+8v///buB
	 F+kW+9q2qKbTlkF6vgRw8GSIgecu+l6SmHLPaTT5HAIP6Xl46K5lb4MgiW/uHC+G5vOpt
	 /bQewSsiTT0lUTdrjPX4nr6qHdOkCzzizrSL3Hrw8pFuNydpISIv9C7hK5N+MDxDqCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795037370;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=D4OXanPbgPLqFh/5s6m7s6Gf7cY1uJJst5kjpUC1nsY=;
	b=P8xQ3o556Cm2lSdjNixJiNyhY/h5K2O13aXYrHVD1uMBjyYoUmL3mtOyZ/WoOYGiXpwU
	 dzNKRyGVdy9ImUUtHS9sPodTWPhCc2uqduxonn6EPVkQWbDu7ESDh+M7Fva7QBEMm/H6R
	 cie/V0O9UTYkKxgxRdDX4qCn8ykGYYQhvLHspNjqVpAp5u5azzzshIhpxEpEPUiC1yHlx
	 CGrTu8Q/rduXObhcrb73WLN0HSmG4l1VHSL6zq8KnXENqlo3aMxlPSdSm0TzetWZmF7KX
	 01B7NCRcdP9ne/kmKEyzx3l0nC38cduWtS65nYZvxcf1efPhg1hwVGvrE4vB6BSkZ1g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795037370;
	bh=D4OXanPbgPLqFh/5s6m7s6Gf7cY1uJJst5kjpUC1nsY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j+lZg4KtEQNWd0YvG2G54JZgnuHG/hi/pfVEb4349TSpZJ8t9Krthm2y8gyDo5S1j
	 7YeO9abf0dnUjuYiyg5IQ0zEdcfatgqNqXxx/sebZnVkHvm2F7XxaRkG7Ex1VuL4AD
	 +4cZAkgVJ0OZ/HTKlwq9W5EB+hxyJ5e61LKWJtSen6VvAFElQI6mFN+9tJl0yEIos7
	 /fFJTldKqUQhmkQMTfecRLKrGldo+PGSHG93gs22K/ykix1YucGvaRBP8TDgs8RAjU
	 rulIuQs9yecuLiwzxBgC3zFu0icAaIEmXroZgZa6K3YhVh93dFsuPZUnDaMC58wT4h
	 Nj1C18tdNGRcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5371E4058A;
	Wed, 18 Nov 2026 21:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A16FA9F8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8868A400C8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lu7eKgqU9N56 for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E26940086
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.117
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kJCVvt7a
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E26940086
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:29:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id TnDUx7wN96VShTnDUxOV9L; Wed, 18 Nov 2026 22:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795037361; bh=M1UiUvB3icd/dJ4qWeed6pudvskuhEpHdnxvtBMvydA=;
 h=From:To:Subject:Date:MIME-Version;
 b=kJCVvt7au38xByzQEhAfPJKa3s93nFLYzqfhobVB7DUbqKM5u5GEX1jjRDfjw4h+K
 2sdod7S3HAacKcr4Wz5AkJvso64tvtFxve95kdft60QuhZTraXCfq34EsqTop4lvBT
 fK4YeIXOipLGgnZIDF9YZcs7ei6vxwKdYbz0TEbbCgPOEjcLjc/rYDt4XlTRRyb0qk
 vYPoT54RD9vKWZMRKLTxe+YzMZp8jneghauFWVi74lIbBjYejgTITTcrYLqmtk4yhL
 238flIYZLOveDC7fScg7EmEGET3oD4vUMLXi/Z4hthXxBeyfUsjausiORm8Q7wacz/
 P6Z8nt2lC180g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 18 Nov 2026 22:29:19 +0100
Message-ID: <20261118212919.956823-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfENk9oJ+W5FljuhLzkx4DPjWj9pgtz/PCL+Oxv1lX/7DzxzDuxu4a8KXoPd3dhJ5IPLypa0eEtdR5hLe0khT4LbWGwJcAbDoymaYu/w7Yw9r0GAfsrHn
 FC1qvutnSJacy8As4cIRWiBKddBfABq6wR/PI4NFZVD7kKrBfCMtb/x9PeY0CiePR7dIGjk0+zenHerD2Bw/dzhUum2DwnRdfa1TF+LFO/e5ShSP2uIRks/j
 pvVvDhN4shXbqOqZ/daFjCBQa0muvYxgkPZOT8GZ3B5wnySjV2Qx9wc/b+eHZf6riIhuxenSnXQRmfcnUsNODQA/x9G4XKGDiHLXzZLegmuSU1pTNV7Qj2sH
 NEQJTGo4
Subject: [Buildroot] [PATCH] package/nfs-utils: bump to version 3.2.1
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop local patch 0001-gssd-fix-build-failure-with-musl-libc.patch since
it's been merged upstream.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ssd-fix-build-failure-with-musl-libc.patch | 226 ------------------
 package/nfs-utils/nfs-utils.hash              |   4 +-
 package/nfs-utils/nfs-utils.mk                |   2 +-
 3 files changed, 3 insertions(+), 229 deletions(-)
 delete mode 100644 package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch

diff --git a/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch b/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
deleted file mode 100644
index 9c54473586..0000000000
--- a/package/nfs-utils/0001-gssd-fix-build-failure-with-musl-libc.patch
+++ /dev/null
@@ -1,226 +0,0 @@
-From bd17dbf6c32d04622e6ef5fbec3dfa023422d49b Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 12 Nov 2026 17:27:45 +0100
-Subject: [PATCH] gssd: fix build failure with musl libc
-
-gssd prints thread IDs with the '%lx' format specifier, which assumes
-pthread_t is an unsigned long. This holds on glibc, but on musl
-pthread_t is an opaque pointer type ('struct __pthread *'), so building
-with -Werror=format fails:
-
-gssd.c:546:78: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'pthread_t' {aka 'struct __pthread *'} [-Werror=format=]
-
-Fix this by explicitly casting pthread_t to unsigned long wherever it
-is printed with '%lx' in gssd.c, gssd_proc.c and krb5_util.c. The cast
-is safe since the value is only used for logging and unsigned long is
-pointer-sized on all Linux ABIs. The output is unchanged on glibc.
-
-Upstream: https://lore.kernel.org/linux-nfs/20261112172732.397411-1-giulio.benetti@benettiengineering.com/T/#u
-Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- utils/gssd/gssd.c      | 14 +++++++-------
- utils/gssd/gssd_proc.c | 18 +++++++++---------
- utils/gssd/krb5_util.c | 10 +++++-----
- 3 files changed, 21 insertions(+), 21 deletions(-)
-
-diff --git a/utils/gssd/gssd.c b/utils/gssd/gssd.c
-index 022f0a89..5203d0a7 100644
---- a/utils/gssd/gssd.c
-+++ b/utils/gssd/gssd.c
-@@ -544,7 +544,7 @@ cleanup_active_thread_list(void)
- 		default:
- 			/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
- 			printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
--					info->tid, err, strerror(err));
-+					(unsigned long)info->tid, err, strerror(err));
- 			break;
- 		}
- 	}
-@@ -554,12 +554,12 @@ cleanup_active_thread_list(void)
- 			switch (err) {
- 			case EBUSY:
- 				printerr(0, "watchdog: thread id 0x%lx still busy on shutdown\n",
--					 info->tid);
-+					 (unsigned long)info->tid);
- 				/* fall through */
- 			default:
- 				/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
- 				printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
--						info->tid, err, strerror(err));
-+						(unsigned long)info->tid, err, strerror(err));
- 				/* fall through */
- 			case 0:
- 				saveprev = info->list.tqe_prev;
-@@ -611,7 +611,7 @@ scan_active_thread_list(void)
- 			 */
- 			if (tret == PTHREAD_CANCELED)
- 				printerr(2, "watchdog: thread id 0x%lx cancelled successfully\n",
--						info->tid);
-+						(unsigned long)info->tid);
- 			saveprev = info->list.tqe_prev;
- 			TAILQ_REMOVE(&active_thread_list, info, list);
- 			free(info);
-@@ -628,14 +628,14 @@ scan_active_thread_list(void)
- 			if (now.tv_sec >= info->timeout.tv_sec) {
- 				if (cancel_timed_out_upcalls && !(info->flags & UPCALL_THREAD_CANCELED)) {
- 					printerr(0, "watchdog: thread id 0x%lx timed out\n",
--							info->tid);
-+							(unsigned long)info->tid);
- 					pthread_cancel(info->tid);
- 					info->flags |= (UPCALL_THREAD_CANCELED|UPCALL_THREAD_WARNED);
- 					do_error_downcall(info->fd, info->uid, -ETIMEDOUT);
- 				} else {
- 					if (!(info->flags & UPCALL_THREAD_WARNED)) {
- 						printerr(0, "watchdog: thread id 0x%lx running for %lld seconds\n",
--								info->tid,
-+								(unsigned long)info->tid,
- 								(long long int)(now.tv_sec - info->timeout.tv_sec + upcall_timeout));
- 						info->flags |= UPCALL_THREAD_WARNED;
- 					}
-@@ -656,7 +656,7 @@ scan_active_thread_list(void)
- 		default:
- 			/* EDEADLK, EINVAL, and ESRCH... none of which should happen! */
- 			printerr(0, "watchdog: attempt to join thread id 0x%lx returned %d (%s)!\n",
--					info->tid, err, strerror(err));
-+					(unsigned long)info->tid, err, strerror(err));
- 			break;
- 		}
- 	}
-diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
-index d59c8a19..6bf5f2b5 100644
---- a/utils/gssd/gssd_proc.c
-+++ b/utils/gssd/gssd_proc.c
-@@ -186,7 +186,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_private_data *pd,
- 
- 	if (get_verbosity() > 1)
- 		printerr(2, "do_downcall(0x%lx): lifetime_rec=%s acceptor=%.*s\n",
--			tid, sec2time(lifetime_rec), (int)acceptor->length, (char *)acceptor->value);
-+			(unsigned long)tid, sec2time(lifetime_rec), (int)acceptor->length, (char *)acceptor->value);
- 	buf_size = sizeof(uid) + sizeof(timeout) + sizeof(pd->pd_seq_win) +
- 		sizeof(pd->pd_ctx_hndl.length) + pd->pd_ctx_hndl.length +
- 		sizeof(context_token->length) + context_token->length +
-@@ -212,7 +212,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_private_data *pd,
- 	return;
- out_err:
- 	free(buf);
--	printerr(1, "do_downcall(0x%lx): Failed to write downcall!\n", tid);
-+	printerr(1, "do_downcall(0x%lx): Failed to write downcall!\n", (unsigned long)tid);
- 	return;
- }
- 
-@@ -225,7 +225,7 @@ do_error_downcall(int k5_fd, uid_t uid, int err)
- 	int	zero = 0;
- 	pthread_t tid = pthread_self();
- 
--	printerr(2, "do_error_downcall(0x%lx): uid %d err %d\n", tid, uid, err);
-+	printerr(2, "do_error_downcall(0x%lx): uid %d err %d\n", (unsigned long)tid, uid, err);
- 
- 	if (WRITE_BYTES(&p, end, uid)) goto out_err;
- 	if (WRITE_BYTES(&p, end, timeout)) goto out_err;
-@@ -388,7 +388,7 @@ create_auth_rpc_client(struct clnt_info *clp,
- 	/* create an rpc connection to the nfs server */
- 
- 	printerr(3, "create_auth_rpc_client(0x%lx): creating %s client for server %s\n", 
--		tid, clp->protocol, clp->servername);
-+		(unsigned long)tid, clp->protocol, clp->servername);
- 
- 	protocol = IPPROTO_TCP;
- 	if ((strcmp(clp->protocol, "udp")) == 0)
-@@ -432,7 +432,7 @@ create_auth_rpc_client(struct clnt_info *clp,
- 		tgtname = clp->servicename;
- 
- 	printerr(3, "create_auth_rpc_client(0x%lx): creating context with server %s\n", 
--		tid, tgtname);
-+		(unsigned long)tid, tgtname);
- #ifdef HAVE_TIRPC_GSS_SECCREATE
- 	memset(&req, 0, sizeof(req));
- 	req.my_cred = sec.cred;
-@@ -583,7 +583,7 @@ krb5_not_machine_creds(struct clnt_info *clp, uid_t uid, char *tgtname,
- 	pthread_t tid = pthread_self();
- 
- 	printerr(2, "krb5_not_machine_creds(0x%lx): uid %d tgtname %s\n", 
--		tid, uid, tgtname);
-+		(unsigned long)tid, uid, tgtname);
- 
- 	*chg_err = change_identity(uid);
- 	if (*chg_err) {
-@@ -632,7 +632,7 @@ krb5_use_machine_creds(struct clnt_info *clp, uid_t uid,
- 	pthread_t tid = pthread_self();
- 
- 	printerr(2, "krb5_use_machine_creds(0x%lx): uid %d tgtname %s\n", 
--		tid, uid, tgtname);
-+		(unsigned long)tid, uid, tgtname);
- 
- 	do {
- 		gssd_refresh_krb5_machine_credential(clp->servername,
-@@ -976,7 +976,7 @@ start_upcall_thread(void (*func)(struct clnt_upcall_info *), struct clnt_upcall_
- 		return ret;
- 	}
- 	printerr(2, "start_upcall_thread(0x%lx): created thread id 0x%lx\n", 
--		tid, th);
-+		(unsigned long)tid, (unsigned long)th);
- 
- 	tinfo->tid = th;
- 	pthread_mutex_lock(&active_thread_list_lock);
-@@ -1041,7 +1041,7 @@ handle_gssd_upcall(struct clnt_info *clp)
- 	}
- 	lbuf[lbuflen-1] = 0;
- 
--	printerr(2, "\n%s(0x%lx): '%s' (%s)\n", __func__, tid,
-+	printerr(2, "\n%s(0x%lx): '%s' (%s)\n", __func__, (unsigned long)tid,
- 		 lbuf, clp->relpath);
- 
- 	for (p = strtok(lbuf, " "); p; p = strtok(NULL, " ")) {
-diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
-index 7ad67131..0e8f889b 100644
---- a/utils/gssd/krb5_util.c
-+++ b/utils/gssd/krb5_util.c
-@@ -435,7 +435,7 @@ gssd_get_single_krb5_cred(krb5_context context,
- 	pthread_mutex_lock(&ple_lock);
- 	if (ple->ccname && ple->endtime > now && !nocache && !force_renew) {
- 		printerr(3, "%s(0x%lx): Credentials in CC '%s' are good until %s",
--			 __func__, tid, ple->ccname, ctime((time_t *)&ple->endtime));
-+			 __func__, (unsigned long)tid, ple->ccname, ctime((time_t *)&ple->endtime));
- 		code = 0;
- 		pthread_mutex_unlock(&ple_lock);
- 		goto out;
-@@ -495,7 +495,7 @@ gssd_get_single_krb5_cred(krb5_context context,
- 
- 	code = 0;
- 	printerr(2, "%s(0x%lx): principal '%s' ccache:'%s'\n",
--		__func__, tid, pname, ple->ccname);
-+		__func__, (unsigned long)tid, pname, ple->ccname);
-   out:
- 	if (opts)
- 		krb5_get_init_creds_opt_free(context, opts);
-@@ -631,7 +631,7 @@ get_full_hostname(const char *inhost, char *outhost, int outhostlen)
- 	retval = getaddrinfo(inhost, NULL, &hints, &addrs);
- 	if (retval) {
- 		printerr(1, "%s(0x%lx): getaddrinfo(%s) failed: %s\n",
--			 __func__, tid, inhost, gai_strerror(retval));
-+			 __func__, (unsigned long)tid, inhost, gai_strerror(retval));
- 		goto out;
- 	}
- 	strncpy(outhost, addrs->ai_canonname, outhostlen);
-@@ -642,7 +642,7 @@ get_full_hostname(const char *inhost, char *outhost, int outhostlen)
- 
- 	if (get_verbosity() && strcmp(inhost, outhost))
- 		printerr(1, "%s(0x%0lx): inhost '%s' different than outhost '%s'\n", 
--			 __func__, tid, inhost, outhost);
-+			 __func__, (unsigned long)tid, inhost, outhost);
- 
- 	retval = 0;
- out:
-@@ -990,7 +990,7 @@ find_keytab_entry(krb5_context context, krb5_keytab kt,
- 					tried_upper = 1;
- 				}
- 			} else {
--				printerr(2, "find_keytab_entry(0x%lx): Success getting keytab entry for '%s'\n",tid, spn);
-+				printerr(2, "find_keytab_entry(0x%lx): Success getting keytab entry for '%s'\n", (unsigned long)tid, spn);
- 				retval = 0;
- 				goto out;
- 			}
--- 
-2.47.3
-
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 1353a1a39d..1363903dbc 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/sha256sums.asc
-sha256  7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd8616813d1390e84e0  nfs-utils-3.1.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.2.1/sha256sums.asc
+sha256  a54163d8dd589fc87048c6029011bda101a580c27770a377558be2422a976afb  nfs-utils-3.2.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4b7c9fc12d..ec6e846d2b 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 3.1.1
+NFS_UTILS_VERSION = 3.2.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
