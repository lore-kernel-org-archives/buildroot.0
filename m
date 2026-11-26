Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81AD606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kNmM3ooU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D0560AA5;
	Thu, 26 Nov 2026 17:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chmeH8t3SvxL; Thu, 26 Nov 2026 17:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6774F60A6E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795715679;
	b=JaFp/VtQxeC67ofnUDPPQs8sbjJw4MoH22bv5+N4fZidfxfkkyyjcMIzrUR5sxd9dAxW
	 mUycayU5mO2TumJ3gJWkcV0VbtWqSWWvAk7D2t5YaHw2V05O++KcvOTVdI83f6ZzzCPM9
	 LX3WxadlXnz++5umlnmnEBdtpimbFyLASnUpOJuDN6r9nKfQ9RsZsqSHsExu0yL6eWBAT
	 nuzCdDgLgVGPHTwN/B029u6i7eFKxgyO93NnVULIIPU+MW3IQYduiWTRgJ71kaCFBah96
	 5zDiYxjRsp2VAAhZO3TXXffQvQeTtn90bBWA5Q+MhedfdUfgVSClM+Kr0j0528ySGFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795715679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=Qpd40FRXnQhtm/ZxMYxhBrcsLukyhUL1Ynz4wmkJ0a4=;
	b=Xr9+O9aHgI99u5oX43t2RvFSMHaK7EEPKDUfzg7YdxVTnxne9Rkt2+ytjOFezH08iPAs
	 9Z0CmD0NAAZLTUePUus5ImQ2rLn2EkB2i0BAj0OYbLHiXzvPjTJsLa56wsiG2yp1hLBKD
	 XWEZIbq88Bz+VwEYJ1VB7CajtEgUgwZUkHWt5iYH1PW7/jQef07k1bpM23ybjv/vRsX8O
	 arhi++87+og/ZiHsWyC71J/no6W9/7btgx9Q8ME5gfqklSixrxeiCnRSgGXrv1kTxzCIm
	 fbvvJnK2PPN3FGR5Gypd6NPHTHNnlEOlNzA4ifCK/gLnTIsY3BTiKncPEJlw81uQwcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795715679;
	bh=Qpd40FRXnQhtm/ZxMYxhBrcsLukyhUL1Ynz4wmkJ0a4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kNmM3ooUyaup163C8jXKO1qh8XqR7HvVmLBIT81pRnuBdOrC+GXtp+s17EWTePUCV
	 HFRIw2EWK7nP9Wen3yGO7hSL5uOgaJXI3jsBx8DZZwEhVR8LUnExee2EBc69bn35qe
	 KG4vBYzApwOKVjAgbPdgXkuIxVqlq9FPyszDK4f3l7IdMnxjkWMsViY8fiETcz3U9L
	 0sB2iVIHePg/H4SQV697zLBS2FfSEaMtzgGcihiaGDRbZ+SeKqy88pdA79wnNi0jdr
	 Xcxgt6EuT1VItRhE16mcs44rQwJ5hIEwmJiD+AQ+FW1ieRfrH18lJfrFqknXUXZBcS
	 7xUUEHkfdRvPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6774F60A6E;
	Thu, 26 Nov 2026 17:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EABCD22B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC7BD81111
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZx-KNQDrs5J for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 17:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE9128110A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE9128110A
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 17:54:33 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795715671; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:YhYVLRgDQuwkJKTy3pNLDgQLMY4D
 7vMtDhsBAtX8nR2i5F0rCfPRGhz6PH3ZS27D9KVudKXR9m/0SciPVDClqs+sciyX5zkvZQMC9OR
 et7jEzhYOMIwOG86Ic5ZxahncjZoxUhm5g6mDrWYM4wrU6Tdx/1+kCxmaXtENmlOBEF7MQm8sTz
 eBBlhPjT1eBE8GS1FqWKpNYqVoegvpUhvtk622xgLTDPa+IgRsc7MDwK3q5QAtaoRSpvYATjRpj
 eeS2d/42hfz5mJzGMkx/uTioPa1qpnBxCZ4fy+CzICbxxFoLZWlWGYKaaT2qOXvXxsZRzw3mDQm
 eK/sXJQqQjHF+w==;
