Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2F606A337
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OFXmvhKr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=exzgE6jB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C96B80F23;
	Mon, 26 Oct 2026 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzuFx0wFH6OO; Mon, 26 Oct 2026 16:30:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B22880EBE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793032253;
	b=kfG1JZhNJB6/26N2+El2e+mpHkckg5CW9sPRrj5mTUF7LvA8QiIXCkMoJ09c0IR/6wHC
	 DrIhIwHQXx9CPVicQ/tNcuJrZ6KqJyVNgesvQu68vBxrhEGM8vwjGGD9/jM9/w8PiJbsL
	 2BUFkmBh4CKSATrSpY/4U150vakMi73qNnBWieW2Moi4YgczYX7eZzJ8zqEWEfckDRvAr
	 bBNNuayYBz2qwi+BL6eO2fD2KTmwBtfFp/k6uUuNl8JPQkWQBPj5vm1eUv+pKd8qLvN8h
	 f4f3tTsLMl6DmMvG94yhZxMAHth5hECmLfdf5vSKaUiCCVYyXDVliiyK8sfXd7voNHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032253;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fMCa4z93NcwsBtjaC+LBWD5yj/i6Vd8tccAB9380FZ8=;
	b=qgRUgo76Z6eRKWRWbeyo6fGICVnK9TZ0Rcr7R6HgaLp+CLAYFK2TKTw7P4rd4PsRlR9R
	 V2D+zPkeXT5SwECd0ye4erqEUXY7skAy/cmLZwS1ffBFgzMFuPJRYoxMsMPzGwU970+et
	 Wa86QCoNEeJk9g6AQBUwZZfK6JF8zew1OJNTYTJJbiqliwAyG5cgbWfE8AtweutYyjKpQ
	 Uw49lvFcK4XigvEpWjYohebvwpk71fM7AMILz3TmpvCiamqjWA4BasyXDssmL81auUw/W
	 GQqeb1u4T3xoGs1FRtm+GQyv5cGHaW8ZHfWpILgtGY9cswhrpmsFxmgS0eOie/feUDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793032253;
	bh=fMCa4z93NcwsBtjaC+LBWD5yj/i6Vd8tccAB9380FZ8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OFXmvhKrbK3rv7A0GJAKc14TN7CZODZi9vSkIthUjc6LPY2pwo08Ro0xwudxm+IYt
	 FSjQf6kaeBIWllodlYIOL5UWTUTpP4T5dXZZ0AeCTPr2+7By7VkMQwDnzMf9WgRxTd
	 LYEBcdsh2FUmgZEbRuAPWOsnkuXA6gFP0mO3mlm6ZPZJ3wHgUS4jFHNng5nnQUNCol
	 SEG2D7BnHC16qd8IiMbq5ZVJpvk6CUGHu07uVznw2qYYD+r/UmlA2uGaMbsg9tDp5l
	 jOGnjpEFvWSc3fBJN1CBsBTTkIW8UQgXLRrOcjw4nNhSbzBFEl87cALA5rVo5e4qly
	 baEnIIdg/5B4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B22880EBE;
	Mon, 26 Oct 2026 16:30:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D36C2D33
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8643605F7
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpsDOGHShqGn for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 16:30:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3639260612
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793032245;
 b=YojyFYRHwijpXoYN2e4/whxlwoThksJ0U/SDoexASAvbCTxQU84aWeaGeZc2LFDQvqeC
 tK8c+ZxczvRHuWA5IOMfTsQ0oXvZQR8yM4Ul0DQOrtBuGXLlez1ZVlIMEaqofXcxgP5S/
 DLB5KurLZXEvoxO7rY1WGpfnI7Nwr1xHxYHrnP6nzx7tqUFaYT/cE/QcOsTWD7rTbnLCS
 ubZwSiTxTUdN9Pw+t88mboHuYODEvrRZjZe1oA7h+Eo5fwR3pzMjeooMVNHyWKPHfLQkw
 vYnLpLm8lRtmuHk35aQ28chiLuPJhHr6OvwYkddMLACxqBMVWj1FK4VrygSB1llWBew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793032245;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=e94zEgbnTaSgJEleMv/K0Mx2ito5dL4QBfqLRIfrjCc=;
 b=omk4510vFyIu0n3ER40Ud7KXUzwckZ4NPVPIyJjJ1aVHi660Pu0d91/eoMXTrTEQ/CTy
 zdQ6rsJ37KD6D8x0zZbMG2W2B/OkKVSkZbE5kDXWhqthdrE7drC/gWWUTxhmpcsLEMsru
 q3ExDkRbius93fARqGzjMssqwd6aKF5EBp5Kj9UEaBhGF6ukYb70wyHZ+VI4XS1iYe9QX
 aFCwaTANg3aRW1cH/1ZWQUNhEdcpMv3q07JK24UCTSy05creEIBP0xosoV0j0fPB0Imeo
 1YXKWt1mCRaSBNrkiH5/kT128bK+quu1t91jUE/bKhDrwbcBrRvbWEYGoZRd5w4AteA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=exzgE6jB; 
 arc=none smtp.remote-ip=62.149.156.71
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=exzgE6jB
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3639260612
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 16:30:43 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LNaqxB7Yx6WK8LNaqxS9Jq; Mon, 26 Oct 2026 17:30:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793032240; bh=wqAZ0Nu0JAjRSiL5BY1egh7+ASXhzOmK4N3duvi8I+o=;
 h=From:To:Subject:Date:MIME-Version;
 b=exzgE6jB+prqcMhDWMXFMT9StSLMBixbDxkg5SSpIcboych1WFxjH6YgEuS2JBbAC
 z7NSDYcR9Yo9mvFwlwuqYNUd+FFSwj1FexdA9gfjwzrMNprFBhcZtRuaCvLW+cDFuo
 nf3j1a/Dii/RwD6sZN9/WAuzfNI0dePtsWCXmSJv/aRjYiKBtilovcYDnLO3owJ0wd
 sE8WCu+1yqVwbXl1gHxR5U/1CAvyF/yGevZJ+2p41oZ9Wd3cKFamBKZi3AQCrnbWd1
 U8UDSNIReFzKyc19YrDGxpdEeg1R4Y2QjKmlh0kOrvflZdImSALFunkCGbcSOLhGRK
 llFObYgAlgcZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 26 Oct 2026 17:30:37 +0100
