Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E3CECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E43B940124;
	Mon, 19 Sep 2022 19:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43B940124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKA2lc7tepIy; Mon, 19 Sep 2022 19:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2BA240125;
	Mon, 19 Sep 2022 19:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2BA240125
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CECF61BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A69416C9
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A69416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BAoIFGM8M5U for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:36:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD11940880
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD11940880
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:36:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ff43:9597:808d:a748])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B05A019F58D;
 Mon, 19 Sep 2022 21:36:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Sep 2022 21:36:14 +0200
Date: Mon, 19 Sep 2022 21:36:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220919193614.GN1419013@scaer>
References: <20220919123147.1236781-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919123147.1236781-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663616177;
 bh=vTCFePxItmhKyDHDzo2MpezRFrH5bBVOJNua9Hwvdnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qkK9ri07L8Zry1nc9OVrfJP0G6+j6t3gwwlMCj276H6mLXkOj76jymxpinfqa+oQ+
 uWXXWBTW1IdNLPvCZmbkkV4ZoIYc1K6biCaLQUc3wzWp+zTXIWCs9lrLnQCFuoFXa2
 de0qg0t8DhHLcIghNTSoN2qyxO23JPWyZ5U3MT+lyyqu/3L9u7HDK1Kv0iwW3rQa7g
 MW63Vg53w+yhXrNVrQeui+v5oEHaZkE3B5XFWX2tQErfwZnQnozFBbTDecHW37SQGO
 zz5GDHjlxhRe017Qc2RNvvDh5gpW5v77l2ms9n/6edSDySDplCSf17pclTP/2pi9Ku
 Lc1SPKCJOzFoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qkK9ri07
