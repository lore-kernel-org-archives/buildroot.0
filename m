Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A3CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70E38104B;
	Sat, 10 Oct 2026 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_JVWc2EJxOi; Sat, 10 Oct 2026 16:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB2B68104F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649548;
	b=gDCGZOtmUjD8D1YZPjZ0QV3HcuwfkefpI3lu4b/f3RO04Bw3n4W8KzbCWINNaAY+RRLL
	 ryYoSjpyxamtu8gKKWyK9oWceWIjl16sorio97JoJa8d44NVRh4ab2pLRQ0Vps38WWapy
	 mo8Qc+EJLn+lROWaVm6puP5Ct8bVBd2VDqbCdaTknOB5UkOvIWar1sNXrGOBs4DSuIn7q
	 JBcoL51K16a2vVN/ZGz5qFdbGfPtX0c27+2z23duoBAIqYcTBQw1QkuWhbpgCi+zN1ZsU
	 vZQo8GKyYWEId0McA1LdZu8N+E6QuAEWmXJurv7UhJxZz+GoH6tLeBwK14a8iviMOVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eutWPMVkQsyaspTLTM+6TBwIut00MDuSJB1JWY8x/l4=;
	b=offWgg27xqifoiJVhb63rZDT6jsvmClOW5aCApLeQTnNhP5ORkoi8y9uRPzf8oKrkTRI
	 15CU9ZTaKd0ys0vwHGps4cKYyc9UsGNJ2zmUWMSBLvdXplH1rtb7r1h1sUIMcSPu43nNt
	 FGAEENTcEc6UCrBPrtyxhOPf3SLckZndBh7c9gS/Urd2ULJ3ZU6K0Q2Dv+LO9QJc6dDcI
	 A5z7N75hBfmDwwcMiui/LSUhoS0W/Bkx/D2xxa/uaVtpvXMOlmCiUaZ2JxgHzYViF2wLk
	 p1pQ6BpgZi/7t1fWJBifoAFCkKWW0TKOoswp5pNd3ROQdVouanNwqR0aSLCqneK18Aw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649548;
	bh=eutWPMVkQsyaspTLTM+6TBwIut00MDuSJB1JWY8x/l4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e8RNw9g5Zqe0NHBQie/5rPCiQBiGDCGNhYUk9G2JnnoAx7/mtE++InkkMdPvcKYLQ
	 2ATIYBlDHXaULeLQWYsl8jBTn3mL3csqX97f3blXZN90VB1NiQj7K8V7pQA6dUc59r
	 zijGvczWJOWHqtYVafFkLoPXwZPShOXc9NaohSnA+2UkxI+sbHNp1acVsL66+rdhhI
	 ZSDAcSiM/9g1qoO82i6e4QbS0KH+p5ml3GxE5Hq3VAR4GBHnxAc3w9CELfjgh38K6J
	 YIbIkA74UL/cJZqAYKGtes/B5j/I5oPv1Fk2ykgARQls11Dk52j6MgXu0ONep9JVPN
	 AQQpVkHUqS9Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB2B68104F;
	Sat, 10 Oct 2026 16:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A67E156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E6940004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADyIhy3-wMvY for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E60E24005E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649546;
 b=IZtrEtnq9G2REGwgTSBeIYx+2qizHoSy4qvT9WCzt4JubNH1CX0V31fU7+gooIvvpZvJ
 75ETlE+Y5pERpKbEualU+QqOEPvUE4y010YQKr2Q3ZR8bsqU8dN9YCNETcfxTAnug/V1G
 vAc48ZnoFLopQ4Pru28wyoIXGY5Ns/v3qr0Xm49/L14n0OS5+31omQbWMnAXgnia47QNx
 bsjRvht2BjbTdN3zSXcAsjsXUFGK9DIzHIb3oyiYaMAmMMW4kf3UQi+Ycfk/w49FJW7Sm
 GwaHKrEem87mgQvpUFQk+NTABF9CWXjU+yqxygGETfElXudS3/4lTyE0vQdmBXfKjTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649546;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aj8BDo52Nqdnr7AYZgpWpl6fuFNHnAyZFYqO1MSQXKo=;
 b=ElRHVPHYNTXFg3q3tZZWfpNXNt9TWOSdYcbBItNXGT1l2BQUR6NHSElgVK1Fo45ys9Do
 k28juP7YnCXpNrBdw+XKTL0FHm4fzU6z1h0+zj+8wc82CLrW8KQTHdLlfWJyZ4okkrQbq
 P/zbMpKIDhej+GOkhbOhvo7CEA4/fZ1VFtJ2CGGuSn3LzHmcKHiE5DAOZhtlWC/ltbQFf
 FM7J4JQfbjOrtRvAhDWlPNfhVV5LK3RH40zW4yvD4vqF8IPqpCqi4jGXvcwvasp/07hCx
 AfXBaMt3LHzRpLDuAlL2h45eEmoaWYTIjw3bhFaa8/qorUim1IDnzDWNW0qdbWxyTow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E60E24005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:25:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B2E1923BA; Sat, 10 Oct 2026 16:24:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:25:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7fa5c2d0183ba400d18bceb28a7aec49468d8cd
