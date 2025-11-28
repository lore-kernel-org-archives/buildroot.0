Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60269D116E2
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC9F4411DF;
	Fri, 28 Nov 2025 10:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2c_VGBwKFzyd; Fri, 28 Nov 2025 10:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051CB4121D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051CB4121D;
	Fri, 28 Nov 2025 10:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A40967
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D90334121D
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rAF0yrbsBoK for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 10:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DAFF411DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DAFF411DF
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DAFF411DF
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:55:29 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id Ow8MvKeWslGpsOw8MvSM6w; Fri, 28 Nov 2025 11:55:26 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 28 Nov 2025 11:55:24 +0100
Message-ID: <20251128105524.1743108-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMx0PukmOtEhgs/SVUJvL/nEd9Z6izzTCSgJ06LkjdmCTvmKbmUTHn76vtndlTydQJ3jfum4AVxtA71zw/PrnENzh9eGZeezOkV91zK+qRpGe3RysgeV
 Q/auS1LS2KBG0TDkJR4fLCJAtcuhF2egErPGUPgyfIfjXrcIDXCtG2AR5IT1psEuKIGbEZO3hAn7jdMhac/w4BOV4pBNR1SVyiikQqqFINLc2jqcVjtezN3R
 6zw3IpdFX2A/WYCbIvcetdJpA9VmC1MDaX2UzANo5sS1/MIL2eW0g0TuTa03k4Gs
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764327326; bh=NISPbyfp1vAibT17DibjiXjSvZFmjOJy8nePeIDQx60=;
 h=From:To:Subject:Date:MIME-Version;
 b=K3apMXnp/VoNy3ZtheRyVCUxlKbyEt9vnVChz1n5/1s6foScx2NYYk03jhchj3gev
 ITSXYl2VZBMRIx948IVL7FTRuWR6jupXm/Q6YWKit0BOzNxSaIK6ek9SR8SZiWF4KM
 E4CEgcqm41PJ+7fOOJ9iFIkyitrPlFReDCArM3zxMIIGuqPgkKegCuYuxo2z/JozNY
 U0zEMunChJVJYpbGy5DV3cALuVVIJQm+YCv81oONkapxHcCxVkKac2mquC7Nib0zSq
 be4NZjp0w3NugoXIZOoaTfjW/Majnzvinu+exafOFnhJFRgSZi8c1+Zvq1w/r1HOic
 pWdiaY/uDTttg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K3apMXnp
Subject: [Buildroot] [PATCH] package/tmux: fix build failure due to type
 mismatch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package tmux fails to build with:
compat/utf8proc.c: In function 'utf8proc_mbtowc':
compat/utf8proc.c:51:39: error: passing argument 3 of 'utf8proc_iterate' from incompatible pointer type [-Wincompatible-pointer-types]
   51 |         slen = utf8proc_iterate(s, n, pwc);
      |                                       ^~~
      |                                       |
      |                                       wchar_t * {aka long int *}

Add local patch already committed upstream to fix it.

Fixes:
https://autobuild.buildroot.net/results/651/6510cfb16d0c3f3772918cd3bde0542d0b59a230/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...rnings-on-32-bit-architectures.-GitH.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch

diff --git a/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
new file mode 100644
index 0000000000..e9cd9d5acc
--- /dev/null
+++ b/package/tmux/0001-Cast-to-avoid-warnings-on-32-bit-architectures.-GitH.patch
@@ -0,0 +1,28 @@
+From f812b8d30456c071ee23e9a02d6ce16036fd3f68 Mon Sep 17 00:00:00 2001
+From: Nicholas Marriott <nicholas.marriott@gmail.com>
+Date: Wed, 29 Oct 2025 08:47:45 +0000
+Subject: [PATCH] Cast to avoid warnings on 32-bit architectures. GitHub issue
+ 4597.
+
+Upstream: https://github.com/tmux/tmux/commit/f812b8d30456c071ee23e9a02d6ce16036fd3f68
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ compat/utf8proc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/utf8proc.c b/compat/utf8proc.c
+index dd4ab27f..147da696 100644
+--- a/compat/utf8proc.c
++++ b/compat/utf8proc.c
+@@ -48,7 +48,7 @@ utf8proc_mbtowc(wchar_t *pwc, const char *s, size_t n)
+ 	 * *pwc == -1 indicates invalid codepoint
+ 	 * slen < 0 indicates an error
+ 	 */
+-	slen = utf8proc_iterate(s, n, pwc);
++	slen = utf8proc_iterate(s, n, (utf8proc_int32_t*)pwc);
+ 	if (*pwc == (wchar_t)-1 || slen < 0)
+ 		return (-1);
+ 	return (slen);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
