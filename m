Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA75606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oDgQaBE1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A4860A51;
	Fri, 23 Oct 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZdQHfkKXqJo; Fri, 23 Oct 2026 19:47:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE3E9608FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792784865;
	b=UHKxrRL+XSIE1hAiSp7++Wu5AvPjAhhtzFJgUfC67qyVuwsTsDSy+UdkZGSvkCcfyXYN
	 tBQzDZj0GTcxyuT98vYE9ijMqQ/i3pIab4johKX/PrRyyXXsZyGIDqWvG6c485CNqLX5N
	 k5BEtFGvMFpydjv6hEAtT1utELcnLfVmcV2J+FkiCJzXc2nmayK2fVevIMp7GFnuN0Z5L
	 FsaYI9kRULgillwTid8g6PP69ZUufwWHidbzQUMXvAafEsJeLxwJ8DeCgQc3Aw/y4JLCJ
	 X8/ZT4AL1zF57eV2lAqY/evvVH3mkLLhV12NtLFZEZq+yb1MXN3J4GYMybZUU160bIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792784865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Q7tdZGnMxawG8UUY0o+IHrQScUSCUUwKII2a4I9ofh4=;
	b=JFQwBbgr8aSwdXtChp6mwLZl13p7jUsVXcjBwz3g8ZsW1y5BZ5P5+hmBgfVXcDF14DCd
	 wI+1j7YZUloYdSDBsKCG+Dgd5+wdIbuLPW5FYf76AilmQNcif/j2LfiPIjHfLZILctcu5
	 jGaJL2Quz+F30YDEQJaM9oznlWChRQ1GHU2OODtrj7VpDJtC6wVDra1nMnFr7XJ7EnLgb
	 x6XUTtw80hOWKIr8I0c+tUAAbRtfQbxJtjZnEq+shpbuIMx7vf1wowLjWhbOJd0p+vHed
	 7AOiqON5QvIkkbbgtb3j9SE0F9hEG7haMXDXpOWwZVFBGPqVeFQkCjQO2DG5YEVSQcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792784865;
	bh=Q7tdZGnMxawG8UUY0o+IHrQScUSCUUwKII2a4I9ofh4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oDgQaBE1ICzfD2jdXMBn58YjGGQkgKYYpJ9opAQEhL+VNLWRDl3l0yVZfV9WaKLbo
	 pMPme+xU1ch6C8tttPRXeZuse4ey7tij2bBkTR9u+REMoXH81MV35wEhAKGNO9v3Aa
	 CxrS5hSJXkKmuWXUXhZtZdzu5Z5l0ZZsuwAbYUxXtv0EDDhJx7ZQyue6biBwJbKbqo
	 hk+U39utMiBkx76AL2L2LinC7U8kql1ine4fdrJwb43Ti/vM2PzX6cySCDS5q8Gsll
	 z5Za75k0gnlmT16qIXnOkBae8h4u/s7zON/tk/lEAqghXBefZ7Z9C2acdlm8nSmIIy
	 wmgJVXIhDgMJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE3E9608FC;
	Fri, 23 Oct 2026 19:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 214183D9
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0712F81182
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8_RJNnxoDHs for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 19:47:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87C5981664
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792784862;
 b=YQVXko41QChztYU34yTdOtMAcd3AFWzL0hyLO/1H0GBC2FxPOV9wPwu9aLmruw7XM/gg
 JEGdb75cr8NltAYGfIY4sxmJpm0m0HDIKmye6gkr/kPqjpfG9xsLhhAPO+8Jbmy5JBMxC
 wJNm+eZZQFccw4ORaPqYBnyjLq2EUgy/2SINT1eAwT8B+y6pP4LgGrnc23F8L8No6D/In
 sbTm+YpTihBxsY8ZYYURRJdZ+5/x1F5KUnHmkPfG1qcW5jNw9Rp6a5XxyIc8qol2e0ZkB
 22NGQ1qLBbEwOuHGSoUu68vtgEdluBk8XTq7eTSicl+RTiZOm3w0CTv08iZCy+iuXvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792784862;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Bh293ipG/hU8KIdVile29CLHGp4wF+Xh6ymDQ4qTUas=;
 b=o8nvf/Ml9jjakgp99kC2QWx8asKgvLQyvVygbnDRuMIkZJZxUoTMo11OAeK2Rv5cti7k
 p4cGCNZODAZORgZ+avc7tO+Ot3+uBZFaFeaXrxXwA0MIiu2DKE+CXRb9f2JjxaKLJydBx
 6ChagbIEBFVl8Mima/VkkFntAlLQHX6TOFIAu9It3mV/yt/6qYaFb+1M6ytUkCTgy2R4T
 UfKDS4+jy4en/QrsZzgCHO3+yxxGarDHGeKxG5v6dbn0IhKR1B+NxNj98yEseKVFp36R/
 ezUVUPhtLHzbPd1E9Nthx2YWu0TUfVtOEvJ+sxu2Ca3w7JmZnFT4bfhi+PFDpiH+onA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HI46H9oB; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87C5981664
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 19:47:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 34148B00535;
 Fri, 23 Oct 2026 21:47:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 21:47:36 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 21:47:36 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Pierre Floury <pierre.floury@gmail.com>
