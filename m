Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E9606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=heZdunAo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65AA81399;
	Wed, 11 Nov 2026 13:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm0_7tyUZYPH; Wed, 11 Nov 2026 13:19:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E657D81351
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794403175;
	b=s4dp4O4Fnp/9FcChEa9HWxVb4MDcE4HFnwAPGxEtwDJ2i4Sp/fijxFpKAjIvxP5MkP+e
	 DnzRmPVLDv9+TaUVflHeSU8nFq7i/luR1d7ezM/xJ59AiElOEze1XPAYMF3HiiCZPQvgp
	 m86rVtUFq7I8Q6TzkEiW745Xd6jceJT4HUk5pY1FF74N6kYxNAZEfmn61kr8IkLHEStHV
	 3H8I1cHAK33NKa67M6d6INBl12PAfqFhcw3XjE7uDYvv/t/oXj04V7bfatsua64/6DKkI
	 41+jSCbX7N51wHqfPpUvbxpFfMSR4gBtdQJS/A425jUqGNyMjN9RAdU7/IB4goiMbxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794403175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=waZ4I7tmaw1F3KmhLLPogEOJ3eSUBEDhXqKR8HTz/M8=;
	b=ggzhuj5ms17cvusc3Xe4V9A5TLFwaX5D06Dj1sHjjm3yF8jUyB7f4Qv5SXZKsZSC4qik
	 n6XdN+AUr0SO1VbGhbp+nMGFl50CV2CH9Fsz6V6CNhyio4DjrehtyeU7CfKMzDTatxNYw
	 5ClAd6PT4MzHo6bIhJJuPxGoYFQjjEAkn8VuTaoOeOoxo/eJDzwGj3uwQT9SYI9eLW/kb
	 RmjeZQDuBc2n7t5Jw66/XcNpBCamXLc23nrxPDOSjrmLd0jNCy491Zpf1pHy0OYosb1az
	 Tr+AFfdECU3dgLQrdpkVcXRu2NcoclplDVzBLC1vsOH4Y8Vaf/nm+343JqAmmqAZSQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794403175;
	bh=waZ4I7tmaw1F3KmhLLPogEOJ3eSUBEDhXqKR8HTz/M8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=heZdunAo12H5uxaxZqwOzcPcGGXHZGc+bcPNodcFmwn1fVLIR9BxpneZrT6jjjSkb
	 2/hzgw1VYx+oRloPrNpOLgHp1VcwZMZQzaR+QCG+OOvx08ODP1gSGsynirisOnsXlz
	 OnQnSwjWJNWD7cWKx4W2chGwZ0JvIAi4Ruc5W4Dg49pP5JftQN4lw0G0wcbZv6vSQf
	 yEMrC1rZkpPbUEYWwyhbgKk9ewRhDtYpU7EIYd2etHRaeePEUqiQnew40QiCCA9t/5
	 +jGfkzAI+HPYMrdJsTkN0Srrx4dW+fScXImyg6h6gz6hI5tUWTv7A3V/8vW6lehKOl
	 DGDCUoU8blnvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E657D81351;
	Wed, 11 Nov 2026 13:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B94731F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9491C6079B
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCYQaqNOt_V1 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 13:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA8E660793
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA8E660793
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 13:19:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b58cb69927so4928043a12.0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 05:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794403167; x=1795007967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+KFTCFaJuC/16qCqk2AyGGJwr6RZ1+04Cf1h7VdEAIs=;
 b=LdhaZLB2A3pDbqGDyR+siQN0NHyp9WaL6CBhPLmw2ugSOfn4sXasdAmqg4ljaX9v3i
 wpDIp3hF66Abddp4EVkxc+P0siusW+Xj5IRleM4fBzpxrktbHo881le1TB5PWHEbFoGk
 KkS55lOX2t2LPyleeGn9Dl/XD87RUm+ZOfSdThnHebPyPh5TGCJ35bkaEFAMxFnhvBUQ
 MApGGf9ZZpGLqCqVzDgRumhqIflU3rfE1yz65fZFZ4CzDemxN4Dbt0To8u3HYEVxI6PS
 VoAuQ4kbD08ZrLUHrj1N0K5vZ0bxJO86M3Tqurt3H6nW9WA2nZEhg8O+60akbBY13eMY
 VKcA==
