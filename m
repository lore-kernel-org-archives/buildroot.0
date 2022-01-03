Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C60C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A60813AB;
	Mon,  3 Jan 2022 09:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGRCxSTweoTQ; Mon,  3 Jan 2022 09:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AFBF8134F;
	Mon,  3 Jan 2022 09:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C299D1BF360
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B05EF60B64
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzmH_k1mN5Mm for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 09:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8076B60B37
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 09:17:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c1c4:dbff:d80e:9740])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9DC992003C1;
 Mon,  3 Jan 2022 10:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641201421;
 bh=S4Pf4jcQLUGCoEiaUMCx5WDQ/hmuB+RlbXMZaG9ssJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LGOK0qQz//Z4N5xwjvCruQ8U6y0NJV4RjMKaOPCAbk7J15leRsofGmTp7YHU+O7uU
 QnQ10VjelOGoWo4UyqktjAfcQJE7w1DtHhP/32koxNbjWtjn0Fv9zv+5L1B/vFw6hv
 m1BcUr5AinLkY+PdM/XPPFYyAJPwsjTkXsbxn9z/rkSO8Ed7CfjUxbDMa6aMfwE8zk
 4mJ4Xzh4hXvB7X+3olFVkjXpN+J+d5yhrqTKi4mJh4qhx9OVdg7e+m8KMgls8D7gwl
 mbQMrf/fEG791JK+Y0JKl6Gkt/MVWtnFfDrpi9IcZR/aiKxNtc9iUwM1+6lemvJVoy
 60dapbxD3vlkA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 10:16:57 +0100
Date: Mon, 3 Jan 2022 10:16:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220103091657.GF69135@scaer>
References: <20220102200337.3271548-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220102200337.3271548-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/file: fix build with gcc 4.8
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

Fabrice, All,

On 2022-01-02 21:03 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 5.41 in
> commit d38b72bcd75392a88b5100839ac410859d0a6a79:
> 
> readelf.c: In function 'do_auxv_note':
> readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
>   for (size_t off = 0; off + elsize <= descsz; off += elsize) {
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc

The error above explicitly states that C99 should be used to build those
files. C99 is supposedly complete in gcc 4.8, but was not the default,
hence the error.

And it seems that using C99 is what we attempted in da400ee5e1e (file:
bump to version 5.26), which added the following line:

    FILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'

So, why are those files not built with C99? Ha, because this is the host
variant... We should also use -std=gnu99 for the host variant.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../file/0001-fix-build-with-gcc-4.8.patch    | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 package/file/0001-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/file/0001-fix-build-with-gcc-4.8.patch b/package/file/0001-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..2494c6a7c0
> --- /dev/null
> +++ b/package/file/0001-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,97 @@
> +From e36455301a3757618381cb83bf17115dd386131e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 2 Jan 2022 20:41:31 +0100
> +Subject: [PATCH] fix build with gcc 4.8
> +
> +Fix the following build failure with gcc 4.8
> +
> +readelf.c: In function 'do_auxv_note':
> +readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
> +  for (size_t off = 0; off + elsize <= descsz; off += elsize) {
> +  ^
> +
> +funcs.c:93:2: error: 'for' loop initial declarations are only allowed in C99 mode
> +  for (const char *p = fmt; *p; p++) {
> +  ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://bugs.astron.com/view.php?id=307]
> +---
> + src/der.c     | 6 ++++--
> + src/funcs.c   | 3 ++-
> + src/readelf.c | 4 ++--
> + 3 files changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/der.c b/src/der.c
> +index 4bee9f16..23b9a574 100644
> +--- a/src/der.c
> ++++ b/src/der.c
> +@@ -235,6 +235,7 @@ der_tag(char *buf, size_t len, uint32_t tag)
> + static int
> + der_data(char *buf, size_t blen, uint32_t tag, const void *q, uint32_t len)
> + {
> ++	uint32_t i;
> + 	const uint8_t *d = CAST(const uint8_t *, q);
> + 	switch (tag) {
> + 	case DER_TAG_PRINTABLE_STRING:
> +@@ -251,7 +252,7 @@ der_data(char *buf, size_t blen, uint32_t tag, const void *q, uint32_t len)
> + 		break;
> + 	}
> + 
> +-	for (uint32_t i = 0; i < len; i++) {
> ++	for (i = 0; i < len; i++) {
> + 		uint32_t z = i << 1;
> + 		if (z < blen - 2)
> + 			snprintf(buf + z, blen - z, "%.2x", d[i]);
> +@@ -283,7 +284,8 @@ der_offs(struct magic_set *ms, struct magic *m, size_t nbytes)
> + 	offs += ms->offset + m->offset;
> + 	DPRINTF(("cont_level = %d\n", m->cont_level));
> + #ifdef DEBUG_DER
> +-	for (size_t i = 0; i < m->cont_level; i++)
> ++	size_t i;
> ++	for (i = 0; i < m->cont_level; i++)
> + 		printf("cont_level[%" SIZE_T_FORMAT "u] = %u\n", i,
> + 		    ms->c.li[i].off);
> + #endif
> +diff --git a/src/funcs.c b/src/funcs.c
> +index d968873d..08b565fb 100644
> +--- a/src/funcs.c
> ++++ b/src/funcs.c
> +@@ -90,7 +90,8 @@ file_checkfield(char *msg, size_t mlen, const char *what, const char **pp)
> + protected int
> + file_checkfmt(char *msg, size_t mlen, const char *fmt)
> + {
> +-	for (const char *p = fmt; *p; p++) {
> ++	const char *p;
> ++	for (p = fmt; *p; p++) {
> + 		if (*p != '%')
> + 			continue;
> + 		if (*++p == '%')
> +diff --git a/src/readelf.c b/src/readelf.c
> +index 01c60fe9..46421a2e 100644
> +--- a/src/readelf.c
> ++++ b/src/readelf.c
> +@@ -1015,7 +1015,7 @@ do_auxv_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
> + 	size_t elsize = xauxv_sizeof;
> + 	const char *tag;
> + 	int is_string;
> +-	size_t nval;
> ++	size_t nval, off;
> + 
> + 	if ((*flags & (FLAGS_IS_CORE|FLAGS_DID_CORE_STYLE)) !=
> + 	    (FLAGS_IS_CORE|FLAGS_DID_CORE_STYLE))
> +@@ -1043,7 +1043,7 @@ do_auxv_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
> + 	*flags |= FLAGS_DID_AUXV;
> + 
> + 	nval = 0;
> +-	for (size_t off = 0; off + elsize <= descsz; off += elsize) {
> ++	for (off = 0; off + elsize <= descsz; off += elsize) {
> + 		memcpy(xauxv_addr, &nbuf[doff + off], xauxv_sizeof);
> + 		/* Limit processing to 50 vector entries to prevent DoS */
> + 		if (nval++ >= 50) {
> +-- 
> +2.33.0
> +
> -- 
> 2.33.0
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