In-Reply-To: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
References: <20261023145535.3038864-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <678a87af920f2191f9f54e0f256c440c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/libtraceevent: bump to version
 1.9.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Giulio,

On 23/10/2026 16:55, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.9.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...uild-failure-due-to-btf-on-Linux-6.0.patch | 220 ++++++++++++++++++
>  package/libtraceevent/libtraceevent.hash      |   2 +-
>  package/libtraceevent/libtraceevent.mk        |   2 +-
>  3 files changed, 222 insertions(+), 2 deletions(-)
>  create mode 100644 
> package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch
> 
> diff --git 
> a/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch 
> b/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch
> new file mode 100644
> index 0000000000..59c149bbbd
> --- /dev/null
> +++ 
> b/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch
> @@ -0,0 +1,220 @@
> +From ae96c2317cc4b3eb84d1d1717bfff2e370bea31e Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 10 Feb 2026 17:57:52 +0100
> +Subject: [PATCH] Fix build failure due to btf on Linux < 6.0
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
> +enum BTF_KIND_ENUM64 has been firstly introduced and this is the 
> latest
> +BTF_KIND_* enumaration to be added to libtraceevent. So let's check
> +in runtime, both in Makefile and meson, if BTF_KIND_ENUM64 does exist.
> +If it's not there let's disable btf support.
> +

check-package generates an error here:
"missing Upstream in the header"

I was about to add:
Upstream: 
https://lore.kernel.org/linux-trace-devel/734ab1ff-cff3-4e49-a450-7d1bc3c2e413@benettiengineering.com/T/#t

but looking at the thread, you apparently think the check is not 
sufficient.
Should we wait for a better patch before merging this?