X-Gm-Message-State: APuU4Z+K+KQcQt9UR/VBYE9aED8M0Ww1moSI8f2EqGcdmD8ERd1BBQ0N
 DJyAuqkd0AXMCB/ZjDOgBoZDphdWy3WgUIxpasyS+ziwtq2NTO02LM7knKsiBQ==
X-Gm-Gg: AYBFou0mWPhMcRCXcDNIFhc7+G001pkrAUk/VsjfLm1PKqD/Gv1eKjVfvNH6F72zSTp
 UX2P5HT3Uz3fC6xXsJiAN3J04Jxp3W9d1OV2BJUs1UoUw7w653XuUELJMoqYzvWrRDa7IJipw7V
 uWc7eP9uDKILkElO7amaSXKC5ZeNE2xDICvsNVi5X2SjbDcdqfNgnurKHdh0tE6+nPHXnx8hrK/
 FqS3rHPVQ514YqkKcHvFwuM7WGe4pBAp3xZi+NQC+jN/QXVMDzE6JY2ZLi155iJBHkzTjho31WV
 FeNbpP1/WenMTgXaNXuY5eeqUIafBSttsm6eMpY3/Ft6lQmDurg1ZqY6hCzg6zfo406SLlhDtt0
 0jHORinCNfByV9fAPVjKGSDz4sYLsGPYHZCVbcdrMgXD2VAzK5O2bWbnXqxtaMZbKZLIu4n3cpr
 /FXE5+F0LoH9nxCbFFKygWIaTg3FhqFWBLbe/RwnPf6W2hYvvSJT24WOTSt1hiykCUE+jypkRdk
 Bmejz5DfSmrnz/FkyKhu5X0GvXBU1QuRc08n/4u9d/lr9HL1oHCavQXMykY309igB+W1chgTBOz
 oixzZPr/AyXuElTmbkmZLyHtfumaXsMGuF9gf6I6AgO48qGrZ5WV8qHyK1MPNIY7bV2PbAX3sZU
 YPRsRT+UG
X-Received: by 2002:a17:907:9346:b0:c42:fc8b:6c6a with SMTP id
 a640c23a62f3a-c5066b1d8bamr190761266b.14.1794403167016; 
 Wed, 11 Nov 2026 05:19:27 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a649875sm229108366b.64.2026.11.11.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:19:26 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 14:19:26 +0100
Message-Id: <20261111131926.1182237-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/binutils: fix target build with
 static-only uClibc-ng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since binutils 2.46, ld/plugin.c is built unconditionally, even with
--disable-plugins (which Buildroot passes when BR2_STATIC_LIBS=y). It
uses dlopen(), dlsym() and dlclose(), but uClibc-ng does not install
<dlfcn.h> when built without shared library support, so the target
binutils build fails:

plugin.c: In function 'plugin_opt_plugin':
plugin.c:252:23: error: implicit declaration of function 'dlopen'; did you mean 'open'? [-Wimplicit-function-declaration]
  252 |   newplug->dlhandle = dlopen (plugin, RTLD_NOW);
      |                       ^~~~~~
plugin.c:252:39: error: 'RTLD_NOW' undeclared (first use in this function)

