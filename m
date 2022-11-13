Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D34C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 11:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84ADF408D9;
	Sun, 13 Nov 2022 11:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84ADF408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7nfxTdxCZzLL; Sun, 13 Nov 2022 11:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697D1408F2;
	Sun, 13 Nov 2022 11:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697D1408F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D38981BF42E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF04408F2
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF04408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYUv7NeWgwCS for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 11:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707AC408D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 707AC408D9
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 11:51:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AAB9013F895;
 Sun, 13 Nov 2022 12:51:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 12:51:04 +0100
Date: Sun, 13 Nov 2022 12:51:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221113115104.GD2123054@scaer>
References: <20221011084946.2276735-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221011084946.2276735-1-nunes.erico@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668340266;
 bh=GtV73CKkJKRFb1hbNTEnWzezG22Ppyf+9izqdqrazC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jI1A0MsVM4JCP/Ba4k6Qyog+Em+lWRR/Asl0hJUu4Fh8lhdu/4VX7Oh6MwsOX0Dpy
 Qimfpi1g8D9BP6JDZWqpzDws4s8uagPnU+6l1eknWuKvG1VPIwSoBGmI2CwLsMU03w
 iE6NOguUXZuE+IEgMt8QrPO7iJWrFcM+9k4eMkptaLV9vQn9gr1spMFSdSmQV/YEIe
 fO84LzMIHFPrqQI9/qisLwIj8cBe3MV188nZ/tW8zwXXFDQADWgYnHJRfd91xiAEgo
 W5dqvl5HC6S81nt0r4xy2yvAFmUzbiJzoRr/0kgxysdO8K6kX95jdPLFccMVGEHpnr
 9c+q98aFP8mtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jI1A0MsV
Subject: Re: [Buildroot] [PATCH] package/efivar: fix build with musl libc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Erico, All,