Message-Instance: m=1; h=sha256: EPqqj0Vnb/yoqmVL/2FYDvAB7dEOBd97lhmGNwY+HVk=:
 lC8fUkX8nr6i05/0zFjIe+X8ZN3hHTRwX23JfakLQTo=, sha512:
 E4tIvtieJjnayBMIQKArnrDgIaMcSORrq5mTJsYXMJqrCp8ELpSL29qVYOxWasHZPMlyYAOMJJJrAnr6OYjrLQ==:
 72thVbAk0G8A+iZJZyc+DqO81oVB40eduD21YVH/rbU8LCbi9WoIECqVAB8ZkE77gN1sUv2HuGjItzi6J1VAOg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCbEp-1xgECK0q9b-000FiE for
 <buildroot@buildroot.org>; Thu, 26 Nov 2026 18:54:31 +0100
Message-ID: <88c13491-893c-447b-a7e2-30db1030a853@gmx.de>
Date: Thu, 26 Nov 2026 18:54:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20261105132521.3787872-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261105132521.3787872-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:+2gEhKJR5/e1F5dzMfkus0HrviQXu4cSDb9KO2lgSLnRSO0xDGd
 xoapPfJgu6y3DEZj4paql0tauYn76vHIGYuxXywXPjZqUTZLw6k1XZe1B34dkHjTn/hfxmc
 BTr3mGE6hD5W/lRyXRuU+c+bwgFA5NwlkAytdBbRvyswyetmDlvkg4xbEUutpAAOh+j4oFY
 7Hf8vTuuuH2PnIlBId9fw==
UI-OutboundReport: notjunk:1;M01:P0:u5A9h2i5pb4=;YIvy5DEDU31twL8Pk6F8j14ryIn
 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
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fakeroot: add patch to fix
 segfault with glibc 2.44
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 05.11.26 um 14:25 schrieb Fiona Klute via buildroot:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Glibc 2.44 changed handling of FTS.fts_statp in a way that causes
> segfaults when using fts_read() with certain flags, please see patch
> description for details. This showed in a Buildroot build on Arch with
> BR2_TARGET_ROOTFS_CPIO_DRACUT=y: dracut-install uses fts_read() when
> searching kernel modules to install, and segfaulted.

Ping about this. I'd rather not have 2026.11 released with a know 
segfault issue.

> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * patch was accepted upstream, change Upstream: URL from MR to commit
>    on main
> 
> v1: https://patchwork.buildroot.org/project/buildroot/patch/20261016125527.1314651-1-fiona.klute@gmx.de/
> 
>   ...t-FTS.fts_statp-to-NULL-fix-segfault.patch | 113 ++++++++++++++++++
>   1 file changed, 113 insertions(+)
>   create mode 100644 package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
> 
> diff --git a/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
> new file mode 100644
> index 0000000000..3320897d1c
> --- /dev/null
> +++ b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
> @@ -0,0 +1,113 @@
> +From 5b72148221405de22589011e9f56247468a2c51a Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Thu, 15 Oct 2026 18:25:16 +0200
> +Subject: [PATCH] Do not set FTS.fts_statp to NULL, fix segfault
> +
> +Glibc always allocates fts_statp since commit
> +99303f387179332d64e5ee34a6b58e82a523bae5 ("io: Use gnulib fts
> +implementation (BZ 22944, BZ 20331)"), and expects it to be allocated,
> +including using fts_statp->st_size to indicate whether fts_read should
> +stat the entry (see fts_set_stat_required() in io/fts.c). The
> +structure is reused, and with that setting fts_statp to NULL causes a
> +segfault on a following call that tries to set a field in fts_statp.
> +
> +Instead of setting fts_statp to NULL and checking for that, check for
> +FTS_NOSTAT and fts_info values indicating that fts_statp is undefined,
> +and leave fts_statp alone if either is true.
> +
> +Program to reproduce the problem with glibc versions newer than the
> +commit mentioned above (pass at least one directory on the command
> +line, files do not trigger the segfault):
> +
> +int main(int argc, char **argv) {
> +	if (!argv[1]) {
> +		printf("no parameters!\n");
> +		exit(1);
> +	}
> +
> +	FTS *fts = fts_open(&(argv[1]), FTS_NOSTAT | FTS_PHYSICAL, NULL);
> +	if (!fts) {
> +		perror("fts_open() failed");
> +		exit(2);
> +	}
> +
> +	for (FTSENT *ftsent = fts_read(fts); ftsent != NULL; ftsent = fts_read(fts)) {
> +		printf("seen: %s\n", ftsent->fts_accpath);
> +	}
> +	if (errno != 0)
> +		perror("fts_read() failed");
> +
> +	if (fts_close(fts) < 0) {
> +		perror("fts_close() failed");
> +		exit(3);
> +	}
> +	return 0;
> +}
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://salsa.debian.org/clint/fakeroot/-/commit/322d274c0899c82167794142ad2cd3e1a6e5ef07
> +---
> +
> + libfakeroot.c         |  9 ++++-----
> + libfakeroot_inode64.c | 11 ++++-------
> + 2 files changed, 8 insertions(+), 12 deletions(-)
> +
> +diff --git a/libfakeroot.c b/libfakeroot.c
> +index 69e2f6f..4a00fb8 100644
> +--- a/libfakeroot.c
> ++++ b/libfakeroot.c
> +@@ -2151,10 +2151,8 @@ FTSENT *fts_read(FTS *ftsp) {
> +   }
> + #endif /* LIBFAKEROOT_DEBUGGING */
> +   r=next_fts_read(ftsp);
> +-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
> +-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
> +-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
> +-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
> ++  if (r && !(ftsp->fts_options & FTS_NOSTAT
> ++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
> +     SEND_GET_STAT(r->fts_statp, _STAT_VER);
> +   }
> +
> +@@ -2173,7 +2171,8 @@ FTSENT *fts_children(FTS *ftsp, int options) {
> + #endif /* LIBFAKEROOT_DEBUGGING */
> +   first=next_fts_children(ftsp, options);
> +   for(r = first; r; r = r->fts_link) {
> +-    if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
> ++    if (r && !(ftsp->fts_options & FTS_NOSTAT
> ++               || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
> +       SEND_GET_STAT(r->fts_statp, _STAT_VER);
> +     }
> +   }
> +diff --git a/libfakeroot_inode64.c b/libfakeroot_inode64.c
> +index ba5802c..e5aecbd 100644
> +--- a/libfakeroot_inode64.c
> ++++ b/libfakeroot_inode64.c
> +@@ -112,12 +112,8 @@ FTSENT *fts_read$INODE64(FTS *ftsp) {
> +   }
> + #endif /* LIBFAKEROOT_DEBUGGING */
> +   r=next_fts_read$INODE64(ftsp);
> +-#ifdef __APPLE__
> +-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
> +-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
> +-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
> +-#endif
> +-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
> ++  if (r && !(ftsp->fts_options & FTS_NOSTAT
> ++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
> +     send_get_stat64((struct stat64 *)r->fts_statp);
> +   }
> +
> +@@ -136,7 +132,8 @@ FTSENT *fts_children$INODE64(FTS *ftsp,
> + #endif /* LIBFAKEROOT_DEBUGGING */
> +   first=next_fts_children$INODE64(ftsp, options);
> +   for(r = first; r; r = r->fts_link) {
> +-    if(r->fts_statp) {  /* Should we bother checking fts_info here? */
> ++    if (!(ftsp->fts_options & FTS_NOSTAT
> ++          || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
> +       send_get_stat64((struct stat64 *)r->fts_statp);
> +     }
> +   }
> +--
> +2.55.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