Subject: Re: [Buildroot] [PATCH] package/busybox: fix CVE-2022-28391
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-09-19 14:31 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> The patches have been used by Alpine for 5 months now and they were
> posted on the Busybox mailing list mid-July with no review or comment.
> 
> According to Ariadne Conill[1] - though NVD CVSS 3.x Base Score seems to
> disagree - this has a low security impact so we could probably just wait
> for upstream to merge the patches or implement it the way they want.
> 
> Considering those patches have been public for 5 months and upstream
> hasn't acted until now, let's take the patches from the mailing list
> anyway as there's no indication the CVEs will be fixed upstream soon.
> 
> [1] https://gitlab.alpinelinux.org/alpine/aports/-/issues/13661
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Cc'ing Peter for backport to stable releases
> Only build tested
> git context depends on
> https://lore.kernel.org/buildroot/20220919114757.1076737-1-foss+buildroot@0leil.net/
> 
>  ...tr-ensure-only-printable-characters-.patch | 42 +++++++++++
>  ...e-all-printed-strings-with-printable.patch | 69 +++++++++++++++++++
>  package/busybox/busybox.mk                    |  3 +
>  3 files changed, 114 insertions(+)
>  create mode 100644 package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
>  create mode 100644 package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch
> 
> diff --git a/package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
> new file mode 100644
> index 0000000000..623b2597a2
> --- /dev/null
> +++ b/package/busybox/0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
> @@ -0,0 +1,42 @@
> +From 9d825e854ef53ebbe0aea2f1a69f52b763104daf Mon Sep 17 00:00:00 2001
> +From: Ariadne Conill <ariadne@dereferenced.org>
> +Date: Mon, 19 Sep 2022 14:15:12 +0200
> +Subject: [PATCH] libbb: sockaddr2str: ensure only printable characters are
> + returned for the hostname part
> +
> +CVE: CVE-2022-28391
> +Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
> +Tested-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Backport from ML: http://lists.busybox.net/pipermail/busybox/2022-July/089796.html
> +Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> +---
> + libbb/xconnect.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/libbb/xconnect.c b/libbb/xconnect.c
> +index 0e0b247b8..02c061e67 100644
> +--- a/libbb/xconnect.c
> ++++ b/libbb/xconnect.c
> +@@ -497,8 +497,9 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
> + 	);
> + 	if (rc)
> + 		return NULL;
> ++	/* ensure host contains only printable characters */
> + 	if (flags & IGNORE_PORT)
> +-		return xstrdup(host);
> ++		return xstrdup(printable_string(host));
> + #if ENABLE_FEATURE_IPV6
> + 	if (sa->sa_family == AF_INET6) {
> + 		if (strchr(host, ':')) /* heh, it's not a resolved hostname */
> +@@ -509,7 +510,7 @@ static char* FAST_FUNC sockaddr2str(const struct sockaddr *sa, int flags)
> + #endif
> + 	/* For now we don't support anything else, so it has to be INET */
> + 	/*if (sa->sa_family == AF_INET)*/
> +-		return xasprintf("%s:%s", host, serv);
> ++		return xasprintf("%s:%s", printable_string(host), serv);
> + 	/*return xstrdup(host);*/
> + }
> + 
> +-- 
> +2.37.3
> +
> diff --git a/package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch b/package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch
> new file mode 100644
> index 0000000000..bfa58465e7
> --- /dev/null
> +++ b/package/busybox/0005-nslookup-sanitize-all-printed-strings-with-printable.patch
> @@ -0,0 +1,69 @@
> +From bd463a5564a2c0618317448c3f965d389534c3df Mon Sep 17 00:00:00 2001
> +From: Ariadne Conill <ariadne@dereferenced.org>
> +Date: Mon, 19 Sep 2022 14:15:12 +0200
> +Subject: [PATCH] nslookup: sanitize all printed strings with printable_string
> +
> +Otherwise, terminal sequences can be injected, which enables various terminal injection
> +attacks from DNS results.
> +
> +CVE: CVE-2022-28391
> +Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
> +Tested-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Backport from ML: http://lists.busybox.net/pipermail/busybox/2022-July/089795.html
> +Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> +---
> + networking/nslookup.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/networking/nslookup.c b/networking/nslookup.c
> +index 6da97baf4..4bdcde1b8 100644
> +--- a/networking/nslookup.c
> ++++ b/networking/nslookup.c
> +@@ -407,7 +407,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
> + 				//printf("Unable to uncompress domain: %s\n", strerror(errno));
> + 				return -1;
> + 			}
> +-			printf(format, ns_rr_name(rr), dname);
> ++			printf(format, ns_rr_name(rr), printable_string(dname));
> + 			break;
> + 
> + 		case ns_t_mx:
> +@@ -422,7 +422,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
> + 				//printf("Cannot uncompress MX domain: %s\n", strerror(errno));
> + 				return -1;
> + 			}
> +-			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, dname);
> ++			printf("%s\tmail exchanger = %d %s\n", ns_rr_name(rr), n, printable_string(dname));
> + 			break;
> + 
> + 		case ns_t_txt:
> +@@ -434,7 +434,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
> + 			if (n > 0) {
> + 				memset(dname, 0, sizeof(dname));
> + 				memcpy(dname, ns_rr_rdata(rr) + 1, n);
> +-				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), dname);
> ++				printf("%s\ttext = \"%s\"\n", ns_rr_name(rr), printable_string(dname));
> + 			}
> + 			break;
> + 
> +@@ -454,7 +454,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
> + 			}
> + 
> + 			printf("%s\tservice = %u %u %u %s\n", ns_rr_name(rr),
> +-				ns_get16(cp), ns_get16(cp + 2), ns_get16(cp + 4), dname);
> ++				ns_get16(cp), ns_get16(cp + 2), ns_get16(cp + 4), printable_string(dname));
> + 			break;
> + 
> + 		case ns_t_soa:
> +@@ -483,7 +483,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
> + 				return -1;
> + 			}
> + 
> +-			printf("\tmail addr = %s\n", dname);
> ++			printf("\tmail addr = %s\n", printable_string(dname));
> + 			cp += n;
> + 
> + 			printf("\tserial = %lu\n", ns_get32(cp));
> +-- 
> +2.37.3
> +
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 0f887c9734..ef628e90e9 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -13,6 +13,9 @@ BUSYBOX_CPE_ID_VENDOR = busybox
>  
>  # 0003-awk-fix-use-after-free-CVE-2022-30065.patch
>  BUSYBOX_IGNORE_CVES += CVE-2022-30065
> +# 0004-libbb-sockaddr2str-ensure-only-printable-characters-.patch
> +# 0005-nslookup-sanitize-all-printed-strings-with-printable.patch
> +BUSYBOX_IGNORE_CVES += CVE-2022-28391
>  
>  BUSYBOX_CFLAGS = \
>  	$(TARGET_CFLAGS)
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