Message-ID: <20261026163039.664191-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGjCWGsj51h1AKzdm9qXoHKawtUDN/P2ZwYYU2a4SeZEqLZu1laVuzEm1vHPfibLF3859+nOoWFAG+mh5jRG8+KD/1hx+vVFba6BdLX5/Dcpu/fvZGH2
 4zakjOtEbTAGFFFp3C8YpqivJ96MT8U+Cktt3bl13JTpQa2nJRZd3BiTZ+JGs0L7VO+ciD20qZApJdXYnSXZ31i0B7qxaCi//90sG7Q4SpZTMRMhM5XvgQA9
 OIsLREm7n0w/lFlYaDM5kUQTL/fFTzoy5pxxPusG3HF55UhVjCo9B13iFJPMaXJ3bci9kACFOlu1d+Z0q8FxY+Epzd5V4Cti851K9bZ7RLBCUNvUMzw5Y986
 ys2lyZO3ZC+05JvM1q8VGCe4Rvtjog==
Subject: [Buildroot] [PATCH v2 1/3] package/libtraceevent: bump to version
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

Add patch pending upstream:
https://lore.kernel.org/linux-trace-devel/20261026162417.646303-1-giulio.benetti@benettiengineering.com/

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.9.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* update patch pending upstream and commit log accordingly
---
 ...uild-failure-due-to-btf-on-Linux-6.0.patch | 222 ++++++++++++++++++
 package/libtraceevent/libtraceevent.hash      |   2 +-
 package/libtraceevent/libtraceevent.mk        |   2 +-
 3 files changed, 224 insertions(+), 2 deletions(-)
 create mode 100644 package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch

diff --git a/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch b/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch
new file mode 100644
index 0000000000..c5d3428c0e
--- /dev/null
+++ b/package/libtraceevent/0001-Fix-build-failure-due-to-btf-on-Linux-6.0.patch
@@ -0,0 +1,222 @@
+From ae96c2317cc4b3eb84d1d1717bfff2e370bea31e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 10 Feb 2026 17:57:52 +0100
+Subject: [PATCH] Fix build failure due to btf on Linux < 6.0
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6089fb325cf737eeb2c4d236c94697112ca860da
+enum BTF_KIND_ENUM64 has been firstly introduced and this is the latest
+BTF_KIND_* enumaration to be added to libtraceevent. So let's check
+in runtime, both in Makefile and meson, if BTF_KIND_ENUM64 does exist.
+If it's not there let's disable btf support.
+
+Upstream: https://lore.kernel.org/linux-trace-devel/20261026162417.646303-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+Co-authored-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile        | 28 +++++++++++++++++++++-------
+ src/meson.build | 12 ++++++++++++
+ src/trace-btf.c | 31 +++++++++++++++++++++++++++++--
+ 3 files changed, 62 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e1a10a0..bd88a98 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,6 +27,13 @@ $(call allow-override,PKG_CONFIG,pkg-config)
+ $(call allow-override,LD_SO_CONF_PATH,/etc/ld.so.conf.d/)
+ $(call allow-override,LDCONFIG,ldconfig)
+ 
++# Set compile option CFLAGS
++ifdef EXTRA_CFLAGS
++  CFLAGS ?= $(EXTRA_CFLAGS)
++else
++  CFLAGS ?= -g -Wall
++endif
++
+ EXT = -std=gnu99
+ INSTALL = install
+ 
+@@ -37,6 +44,20 @@ INSTALL = install
+ DESTDIR ?=
+ DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
+ 
++test-build = $(if $(shell sh -c 'echo "$(1)" | tee /tmp/t.c| \
++	$(CC) -o /dev/null -x c - > /dev/null 2>&1 && echo y'), $2)
++
++define BTF_LATEST_SOURCE
++#include <linux/btf.h>
++int main(void) { return BTF_KIND_ENUM64; }
++endef
++
++BTF_OK := $(call test-build,$(BTF_LATEST_SOURCE),y)
++
++ifneq ($(strip $(BTF_OK)), y)
++CFLAGS += -DNO_BTF
++endif
++
+ LP64 := $(shell echo __LP64__ | ${CC} ${CFLAGS} -E -x c - | tail -n 1)
+ ifeq ($(LP64), 1)
+   libdir_relative_temp = lib64
+@@ -123,13 +144,6 @@ INCLUDES = -I. -I $(srctree)/include -I $(EP_HEADERS_DIR) $(CONFIG_INCLUDES)
+ 
+ export LIBTRACEEVENT_STATIC LIBTRACEEVENT_SHARED EP_HEADERS_DIR
+ 
+-# Set compile option CFLAGS
+-ifdef EXTRA_CFLAGS
+-  CFLAGS := $(EXTRA_CFLAGS)
+-else
+-  CFLAGS := -g -Wall
+-endif
+-
+ LIBS ?= -ldl
+ export LIBS
+ 
+diff --git a/src/meson.build b/src/meson.build
+index 3a7a082..2432dd8 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -17,6 +17,18 @@ sources= [
+ cc = meson.get_compiler('c')
+ dl_dep = cc.find_library('dl')
+ 
++btf_enum64_test_code = '''
++#include <linux/btf.h>
++int main(void) {
++    int x = BTF_KIND_ENUM64;
++    return 0;
++}
++'''
++
++if not cc.compiles(btf_enum64_test_code, name : 'BTF_KIND_ENUM64 check')
++    add_project_arguments('-DNO_BTF', language : 'c')
++endif
++
+ libtraceevent = library(
+     'traceevent',
+     sources,
+diff --git a/src/trace-btf.c b/src/trace-btf.c
+index 859b086..52e933c 100644
+--- a/src/trace-btf.c
++++ b/src/trace-btf.c
+@@ -8,12 +8,13 @@
+ #include <stdlib.h>
+ #include <stdbool.h>
+ 
+-#include <linux/btf.h>
+-
+ #include "event-parse.h"
+ #include "event-utils.h"
+ #include "event-parse-local.h"
+ 
++#ifndef NO_BTF
++#include <linux/btf.h>
++
+ struct btf_header;
+ struct btf_type;
+ 
+@@ -210,17 +211,24 @@ static int load_types(struct tep_btf *btf)
+ 	qsort_r(btf->funcs, btf->nr_funcs, sizeof(btf->funcs[0]), cmp_funcs, btf);
+ 	return 0;
+ }
++#endif
+ 
+ __hidden void btf_free(struct tep_btf *btf)
+ {
++#ifdef NO_BTF
++	tep_warning("BTF not supported.\n");
++	return;
++#else
+ 	if (!btf)
+ 		return;
+ 
+ 	free(btf->types);
+ 	free(btf->funcs);
+ 	free(btf->raw_data);
++#endif
+ }
+ 
++#ifndef NO_BTF
+ static struct tep_btf *btf_init(void *raw_data, size_t data_size)
+ {
+ 	struct tep_btf *btf;
+@@ -271,6 +279,7 @@ static struct tep_btf *btf_init(void *raw_data, size_t data_size)
+ 	btf_free(btf);
+ 	return NULL;
+ }
++#endif
+ 
+ /**
+  * tep_load_btf - Load BTF information into a tep handle
+@@ -285,6 +294,10 @@ static struct tep_btf *btf_init(void *raw_data, size_t data_size)
+  */
+ int tep_load_btf(struct tep_handle *tep, void *raw_data, size_t data_size)
+ {
++#ifdef NO_BTF
++	tep_warning("BTF not supported.\n");
++	return -1;
++#else
+ 	/* If btf was already loaded, free it */
+ 	btf_free(tep->btf);
+ 
+@@ -292,8 +305,10 @@ int tep_load_btf(struct tep_handle *tep, void *raw_data, size_t data_size)
+ 	if (!tep->btf)
+ 		return -1;
+ 	return 0;
++#endif
+ }
+ 
++#ifndef NO_BTF
+ static struct btf_type *btf_get_type(struct tep_btf *btf, int id)
+ {
+ 	if (!id || id > btf->nr_types)
+@@ -457,6 +472,7 @@ static int init_btf_func(struct tep_btf *btf, struct trace_seq *s,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * tep_btf_list_args - List the arguments (type and name) for a function
+@@ -471,6 +487,10 @@ static int init_btf_func(struct tep_btf *btf, struct trace_seq *s,
+  */
+ int tep_btf_list_args(struct tep_handle *tep, struct trace_seq *s, const char *func)
+ {
++#ifdef NO_BTF
++	tep_warning("BTF not supported.\n");
++	return -1;
++#else
+ 	struct tep_btf *btf = tep->btf;
+ 	struct btf_type *type = tep_btf_find_func(btf, func);
+ 	struct btf_param *param;
+@@ -520,6 +540,7 @@ int tep_btf_list_args(struct tep_handle *tep, struct trace_seq *s, const char *f
+ 			trace_seq_printf(s, "%s", param_name);
+ 	}
+ 	return p;
++#endif
+ }
+ 
+ /**
+@@ -543,6 +564,11 @@ int tep_btf_list_args(struct tep_handle *tep, struct trace_seq *s, const char *f
+ int tep_btf_print_args(struct tep_handle *tep, struct trace_seq *s, void *args,
+ 		       int nmem, int size, const char *func)
+ {
++#ifdef NO_BTF
++	tep_warning("BTF not supported. Args:\n"
++		    "args: %08x, nmem: %d, size: %d, func: %08x\n");
++	return -1;
++#else
+ 	struct tep_btf *btf = tep->btf;
+ 	struct btf_type *type = tep_btf_find_func(btf, func);
+ 	struct btf_param *param;
+@@ -646,4 +672,5 @@ int tep_btf_print_args(struct tep_handle *tep, struct trace_seq *s, void *args,
+ 		}
+ 	}
+ 	return 0;
++#endif
+ }
+-- 
+2.47.3
+
diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index 890e1294e6..41e130f35e 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  cec7167e885d2f022bc5a2b0f2c0c58110fa0575e5dba49d7b694f0a6fd7fa0c  libtraceevent-1.8.7.tar.gz
+sha256  3bc19dd940914260ba591b5276723bf84bb43f82c7c3d4267622bee4d016ea55  libtraceevent-1.9.1.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index d0de336de0..29a3c26c27 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.7
+LIBTRACEEVENT_VERSION = 1.9.1
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
