Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB76C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5BE60F48
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D5BE60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 740CE406A6;
	Wed,  4 Aug 2021 01:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBZwslBWzyKd; Wed,  4 Aug 2021 01:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B551406A5;
	Wed,  4 Aug 2021 01:23:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 977271BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 22:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 848F0403FF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 22:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id su4XUgSDVL8t for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 22:48:12 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3C934037A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 22:48:11 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id B35vmpV5yp6qUB35vm9Tpp; Wed, 04 Aug 2021 00:41:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628030467; bh=IiRRyWYSs+4kYkkVNzo5lMcLf2bLFa35IUwSXHXRYKg=;
 h=From:To:Subject:Date:MIME-Version;
 b=QqLj3yvdgaie+/OTqauktpWb1dXvo3mgfGF/OIAWl2N77g2+A9BibI54cVZMhtZm8
 EdxVn8y3GSX5SrZ5f8knkEZizFECZHWmkaD0IfM6IRIRSuJCAhXpaMoP6XQL27lufW
 BmNe6jJdFvf8ZkfPicXURocIehGXgwcbJIY/TiUf7cle52RU66CGm8Qu21yeWa3bCd
 B65+Rb9GfI3dwQjqS5GfJEHpH/toeo1D+zTQqsciDrZpFyxfwqK3Z/ADhiPis6LLJS
 LVXsSXIRU2r+lvu53pzJS3lL0TZAfHyPN62J4Piz1L6nWAoqVdYXdX8o5O9zh321pb
 pz6sd9kLbLfUA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 00:41:06 +0200
Message-Id: <20210803224106.1619032-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDx/wU4Ze/KM37VYyfu2A7EhCTgubxDvKymmUF8GUTeNJLRpULaactZr5oGqOgjIQpn5LYKNhf2GhZI94hnd8gs2K47gZQ3br/kAarFCxKkN1PPIQa3D
 7pdtRwE8rsgslVX+rNWXmFZdIUpDCaeqa3hjZndVDC4fbj8GMEIXpUbiulnKjEprMJ7jGNXIjqhwjlyUanPvR9xFVfC1sIZ6zDqHXtJHt2jKjS9w+GIBKEK4
 GcqPsNpDoyAkBXHZsQ8nnog07rZNh/2GfrrRVJ2uMzrx8p7TmmRWf5CagXI/EjmB
Subject: [Buildroot] [PATCH] package/libfuse3: fix build failure on
 Microblaze due to wrong symver attribute detection
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add a patch to fix symver wrong detection. As explained into the patch
pending upstream[1] __has attribute() gives false positive when an
attribute is not supported[2] and this leads to assuming symver attribute
is present but it's not. This consequentely leads to build failure. I.e.
Microblaze doesn't really support it since it doesn't include include
elfos.h in config.gcc that determine symver to be available.

[1]: https://github.com/libfuse/libfuse/pull/620
[2]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...on.build-fix-wrong-.symver-detection.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch

diff --git a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
new file mode 100644
index 0000000000..da20c26f19
--- /dev/null
+++ b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
@@ -0,0 +1,61 @@
+From 3aba09a5c56e017746c5c1652dbc845f4db7374a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 3 Aug 2021 23:39:46 +0200
+Subject: [PATCH] meson.build: fix wrong .symver detection
+
+As pointed here [1] __has_attribute() is broken for many attributes and
+if it doesn't support the specific attribute it returns true, so we
+can't really rely on that for this check. This lead to Buildroot
+libfuse3 build failure [2] where that shows up with:
+```
+error: symver is only supported on ELF platforms
+```
+Indeed Microblaze doesn't support ELF since it doesn't include elfos.h,
+but __has_attribute(symver) returns true.
+
+So let's substitute the #ifdef __has_attribute() with a stronger test on
+a function foo() with __attribute__((symver ("test@TEST"))).
+
+[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
+[2]: http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f/build-end.log
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index b0250ee..a7281f3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -96,20 +96,18 @@ endif
+ # to have __has_attribute, then they are too old to support symver)
+ # other compilers might not have __has_attribute, but in those cases
+ # it is safe for this check to fail and for us to fallback to the old _asm_
+-# method for symver
++# method for symver. Anyway the attributes not supported by __has_attribute()
++# unfortunately return true giving a false positive. So let's try to build
++# using __attribute__ ((symver )) and see the result.
+ code = '''
+-#if defined __has_attribute
+-# if !__has_attribute (symver)
+-# error symver attribute not supported
+-# endif
+-#else
+-#error __has_attribute not defined, assume we do not have symver
+-#endif
++__attribute__ ((symver ("test@TEST")))
++void foo(void) {
++}
+ 
+ int main(void) {
+     return 0;
+ }'''
+-if cc.compiles(code, args: [ '-O0', '-c'])
++if cc.compiles(code, args: [ '-O0', '-c', '-Werror'])
+      message('Compiler supports symver attribute')
+      add_project_arguments('-DHAVE_SYMVER_ATTRIBUTE', language: 'c')
+ else
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
