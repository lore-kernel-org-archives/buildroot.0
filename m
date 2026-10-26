Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570EF606A32E
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i2cmrx1E
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71583809B0;
	Mon, 26 Oct 2026 19:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFuQsq_FZevv; Mon, 26 Oct 2026 19:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E13980BC0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043920;
	b=iqgvIWPi8BC8J3e39ZkjA/uRp4dmAaNawjZgmc09FBk1sNesTuEupf9meoag6iHcCs2F
	 L94S13dVeFEwlTaqGNS63zJvouSvnj2/xbjm159xDDvyqEhgB8XgFXqfvol2eERWpP8uf
	 FFsU/7e07n+Daa6/j+n3+X+avwbd2BGwsd9GNI3MVkF7P5BPakk2jLjW8JiX4rbAiTx/k
	 tQ6UW6DMSMj2C0lHgKEy8o7bShEUo0IB0rl8jG1LDUv8S7rDdfepbXVu9zUaQ09VmyeRw
	 VsdDEdcdl46h9HomxSPyXNtE+HYB9hYZ3SdrmvCMMsbatNuqP28jk2YrUS2BpUmGdPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O5bEXbwuEVV28dV0zxye9zqYLeXweB4qrWn/Zz0klUM=;
	b=R9xsrK6No/luZ23MWsBOrusgZm/zozrPTLJg9ZOqtcMp04thwT3DUmzvuqR3m3Rz+7vR
	 apT95wAbfk2VIZalC26L7m7opdwml1ZuUdoMF+qZ8QljRciuA3aFBxkiDvemFcOTa1kQn
	 XkSlaywVUiWUbE2E1mnix6gGKproe04SDqVWvaLtk5BzJH/I7nlh8x4oNjqGy+SI+gHnw
	 QLBaBq6hgH4P9d4AcIyVgzw/498mhY1cDwaIbVFne+3mDIAPEBLU0RXUxRh+0hlRJKHSK
	 +VC7FL1+C9zMcrxsvL9lOVYEZCPBOqPuO7aSapKzvjYRFGNBRl/w5bI9NEfeIrz+N4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043920;
	bh=O5bEXbwuEVV28dV0zxye9zqYLeXweB4qrWn/Zz0klUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i2cmrx1E+WlUWo4ApSGEzwbvxSDQPukffwEIA1+nCCwjL8mf9Qx1eF5MruhuPkYQ4
	 aAkvAB3Cce2LcWa/KMe25vITSD2zqjZKIpVSLGjJamO9FHX8+LkQotL8RFnN4emJvU
	 1ZZFKkBFXD5d2miJ9ZDKvh2Xy/zxHl/5CG6qE9jI+pZzh8wetw+2lEKsGf7rDYl447
	 rN0ejTr7kiE+gZMQ+pCY/12GHLH6j2mVBVWX+j+YJaPpSefDUU0QI/9mn+P3+W5Mlk
	 pyGNbw0OMDIb2H+9KTFYmyK4KOrEeAB6FXFduOScVgsBBVc6P5U/Sm9sV33w+seXqH
	 m91oflm0BpCYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E13980BC0;
	Mon, 26 Oct 2026 19:45:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F8E84BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9DB480BC0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GneE51L_SSLo for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1B81809B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043914;
 b=Z6hGEKAIiv6917D7CJRfDI8XpGIbVUF3/9Mv2AFgkbauiYBD9qcVULtbxtKG4JjfmEDr
 X1j/1I0WGkfbdXVs3lJOKTiiOp5xttgyE0JMEfjLQd7+HN2NwU8v8CtYTa0RadGDvkPqM
 PetlZkRazf9nQF3FGQQDXdNPV1T3VczdUK7ppFAkRB6Owelwyq1l+NbEGrqXXOG/6PECS
 6/RV9qJbZxN6k0FIOahNQUiu0wJ2Fzi/CyV2ZBjhDzDEutT6RvnWp4IQg8fCoss4f529z
 3tX+Cl3SqNdbqIMsrPufE9rGZ1heBYLiqCqVp+kd/709WbjmJ2Hb/lMzdkUdwZcrjkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043914;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CLLRZTJKVbFcdCdnD+fCK65htgBikaF7RWO8oN4S9as=;
 b=lQLBlRYwWzPUXwAyggA9GDpxIBQXroeGBfVr5uOKUl4VydwHF0+2FNhZQc1lc1wDN32i
 oNKRQB6ZzXMs8/ymRK9e0AQsqm68ykIOSOpxN/zYvJItJvV2WwM9QAPfUM60zo4JqbhSH
 GOzo4Vd4gmkoSjxWiM4Qe6hJgsKjRjFRdWrXVeIYyAubw/RX7QuWhLuN7l3uvXMpXB898
 sAiDwvXFO08BoHMRA2KVNP+6CX+kMqfnkmyg0wrBV7r7tLzonuUjcuyuyUJa1c5AvXY2s
 tdbf4q6lPon0A8VaMuJknmLJOqoGxlUi670F0WYZtH3/UDlwjUn56471rjw92/bL3pQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B81809B0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969B59CFC3; Mon, 26 Oct 2026 19:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 20:33:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd9e6cec44ca44ab53909c12bada01621024925d
X-Git-Newrev: c91a70c6520fcebbcabd5644a06bdd223a49eb41
X-Patchwork-Hint: ignore
Message-Id: <20261026194348.969B59CFC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtraceevent: bump to version
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c91a70c6520fcebbcabd5644a06bdd223a49eb41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add patch pending upstream:
https://lore.kernel.org/linux-trace-devel/20261026162417.646303-1-giulio.benetti@benettiengineering.com/

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.9.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Fix-build-failure-due-to-btf-on-Linux-6.0.patch | 222 +++++++++++++++++++++
 package/libtraceevent/libtraceevent.hash           |   2 +-
 package/libtraceevent/libtraceevent.mk             |   2 +-
 3 files changed, 224 insertions(+), 2 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
