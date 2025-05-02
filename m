Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A23C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDA340E13;
	Fri,  2 May 2025 10:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBgL_5pabrAK; Fri,  2 May 2025 10:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8729040CD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8729040CD0;
	Fri,  2 May 2025 10:47:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F611EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 255396074F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akhXq0rThxqf for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 523FC6083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523FC6083A
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523FC6083A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:47:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66B231C0D8C; Fri,  2 May 2025 12:47:19 +0200 (CEST)
Message-ID: <2429ff9c-88b8-45e8-b9b4-9093de9acea6@rnout.be>
Date: Fri, 2 May 2025 12:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org
References: <20250409-lmbench_gcc15-v1-1-608717424aa9@rivosinc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250409-lmbench_gcc15-v1-1-608717424aa9@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182839; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=29BW1pkRTHB32724ltrZafXS3y9/nOAs87aIrNv1fDM=;
 b=mJsMOC8EfGb7w3wyQCFcg/wgaq+o38osic0sbXd3lLPhxP7OxWt7kKb9/3XdO9f8L8eFOj
 hY9nplObYtzK8ycc5WFU5gVKAh8W5sXXuAfJq9q/s6v1ixG5CHcNWhx0VRwrOqFGaJqH+P
 zM5TFNNl6a+5oKUnLP5COZVQLTvIAeoOqV5iA2t2zib+lmsu8vfZEiW3QGHXv1sRFo+kDr
 aYVmGo26a7unFbffC4zuODJMKcJ3XbCjkwpP9M+S5ybld5yAyAkn3Y/crCg9mepsEo22Gs
 1RpTf8AaTaMsAfv9cOLP+1m1zGOQ93zl0RLYYqf+dve9Ywx3bu+G6j0A1hFDLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mJsMOC8E