> +Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> +Co-authored-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + Makefile        | 28 +++++++++++++++++++++-------
> + src/meson.build | 12 ++++++++++++
> + src/trace-btf.c | 31 +++++++++++++++++++++++++++++--
> + 3 files changed, 62 insertions(+), 9 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e1a10a0..bd88a98 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -27,6 +27,13 @@ $(call allow-override,PKG_CONFIG,pkg-config)
> + $(call allow-override,LD_SO_CONF_PATH,/etc/ld.so.conf.d/)
> + $(call allow-override,LDCONFIG,ldconfig)
> +
> ++# Set compile option CFLAGS
> ++ifdef EXTRA_CFLAGS
> ++  CFLAGS ?= $(EXTRA_CFLAGS)
> ++else
> ++  CFLAGS ?= -g -Wall
> ++endif
> ++
> + EXT = -std=gnu99
> + INSTALL = install
> +
> +@@ -37,6 +44,20 @@ INSTALL = install
> + DESTDIR ?=
> + DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
> +
> ++test-build = $(if $(shell sh -c 'echo "$(1)" | tee /tmp/t.c| \
> ++	$(CC) -o /dev/null -x c - > /dev/null 2>&1 && echo y'), $2)
> ++
> ++define BTF_LATEST_SOURCE
> ++#include <linux/btf.h>
> ++int main(void) { return BTF_KIND_ENUM64; }
> ++endef
> ++
> ++BTF_OK := $(call test-build,$(BTF_LATEST_SOURCE),y)
> ++
> ++ifneq ($(strip $(BTF_OK)), y)
> ++CFLAGS += -DNO_BTF
> ++endif
> ++
> + LP64 := $(shell echo __LP64__ | ${CC} ${CFLAGS} -E -x c - | tail -n 
> 1)
> + ifeq ($(LP64), 1)
> +   libdir_relative_temp = lib64
> +@@ -123,13 +144,6 @@ INCLUDES = -I. -I $(srctree)/include -I 
> $(EP_HEADERS_DIR) $(CONFIG_INCLUDES)
> +
> + export LIBTRACEEVENT_STATIC LIBTRACEEVENT_SHARED EP_HEADERS_DIR
> +
> +-# Set compile option CFLAGS
> +-ifdef EXTRA_CFLAGS
> +-  CFLAGS := $(EXTRA_CFLAGS)
> +-else
> +-  CFLAGS := -g -Wall
> +-endif
> +-
> + LIBS ?= -ldl
> + export LIBS
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 3a7a082..2432dd8 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -17,6 +17,18 @@ sources= [
> + cc = meson.get_compiler('c')
> + dl_dep = cc.find_library('dl')
> +
> ++btf_enum64_test_code = '''
> ++#include <linux/btf.h>
> ++int main(void) {
> ++    int x = BTF_KIND_ENUM64;
> ++    return 0;
> ++}
> ++'''
> ++
> ++if not cc.compiles(btf_enum64_test_code, name : 'BTF_KIND_ENUM64 
> check')
> ++    add_project_arguments('-DNO_BTF', language : 'c')
> ++endif
> ++
> + libtraceevent = library(
> +     'traceevent',
> +     sources,
> +diff --git a/src/trace-btf.c b/src/trace-btf.c
> +index 859b086..52e933c 100644
> +--- a/src/trace-btf.c
> ++++ b/src/trace-btf.c
> +@@ -8,12 +8,13 @@
> + #include <stdlib.h>
> + #include <stdbool.h>
> +
> +-#include <linux/btf.h>
> +-
> + #include "event-parse.h"
> + #include "event-utils.h"
> + #include "event-parse-local.h"
> +
> ++#ifndef NO_BTF
> ++#include <linux/btf.h>
> ++
> + struct btf_header;
> + struct btf_type;
> +
> +@@ -210,17 +211,24 @@ static int load_types(struct tep_btf *btf)
> + 	qsort_r(btf->funcs, btf->nr_funcs, sizeof(btf->funcs[0]), cmp_funcs, 
> btf);
> + 	return 0;
> + }
> ++#endif
> +
> + __hidden void btf_free(struct tep_btf *btf)
> + {
> ++#ifdef NO_BTF
> ++	tep_warning("BTF not supported.\n");
> ++	return;
> ++#else
> + 	if (!btf)
> + 		return;
> +
> + 	free(btf->types);
> + 	free(btf->funcs);
> + 	free(btf->raw_data);
> ++#endif
> + }
> +
> ++#ifndef NO_BTF
> + static struct tep_btf *btf_init(void *raw_data, size_t data_size)
> + {
> + 	struct tep_btf *btf;
> +@@ -271,6 +279,7 @@ static struct tep_btf *btf_init(void *raw_data, 
> size_t data_size)
> + 	btf_free(btf);
> + 	return NULL;
> + }
> ++#endif
> +
> + /**
> +  * tep_load_btf - Load BTF information into a tep handle
> +@@ -285,6 +294,10 @@ static struct tep_btf *btf_init(void *raw_data, 
> size_t data_size)
> +  */
> + int tep_load_btf(struct tep_handle *tep, void *raw_data, size_t 
> data_size)
> + {
> ++#ifdef NO_BTF
> ++	tep_warning("BTF not supported.\n");
> ++	return -1;
> ++#else
> + 	/* If btf was already loaded, free it */
> + 	btf_free(tep->btf);
> +
> +@@ -292,8 +305,10 @@ int tep_load_btf(struct tep_handle *tep, void 
> *raw_data, size_t data_size)
> + 	if (!tep->btf)
> + 		return -1;
> + 	return 0;
> ++#endif
> + }
> +
> ++#ifndef NO_BTF
> + static struct btf_type *btf_get_type(struct tep_btf *btf, int id)
> + {
> + 	if (!id || id > btf->nr_types)
> +@@ -457,6 +472,7 @@ static int init_btf_func(struct tep_btf *btf, 
> struct trace_seq *s,
> +
> + 	return 0;
> + }
> ++#endif
> +
> + /**
> +  * tep_btf_list_args - List the arguments (type and name) for a 
> function
> +@@ -471,6 +487,10 @@ static int init_btf_func(struct tep_btf *btf, 
> struct trace_seq *s,
> +  */
> + int tep_btf_list_args(struct tep_handle *tep, struct trace_seq *s, 
> const char *func)
> + {
> ++#ifdef NO_BTF
> ++	tep_warning("BTF not supported.\n");
> ++	return -1;
> ++#else
> + 	struct tep_btf *btf = tep->btf;
> + 	struct btf_type *type = tep_btf_find_func(btf, func);
> + 	struct btf_param *param;
> +@@ -520,6 +540,7 @@ int tep_btf_list_args(struct tep_handle *tep, 
> struct trace_seq *s, const char *f
> + 			trace_seq_printf(s, "%s", param_name);
> + 	}
> + 	return p;
> ++#endif
> + }
> +
> + /**
> +@@ -543,6 +564,11 @@ int tep_btf_list_args(struct tep_handle *tep, 
> struct trace_seq *s, const char *f
> + int tep_btf_print_args(struct tep_handle *tep, struct trace_seq *s, 
> void *args,
> + 		       int nmem, int size, const char *func)
> + {
> ++#ifdef NO_BTF
> ++	tep_warning("BTF not supported. Args:\n"
> ++		    "args: %08x, nmem: %d, size: %d, func: %08x\n");
> ++	return -1;
> ++#else
> + 	struct tep_btf *btf = tep->btf;
> + 	struct btf_type *type = tep_btf_find_func(btf, func);
> + 	struct btf_param *param;
> +@@ -646,4 +672,5 @@ int tep_btf_print_args(struct tep_handle *tep, 
> struct trace_seq *s, void *args,
> + 		}
> + 	}
> + 	return 0;
> ++#endif
> + }
> +--
> +2.47.3
> +
> diff --git a/package/libtraceevent/libtraceevent.hash 
> b/package/libtraceevent/libtraceevent.hash
> index 890e1294e6..41e130f35e 100644
> --- a/package/libtraceevent/libtraceevent.hash
> +++ b/package/libtraceevent/libtraceevent.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  
> cec7167e885d2f022bc5a2b0f2c0c58110fa0575e5dba49d7b694f0a6fd7fa0c  
> libtraceevent-1.8.7.tar.gz
> +sha256  
> 3bc19dd940914260ba591b5276723bf84bb43f82c7c3d4267622bee4d016ea55  
> libtraceevent-1.9.1.tar.gz
>  sha256  
> f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  
> LICENSES/GPL-2.0
>  sha256  
> 0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  
> LICENSES/LGPL-2.1
> diff --git a/package/libtraceevent/libtraceevent.mk 
> b/package/libtraceevent/libtraceevent.mk
> index d0de336de0..29a3c26c27 100644
> --- a/package/libtraceevent/libtraceevent.mk
> +++ b/package/libtraceevent/libtraceevent.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBTRACEEVENT_VERSION = 1.8.7
> +LIBTRACEEVENT_VERSION = 1.9.1
>  LIBTRACEEVENT_SITE = 
> https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
>  LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
>  LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