On 2022-10-11 10:49 +0200, Erico Nunes spake thusly:
> Backport upstream patch to fix build with musl libc.
> This patch is only a requirement since efivar 38 and was applied
> upstream shortly after the 38 version tag.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c49d894b109d68e2624074eab8b939fefa3b42ef/
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...04-efisecdb-fix-build-with-musl-libc.patch | 185 ++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
> 
> diff --git a/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch b/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
> new file mode 100644
> index 0000000000..9815a9d0cf
> --- /dev/null
> +++ b/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
> @@ -0,0 +1,185 @@
> +From cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Fri, 28 Jan 2022 12:13:30 +0100
> +Subject: [PATCH] efisecdb: fix build with musl libc
> +
> +Refactor code to use POSIX atexit(3) instead of the GNU specific
> +on_exit(3).
> +
> +Resolves: #197
> +Resolves: #202
> +Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> +[Erico: backport from upstream commit
> +cece3ffd5be2f8641eb694513f2b73e5eb97ffd3]
> +Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> +---
> + src/compiler.h |  2 --
> + src/efisecdb.c | 68 +++++++++++++++++++-------------------------------
> + 2 files changed, 26 insertions(+), 44 deletions(-)
> +
> +diff --git a/src/compiler.h b/src/compiler.h
> +index e2f18f0..d95fb01 100644
> +--- a/src/compiler.h
> ++++ b/src/compiler.h
> +@@ -7,8 +7,6 @@
> + #ifndef COMPILER_H_
> + #define COMPILER_H_
> + 
> +-#include <sys/cdefs.h>
> +-
> + /* GCC version checking borrowed from glibc. */
> + #if defined(__GNUC__) && defined(__GNUC_MINOR__)
> + #  define GNUC_PREREQ(maj,min) \
> +diff --git a/src/efisecdb.c b/src/efisecdb.c
> +index f882373..6bd5ad9 100644
> +--- a/src/efisecdb.c
> ++++ b/src/efisecdb.c
> +@@ -25,6 +25,10 @@
> + extern char *optarg;
> + extern int optind, opterr, optopt;
> + 
> ++static efi_secdb_t *secdb = NULL;
> ++static list_t infiles;
> ++static list_t actions;
> ++
> + struct hash_param {
> + 	char *name;
> + 	efi_secdb_type_t algorithm;
> +@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t action_type, const efi_guid_t *owner,
> + }
> + 
> + static void
> +-free_actions(int status UNUSED, void *actionsp)
> ++free_actions(void)
> + {
> +-	list_t *actions = (list_t *)actionsp;
> + 	list_t *pos, *tmp;
> + 
> +-	for_each_action_safe(pos, tmp, actions) {
> ++	for_each_action_safe(pos, tmp, &actions) {
> + 		action_t *action = list_entry(pos, action_t, list);
> + 
> + 		list_del(&action->list);
> +@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
> + }
> + 
> + static void
> +-free_infiles(int status UNUSED, void *infilesp)
> ++free_infiles(void)
> + {
> +-	list_t *infiles = (list_t *)infilesp;
> + 	list_t *pos, *tmp;
> + 
> +-	for_each_ptr_safe(pos, tmp, infiles) {
> ++	for_each_ptr_safe(pos, tmp, &infiles) {
> + 		ptrlist_t *entry = list_entry(pos, ptrlist_t, list);
> + 
> + 		list_del(&entry->list);
> +@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
> + }
> + 
> + static void
> +-maybe_free_secdb(int status UNUSED, void *voidp)
> ++maybe_free_secdb(void)
> + {
> +-	efi_secdb_t **secdbp = (efi_secdb_t **)voidp;
> +-
> +-	if (secdbp == NULL || *secdbp == NULL)
> ++	if (secdb == NULL)
> + 		return;
> + 
> +-	efi_secdb_free(*secdbp);
> +-}
> +-
> +-static void
> +-maybe_do_unlink(int status, void *filep)
> +-{
> +-	char **file = (char **)filep;
> +-
> +-	if (status == 0)
> +-		return;
> +-	if (file == NULL || *file == NULL)
> +-		return;
> +-
> +-	unlink(*file);
> ++	efi_secdb_free(secdb);
> + }
> + 
> + static void
> +@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char **outfile, efi_secdb_t **secdb,
> + 	return status;
> + }
> + 
> +-/*
> +- * These need to be static globals so that they're not on main's stack when
> +- * on_exit() fires.
> +- */
> +-static efi_secdb_t *secdb = NULL;
> +-static list_t infiles;
> +-static list_t actions;
> +-static char *outfile = NULL;
> +-
> + int
> + main(int argc, char *argv[])
> + {
> +@@ -351,6 +329,7 @@ main(int argc, char *argv[])
> + 	bool do_sort_data = false;
> + 	bool sort_descending = false;
> + 	int status = 0;
> ++	char *outfile = NULL;
> + 
> + 	const char sopts[] = ":aAc:dfg:h:i:Lo:rs:t:v?";
> + 	const struct option lopts[] = {
> +@@ -376,10 +355,9 @@ main(int argc, char *argv[])
> + 	INIT_LIST_HEAD(&infiles);
> + 	INIT_LIST_HEAD(&actions);
> + 
> +-	on_exit(free_actions, &actions);
> +-	on_exit(free_infiles, &infiles);
> +-	on_exit(maybe_free_secdb, &secdb);
> +-	on_exit(maybe_do_unlink, &outfile);
> ++	atexit(free_actions);
> ++	atexit(free_infiles);
> ++	atexit(maybe_free_secdb);
> + 
> + 	/*
> + 	 * parse the command line.
> +@@ -587,24 +565,30 @@ sort_err:
> + 	outfd = open(outfile, flags, 0600);
> + 	if (outfd < 0) {
> + 		char *tmpoutfile = outfile;
> +-		if (errno == EEXIST)
> +-			outfile = NULL;
> ++		if (errno != EEXIST)
> ++			unlink(outfile);
> + 		err(1, "could not open \"%s\"", tmpoutfile);
> + 	}
> + 
> + 	rc = ftruncate(outfd, 0);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		err(1, "could not truncate output file \"%s\"", outfile);
> ++	}
> + 
> + 	void *output;
> + 	size_t size = 0;
> + 	rc = efi_secdb_realize(secdb, &output, &size);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		secdb_err(1, "could not realize signature list");
> ++	}
> + 
> + 	rc = write(outfd, output, size);
> +-	if (rc < 0)
> ++	if (rc < 0) {
> ++		unlink(outfile);
> + 		err(1, "could not write signature list");
> ++	}
> + 
> + 	close(outfd);
> + 	xfree(output);
> +-- 
> +2.37.3
> +
> -- 
> 2.37.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