Backport upstream commit 2de4446d9090 ("PR 34985, ld fails to build on
hosts without <dlfcn.h>"), using its cherry-picks to the 2.46 and 2.47
branches. It wraps the plugin code in ld/plugin.c in
#if BFD_SUPPORTS_PLUGINS again and provides no-op stubs otherwise.

This issue has been present since commit 101997e334ef ("package/binutils:
add support for binutils 2.46.0"), as upstream commit 7e432e93f8aa
("Limit BFD_SUPPORTS_PLUGINS check to plugin.h and targets.c"), first
released in 2.46, removed the BFD_SUPPORTS_PLUGINS guard around the
contents of ld/plugin.c. It therefore affects 2026.05 and later. The
2026.02.x LTS branch only provides binutils <= 2.45 and is not affected.

Fixes:
https://autobuild.buildroot.org/results/ee94fc7c8d5d76a8f359ee35fb03bc6dfc82986c

Fixes: 101997e334efcbfd9bde3100ae75400177cfa56f ("package/binutils: add support for binutils 2.46.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ls-to-build-on-hosts-without-dlfcn.h.patch | 151 ++++++++++++++++++
 ...ls-to-build-on-hosts-without-dlfcn.h.patch | 151 ++++++++++++++++++
 2 files changed, 302 insertions(+)
 create mode 100644 package/binutils/2.46.1/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch
 create mode 100644 package/binutils/2.47/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch

diff --git a/package/binutils/2.46.1/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch b/package/binutils/2.46.1/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch
new file mode 100644
index 0000000000..b80dc7053b
--- /dev/null
+++ b/package/binutils/2.46.1/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch
@@ -0,0 +1,151 @@
+From 26cbc9934d22a8abba8196cd9b3d9c4e0456bc90 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 11 Nov 2026 10:36:44 +1030
+Subject: [PATCH] PR 34985, ld fails to build on hosts without <dlfcn.h>
+
+ld/
+	* plugin.c: Wrap existing functions in #if BFD_SUPPORTS_PLUGINS.
+	Provide do-nothin stubs for !BFD_SUPPORTS_PLUGINS.
+binutils/
+	* testsuite/binutils-all/x86-64/x86-64.exp (run_pr33198_test):
+	Return "untested" rather than "fail" when no plugin support.
+	Differentiate failure messages.
+
+(cherry picked from commit 2de4446d9090b5773c863ab7bbdd95a5d4f81367)
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=26cbc9934d22a8abba8196cd9b3d9c4e0456bc90
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ .../testsuite/binutils-all/x86-64/x86-64.exp  | 14 +++--
+ ld/plugin.c                                   | 51 +++++++++++++++++--
+ 2 files changed, 56 insertions(+), 9 deletions(-)
+
+diff --git a/binutils/testsuite/binutils-all/x86-64/x86-64.exp b/binutils/testsuite/binutils-all/x86-64/x86-64.exp
+index 162030e5aea..823c12efdde 100644
+--- a/binutils/testsuite/binutils-all/x86-64/x86-64.exp
++++ b/binutils/testsuite/binutils-all/x86-64/x86-64.exp
+@@ -145,7 +145,11 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname ($obj)"
++	if [regexp ".* without plugin support" $got] then {
++	    untested "$testname (nm $obj)"
++	} else {
++	    fail "$testname (nm $obj)"
++	}
+ 	return
+     }
+ 
+@@ -181,7 +185,7 @@ proc run_pr33198_test { fat strip_flags } {
+ 	if [regexp "\.llvm\.lto *LLVM_LTO *" $got] then {
+ 	    send_log "$got\n"
+ 	    verbose "$got" 1
+-	    fail "$testname (strip $obj)"
++	    fail "$testname (nm stripped $obj)"
+ 	    return
+ 	}
+     }
+@@ -206,7 +210,7 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname ($archive)"
++	fail "$testname (nm $archive)"
+ 	return
+     }
+ 
+@@ -230,7 +234,7 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname (strip $archive)"
++	fail "$testname (nm strip $archive)"
+ 	return
+     }
+ 
+@@ -242,7 +246,7 @@ proc run_pr33198_test { fat strip_flags } {
+ 	if [regexp "\.llvm\.lto *LLVM_LTO *" $got] then {
+ 	    send_log "$got\n"
+ 	    verbose "$got" 1
+-	    fail "$testname (strip $archive)"
++	    fail "$testname (readelf strip $archive)"
+ 	    return
+ 	}
+     }
+diff --git a/ld/plugin.c b/ld/plugin.c
+index 1cf5c915b00..9dd97728d79 100644
+--- a/ld/plugin.c
++++ b/ld/plugin.c
+@@ -59,6 +59,12 @@ extern int errno;
+ /* Report plugin symbols.  */
+ bool report_plugin_symbols;
+ 
++/* Set at all symbols read time, to avoid recursively offering the plugin
++   its own newly-added input files and libs to claim.  */
++bool no_more_claiming = false;
++
++#if BFD_SUPPORTS_PLUGINS
++
+ /* The suffix to append to the name of the real (claimed) object file
+    when generating a dummy BFD to hold the IR symbols sent from the
+    plugin.  For cosmetic use only; appears in maps, crefs etc.  */
+@@ -141,10 +147,6 @@ static bool orig_notice_all;
+ static const struct bfd_link_callbacks *orig_callbacks;
+ static struct bfd_link_callbacks plugin_callbacks;
+ 
+-/* Set at all symbols read time, to avoid recursively offering the plugin
+-   its own newly-added input files and libs to claim.  */
+-bool no_more_claiming = false;
+-
+ #if HAVE_MMAP && HAVE_GETPAGESIZE
+ /* Page size used by mmap.  */
+ static off_t plugin_pagesize;
+@@ -1540,3 +1542,44 @@ plugin_notice (struct bfd_link_info *info,
+ 				      abfd, section, value, flags);
+   return true;
+ }
++
++#else /* !BFD_SUPPORTS_PLUGINS */
++
++void
++plugin_opt_plugin (const char *plugin ATTRIBUTE_UNUSED)
++{
++}
++
++int
++plugin_opt_plugin_arg (const char *arg ATTRIBUTE_UNUSED)
++{
++  return 0;
++}
++
++void
++plugin_load_plugins (void)
++{
++}
++
++const char *
++plugin_error_plugin (void)
++{
++  return "";
++}
++
++void
++plugin_maybe_claim (lang_input_statement_type *entry ATTRIBUTE_UNUSED)
++{
++}
++
++int
++plugin_call_all_symbols_read (void)
++{
++  return 0;
++}
++
++void
++plugin_call_cleanup (void)
++{
++}
++#endif /* !BFD_SUPPORTS_PLUGINS */
+-- 
+2.43.7
+
diff --git a/package/binutils/2.47/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch b/package/binutils/2.47/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch
new file mode 100644
index 0000000000..56ae9ef168
--- /dev/null
+++ b/package/binutils/2.47/0003-PR-34985-ld-fails-to-build-on-hosts-without-dlfcn.h.patch
@@ -0,0 +1,151 @@
+From ecb1a294cd77f06d5b1bf88054749f192ee40761 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 11 Nov 2026 10:36:44 +1030
+Subject: [PATCH] PR 34985, ld fails to build on hosts without <dlfcn.h>
+
+ld/
+	* plugin.c: Wrap existing functions in #if BFD_SUPPORTS_PLUGINS.
+	Provide do-nothin stubs for !BFD_SUPPORTS_PLUGINS.
+binutils/
+	* testsuite/binutils-all/x86-64/x86-64.exp (run_pr33198_test):
+	Return "untested" rather than "fail" when no plugin support.
+	Differentiate failure messages.
+
+(cherry picked from commit 2de4446d9090b5773c863ab7bbdd95a5d4f81367)
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ecb1a294cd77f06d5b1bf88054749f192ee40761
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ .../testsuite/binutils-all/x86-64/x86-64.exp  | 14 +++--
+ ld/plugin.c                                   | 51 +++++++++++++++++--
+ 2 files changed, 56 insertions(+), 9 deletions(-)
+
+diff --git a/binutils/testsuite/binutils-all/x86-64/x86-64.exp b/binutils/testsuite/binutils-all/x86-64/x86-64.exp
+index bb187b5805f..dbeacdc1d47 100644
+--- a/binutils/testsuite/binutils-all/x86-64/x86-64.exp
++++ b/binutils/testsuite/binutils-all/x86-64/x86-64.exp
+@@ -147,7 +147,11 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname ($obj)"
++	if [regexp ".* without plugin support" $got] then {
++	    untested "$testname (nm $obj)"
++	} else {
++	    fail "$testname (nm $obj)"
++	}
+ 	return
+     }
+ 
+@@ -183,7 +187,7 @@ proc run_pr33198_test { fat strip_flags } {
+ 	if [regexp "\.llvm\.lto *LLVM_LTO *" $got] then {
+ 	    send_log "$got\n"
+ 	    verbose "$got" 1
+-	    fail "$testname (strip $obj)"
++	    fail "$testname (nm stripped $obj)"
+ 	    return
+ 	}
+     }
+@@ -208,7 +212,7 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname ($archive)"
++	fail "$testname (nm $archive)"
+ 	return
+     }
+ 
+@@ -232,7 +236,7 @@ proc run_pr33198_test { fat strip_flags } {
+     if ![regexp "0+ T foo" $got] then {
+ 	send_log "$got\n"
+ 	verbose "$got" 1
+-	fail "$testname (strip $archive)"
++	fail "$testname (nm strip $archive)"
+ 	return
+     }
+ 
+@@ -244,7 +248,7 @@ proc run_pr33198_test { fat strip_flags } {
+ 	if [regexp "\.llvm\.lto *LLVM_LTO *" $got] then {
+ 	    send_log "$got\n"
+ 	    verbose "$got" 1
+-	    fail "$testname (strip $archive)"
++	    fail "$testname (readelf strip $archive)"
+ 	    return
+ 	}
+     }
+diff --git a/ld/plugin.c b/ld/plugin.c
+index 1cf5c915b00..9dd97728d79 100644
+--- a/ld/plugin.c
++++ b/ld/plugin.c
+@@ -59,6 +59,12 @@ extern int errno;
+ /* Report plugin symbols.  */
+ bool report_plugin_symbols;
+ 
++/* Set at all symbols read time, to avoid recursively offering the plugin
++   its own newly-added input files and libs to claim.  */
++bool no_more_claiming = false;
++
++#if BFD_SUPPORTS_PLUGINS
++
+ /* The suffix to append to the name of the real (claimed) object file
+    when generating a dummy BFD to hold the IR symbols sent from the
+    plugin.  For cosmetic use only; appears in maps, crefs etc.  */
+@@ -141,10 +147,6 @@ static bool orig_notice_all;
+ static const struct bfd_link_callbacks *orig_callbacks;
+ static struct bfd_link_callbacks plugin_callbacks;
+ 
+-/* Set at all symbols read time, to avoid recursively offering the plugin
+-   its own newly-added input files and libs to claim.  */
+-bool no_more_claiming = false;
+-
+ #if HAVE_MMAP && HAVE_GETPAGESIZE
+ /* Page size used by mmap.  */
+ static off_t plugin_pagesize;
+@@ -1540,3 +1542,44 @@ plugin_notice (struct bfd_link_info *info,
+ 				      abfd, section, value, flags);
+   return true;
+ }
++
++#else /* !BFD_SUPPORTS_PLUGINS */
++
++void
++plugin_opt_plugin (const char *plugin ATTRIBUTE_UNUSED)
++{
++}
++
++int
++plugin_opt_plugin_arg (const char *arg ATTRIBUTE_UNUSED)
++{
++  return 0;
++}
++
++void
++plugin_load_plugins (void)
++{
++}
++
++const char *
++plugin_error_plugin (void)
++{
++  return "";
++}
++
++void
++plugin_maybe_claim (lang_input_statement_type *entry ATTRIBUTE_UNUSED)
++{
++}
++
++int
++plugin_call_all_symbols_read (void)
++{
++  return 0;
++}
++
++void
++plugin_call_cleanup (void)
++{
++}
++#endif /* !BFD_SUPPORTS_PLUGINS */
+-- 
+2.43.7
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