Subject: Re: [Buildroot] [PATCH] package/lmbench: Fix function definitions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2025 01:13, Charlie Jenkins wrote:
> GCC-15 requires function definitions to have proper arguments. Add them
> to dhrystone.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> GCC-15 hasn't been released yet but I was starting to look at what needs
> to be done to run Buildroot. Here's a patch to fix lmbench.
> ---
>   .../0006-Add-signum-param-to-signal-handlers.patch | 130 +++++++++++++++++++++
>   .../lmbench/0007-Fixup-function-declarations.patch | 115 ++++++++++++++++++
>   2 files changed, 245 insertions(+)
> 
> diff --git a/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..261a2bf8f9f12a67eb9192c6ef0035d9c20b19c3
> --- /dev/null
> +++ b/package/lmbench/0006-Add-signum-param-to-signal-handlers.patch
> @@ -0,0 +1,130 @@
> +From ed4f31bb09bc6355b2b642a89a1f1017de46f26e Mon Sep 17 00:00:00 2001
> +From: Charlie Jenkins <charlie@rivosinc.com>
> +Date: Fri, 4 Apr 2025 15:35:08 -0700
> +Subject: [PATCH] Add signum param to signal handlers
> +
> +A signal handler is required to have a signum parameter that is an
> +integer.
> +
> +Upstream: dead
> +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> +---
> + src/lat_udp.c |  4 ++--
> + src/lmdd.c    | 14 +++++++-------
> + src/lmhttp.c  |  4 ++--
> + 3 files changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/lat_udp.c b/src/lat_udp.c
> +index cdd2e9b..4b4441b 100644
> +--- a/src/lat_udp.c
> ++++ b/src/lat_udp.c
> +@@ -19,7 +19,7 @@ char	*id = "$Id$\n";
> +
> + void	client_main(int ac, char **av);
> + void	server_main();
> +-void	timeout();
> ++void	timeout(int signum);
> + void	init(iter_t iterations, void* cookie);
> + void	cleanup(iter_t iterations, void* cookie);
> + void    doit(iter_t iterations, void* cookie);
> +@@ -164,7 +164,7 @@ cleanup(iter_t iterations, void* cookie)
> + }
> +
> + void
> +-timeout()
> ++timeout(int signum)
> + {
> + 	fprintf(stderr, "Recv timed out\n");
> + 	exit(1);
> +diff --git a/src/lmdd.c b/src/lmdd.c
> +index dee37b4..529ae21 100644
> +--- a/src/lmdd.c
> ++++ b/src/lmdd.c
> +@@ -148,7 +148,7 @@ char   *cmds[] = {
> +
> +
> + void error(char *);
> +-void    done();
> ++void    done(int signum);
> + #ifdef	DBG
> + extern int dbg;
> + #endif
> +@@ -332,7 +332,7 @@ main(int ac, char **av)
> + 		register int moved;
> +
> + 		if (gotcnt && count-- <= 0) {
> +-			done();
> ++			done(0);
> + 		}
> +
> + 		/*
> +@@ -445,7 +445,7 @@ main(int ac, char **av)
> + 			perror("read");
> + 		}
> + 		if (moved <= 0) {
> +-			done();
> ++			done(0);
> + 		}
> + 		if (inpat != -1) {
> + 			register int foo, cnt;
> +@@ -458,7 +458,7 @@ main(int ac, char **av)
> + 					    (uint)(off + foo*sizeof(int)),
> + 					    buf[foo]);
> + 					if (mismatch != -1 && --misses == 0) {
> +-						done();
> ++						done(0);
> + 					}
> + 				}
> + 			}
> +@@ -523,7 +523,7 @@ main(int ac, char **av)
> + 			if (moved2 != moved) {
> + 				fprintf(stderr, "write: wanted=%d got=%d\n",
> + 				    moved, moved2);
> +-				done();
> ++				done(0);
> + 			}
> + 			if ((Wtmax != -1) || (Wtmin != -1)) {
> + 				int mics = stop(&start_tv, &stop_tv);
> +@@ -560,7 +560,7 @@ main(int ac, char **av)
> + 				perror("write");
> + 			}
> + 			if (moved2 != moved) {
> +-				done();
> ++				done(0);
> + 			}
> +
> + 			if (touch) {
> +@@ -626,7 +626,7 @@ chkarg(char *arg)
> + }
> +
> + void
> +-done(void)
> ++done(int signum)
> + {
> + 	int	i;
> + 	int	step;
> +diff --git a/src/lmhttp.c b/src/lmhttp.c
> +index 41d9949..9b5d665 100644
> +--- a/src/lmhttp.c
> ++++ b/src/lmhttp.c
> +@@ -26,7 +26,7 @@ char	*buf;
> + char	*bufs[3];
> + int	Dflg, dflg, nflg, lflg, fflg, zflg;
> + int	data, logfile;
> +-void	die();
> ++void	die(int signum);
> + void	worker();
> + char	*http_time(void);
> + char	*date(time_t *tt);
> +@@ -387,7 +387,7 @@ logit(int sock, char *name, int size)
> + 	nbytes += len;
> + }
> +
> +-void die()
> ++void die(int signum)
> + {
> + 	if (nbytes) {
> + 		write(logfile, logbuf, nbytes);
> +--
> +2.43.0
> +
> diff --git a/package/lmbench/0007-Fixup-function-declarations.patch b/package/lmbench/0007-Fixup-function-declarations.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..03c14a3490836836c5ce2702626c959f2bfc7a9b
> --- /dev/null
> +++ b/package/lmbench/0007-Fixup-function-declarations.patch
> @@ -0,0 +1,115 @@
> +From 6255495abf4ea516aad3b447cc32d1b244229878 Mon Sep 17 00:00:00 2001
> +From: Charlie Jenkins <charlie@rivosinc.com>
> +Date: Fri, 4 Apr 2025 15:48:07 -0700
> +Subject: [PATCH] Fixup function declarations
> +
> +GCC-15 requires function declarations to be properly typed.
> +
> +Upstream: dead
> +Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> +---
> + src/bench.h   |  4 ++--
> + src/lat_rpc.c | 18 +++++++-----------
> + src/lmdd.c    |  4 ++--
> + 3 files changed, 11 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/bench.h b/src/bench.h
> +index 597d068..b1624c5 100644
> +--- a/src/bench.h
> ++++ b/src/bench.h
> +@@ -345,7 +345,7 @@ extern int sched_pin(int cpu);
> + #define XACT_VERS ((u_long)1)
> + #define RPC_XACT ((u_long)1)
> + #define RPC_EXIT ((u_long)2)
> +-extern char *rpc_xact_1();
> +-extern char *client_rpc_xact_1();
> ++extern char *rpc_xact_1(char *msg, register SVCXPRT *transp);
> ++extern char *client_rpc_xact_1(char *argp, CLIENT *clnt);
> +
> + #endif /* _BENCH_H */
> +diff --git a/src/lat_rpc.c b/src/lat_rpc.c
> +index ff4380f..dcc24df 100644
> +--- a/src/lat_rpc.c
> ++++ b/src/lat_rpc.c
> +@@ -187,16 +187,14 @@ client_rpc_xact_1(char *argp, CLIENT *clnt)
> +  */
> + /* ARGSUSED */
> + char	*
> +-rpc_xact_1(msg, transp)
> +-     	char	*msg;
> +-	register SVCXPRT *transp;
> ++rpc_xact_1(char *msg, register SVCXPRT *transp)
> + {
> + 	static char r = 123;
> +
> + 	return &r;
> + }
> +
> +-static void xact_prog_1();
> ++static void xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp);
> +
> + void
> + server_main()
> +@@ -234,16 +232,14 @@ server_main()
> + }
> +
> + static void
> +-xact_prog_1(rqstp, transp)
> +-	struct svc_req *rqstp;
> +-	register SVCXPRT *transp;
> ++xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp)
> + {
> + 	union {
> + 		char rpc_xact_1_arg;
> + 	} argument;
> + 	char *result;
> +-	bool_t (*xdr_argument)(), (*xdr_result)();
> +-	char *(*local)();
> ++	bool_t (*xdr_argument)(XDR *, char *), (*xdr_result)(XDR *, char *);
> ++	char *(*local)(char *, struct svc_req *);
> +
> + 	switch (rqstp->rq_proc) {
> + 	case NULLPROC:
> +@@ -253,7 +249,7 @@ xact_prog_1(rqstp, transp)
> + 	case RPC_XACT:
> + 		xdr_argument = xdr_char;
> + 		xdr_result = xdr_char;
> +-		local = (char *(*)()) rpc_xact_1;
> ++		local = (char *(*)(char *, struct svc_req *)) rpc_xact_1;
> + 		break;
> +
> + 	case RPC_EXIT:
> +@@ -270,7 +266,7 @@ xact_prog_1(rqstp, transp)
> + 		svcerr_decode(transp);
> + 		return;
> + 	}
> +-	result = (*local)(&argument, rqstp);
> ++	result = (*local)((char *)&argument, rqstp);
> + 	if (result != NULL && !svc_sendreply(transp, (xdrproc_t)xdr_result, result)) {
> + 		svcerr_systemerr(transp);
> + 	}
> +diff --git a/src/lmdd.c b/src/lmdd.c
> +index 529ae21..197ac46 100644
> +--- a/src/lmdd.c
> ++++ b/src/lmdd.c
> +@@ -76,7 +76,7 @@ int	norepeats = -1;
> + 	bds_msg	*m1, *m2;
> + #endif
> +
> +-uint64	getarg();
> ++uint64	getarg(char *s, int ac, char **av);
> + int	been_there(uint64 off);
> + int	getfile(char *s, int ac, char **av);
> +
> +@@ -162,7 +162,7 @@ main(int ac, char **av)
> + 	int     Fork, misses, mismatch, outpat, inpat, in, timeopen, gotcnt;
> + 	int	slp;
> + 	uint64	skip, size, count;
> +-	void	chkarg();
> ++	void	chkarg(char *arg);
> + 	int     i;
> + 	uint64	off = 0;
> + 	int	touch;
> +--
> +2.43.0
> +
> 
> ---
> base-commit: a3b4ae2eaca9791c7c184e49a04a348dd35185c3
> change-id: 20250404-lmbench_gcc15-98506854b924

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