X-Git-Newrev: 99909a8a955dc6ba89aaa72e488e8c262ad2f469
X-Patchwork-Hint: ignore
Message-Id: <20261010162428.9B2E1923BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: fix musl build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99909a8a955dc6ba89aaa72e488e8c262ad2f469
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump to version 2.13.0 in Buildroot commit [1],
atop fails to build with musl:

drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]

(Before 2.13.0, the same configurations already failed earlier on
uClibc because _POSIX_C_SOURCE was defined without a value. Upstream
fixed that in 2.13.0 by giving it an explicit value, but the same
pattern remains for _XOPEN_SOURCE.)

ncurses only declares its wide-character API, including waddwstr(),
when NCURSES_WIDECHAR is set. If the application does not set it,
curses.h derives it from the feature test macros:

  #if defined(_XOPEN_SOURCE_EXTENDED) || \
      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))

drawbar.c defines _XOPEN_SOURCE with an empty value, which makes the
check evaluate as 0 >= 500 and fail.

This only breaks with musl because of the C library's <features.h>,
which curses.h pulls in through <stdio.h> before doing the check.
glibc and uClibc both redefine _XOPEN_SOURCE to 700 and define
_XOPEN_SOURCE_EXTENDED whenever _GNU_SOURCE is set, which drawbar.c
does, so the empty definition gets fixed up. musl never modifies the
application's feature test macros, so the empty value reaches
curses.h and the wide-character prototypes are left out.

Add a patch that defines _XOPEN_SOURCE as 700, matching the
_POSIX_C_SOURCE value of 200809L that is already used.

Fixes:
 - https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e
 - https://autobuild.buildroot.org/results/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/2110131cab2a613567c99491ba540bb33440e46c

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-By: Thomas Perale <thomas.perale@mind.be>
[Julien: add link to Buildroot commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ine-explicit-value-for-_XOPEN_SOURCE-macr.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
new file mode 100644
index 0000000000..d526d58433
--- /dev/null
+++ b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
@@ -0,0 +1,48 @@
+From 54799216beac63a195cd6d34b22476fc15a80295 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 30 Sep 2026 10:59:49 +0200
+Subject: [PATCH] drawbar: define explicit value for _XOPEN_SOURCE macro
+
+drawbar.c uses the wide-character curses function waddwstr(). ncurses
+only declares its wide-character API when NCURSES_WIDECHAR is set,
+which curses.h derives from the feature test macros:
+
+  #if defined(_XOPEN_SOURCE_EXTENDED) || \
+      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
+
+drawbar.c defines _XOPEN_SOURCE without a value, so _XOPEN_SOURCE - 0
+evaluates to 0 and the check fails.
+
+With glibc and uClibc this goes unnoticed, because their <features.h>
+redefines _XOPEN_SOURCE to 700 (and defines _XOPEN_SOURCE_EXTENDED)
+whenever _GNU_SOURCE is set. musl does not touch the application's
+feature test macros, so the empty definition reaches curses.h
+unchanged and the build fails:
+
+drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
+
+Define _XOPEN_SOURCE as 700, which matches the already explicit
+_POSIX_C_SOURCE value of 200809L (both refer to POSIX.1-2008).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Upstream: https://github.com/Atoptool/atop/pull/415
+---
+ drawbar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drawbar.c b/drawbar.c
+index 651a81e..e4db0d6 100644
+--- a/drawbar.c
++++ b/drawbar.c
+@@ -104,7 +104,7 @@
+ // the other.
+ /////////////////////////////////////////////////////////////////////////////
+ #define _POSIX_C_SOURCE	200809L
+-#define _XOPEN_SOURCE
++#define _XOPEN_SOURCE	700
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
