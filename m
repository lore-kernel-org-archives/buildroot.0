Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D1CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794FF80D66;
	Sun,  4 Oct 2026 15:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqaNNX7LJEqo; Sun,  4 Oct 2026 15:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9D2F180C73
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791126001;
	b=WF/p3uBFYStJJZgTaW7PtWHMvPXRQioOs+UkEX8TdN/EawoiugUirPweOmraHczTJ45z
	 ApFYHy0MGvbv1eKP/doifNo9ZbxAB3Ndiju1S8TwyVvaoe4MUqBM6UWsWqYBAOu9cvdtr
	 iZR4AtBCJbcnre0wp9ZkSqEwaOl8AsiFVKsuEtVugjgvr1+HBL4SZXWawwPFaJw/kRCdX
	 pf9PTr5goEThaz8cMRc99dh1Vk3trWDOrJd6iOngAWrvmdg5bVCUAqZ8luBWsFWtJHWIc
	 xUyxP4PyEqecUPtXhp9sm6dnVsKcnoFaw+dPe2O3uNdcganIlAcu9GVaiwi9EhbzuSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791126001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=URwYkwPZ1QoZ6HzAGeHExE5PkvZyOMr1pQ70J7PKQzw=;
	b=OJuB+ZozT5YAGiAXNTdX7OZr9SzI9Hu9NO4dzCOvSE2iu9yRvW4eDpSbaoJcnrNvnBii
	 xfQa7zDTeIYevzwFfyBWhYr1azwRzRhSO19pqYfD9tzv/QN/yG4LiM9R9NSBiI+aoUxcz
	 o6/SCpwn9CGtzlluQ/NnxGl2VC7scdiqxA1xveby9xdroxOtNROOAd/rKYAgkbOnxw4CD
	 KX9xTujF5eKKIYiYIipwwDWS48bZqMW8NwXUNrm6Dn4DLy3VS/Gv4uTv0aw7gUAPM+W+2
	 wjUn54ZHAewwnjuHYlniG05S7w0lft7+KRbloamvsp6a5Oe0NVJ0NcpbUwYCtVEJwIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791126001;
	bh=URwYkwPZ1QoZ6HzAGeHExE5PkvZyOMr1pQ70J7PKQzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Td+VUhbLed65IMsDRrViqDJPBplVTwWnJn5CmsWTj1r7uwt9lDtTqG94+XeOUqbTz
	 jFO9VZ1se3QYj9o8xXxCNjrXhE3Apu2M0n5Sz0Jv8SURX3r5hxfGiLow5E+RPkvSVl
	 /SOEjlxxQ/P0ntN3yAwAjXQgoD9W/yL1DmIQziFfZQfB9oDERmQauHtiChOVCofsEa
	 /o2Azi0JIE0pvX5+JTFshKoqF3jK+Z+GgxY4xu3ld2j3Syq9wR0CY0khW12PoTm0o8
	 +d4K9P6u/bVad3JwptJGLydGwIeH/fVDNEhIWC/OQdq0F+bU2LnCv8Gen4k2BgY9wq
	 CPNctEMnva8LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D2F180C73;
	Sun,  4 Oct 2026 15:00:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42023335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD8D605F9
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3-e0oDtzLXP for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 14:59:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 700B8605F7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791125999;
 b=nzdd73KFjiXAugZwr2cyNqlwC+2G6PtZK/4DTarFoRL+9raosD/7GY3gQVYyuYSWCQvj
 H69DYeHsJRazQoDHrkbxIe0n4zjq3Qv79qH1a2v+NquDbOsCMRlByRlgpj3zRuutWKjoJ
 iNAAb9SKNVuIVipLhUsfPoCL0DQ9q36KiO4NUxmDne9GmfCz6OFAi9DUieacLfhYgUvDU
 q9nkKJlnqgT7ji4SBW3DD3nTbwqpyvr3M+Rs6Rx+x4z0UFfIr0aDL+48oNRQoakfefThj
 V69dZKIfevbyd7udy5p6xiaoMqY/9eCc4/3LCHUIDAX5cPewkzFnvUTo/F922OtZMzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791125999;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=9Dy2NR3TsuMUdYhgVxcRWLMskGD5xr6vsD2KPIAajKE=;
 b=E7pHF196zIm6tJqfa/gLAiPmT8XQ3SYoc1GW8SPfZmKLjhBYeZJ9X3J26QCIdx/VRGKN
 UVi/6DAz6WMcP66b8i+R51TcBeG8YD1Rj+C05XZZ5MQFA5ZOh676XZHmL3mvcEujoNnDI
 sK/aG00JI8Yz8UUEz3BNUGz+Jj3sEOu9ZJtftEprFuAIzmWVR/Ptv7937ZG3ajs9v8gNj
 sKCpLhITGA54svekpRKKG9tKkVuLu15Q6L596G7E7nKYbvtVaX+VbXSJSW8qagCww1Ws6
 OYnBVe0F3EwafdBXGQxkZexu8r6j5/1HnDlNw6Ami9z0amYlcz3u17L2hcJ9Veic60A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=h+H+TaVM; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 700B8605F7
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 14:59:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1wVgvA48n3-00t0jW; Sun, 04
 Oct 2026 16:59:54 +0200
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 16:59:50 +0200
Message-ID: <20261004145950.1387519-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9nH1Mx1pIL0mKuTlilxtAN+hLdh9vUCYerCWvOwG5dlHnbdQ7Hi
 IbqOjNcPE+VWPwGzdberiMOfHECYgvIXzjUypJMN85SC9/SJX4xHJ1HVKvC4KnlCsFeNMLL
 8E7rijU60KHnKiCfjfqJhOvYbidbv5mBTWvWfTSLNH/YPoPFipudmNcZRcrPxU6MCyOTayB
 nXOqLXLlj0ki+0SIfJbPA==
UI-OutboundReport: notjunk:1;M01:P0:oD4t9cjJcdU=;ZMKxxI72sIB6WrqCqbMCoFH0Lwt
 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
 0g6XWJmvbBQpxVs0u1kj0CLwVA==
Subject: [Buildroot] [PATCH v1] package/gzip: add upstream patch to fix
 build for aarch64
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add 0001-build-avoid-failure-to-build-on-linux-aarch64.patch
  (from upstream, see [1])

Fixes:

  In file included from gzip.c:61:
  gzip.h:120:21: error: expected ')' before '+' token
    120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
        |                     ^

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Link: https://lore.kernel.org/buildroot/asJEBMQpD2FYJql2@waldemar-brodkorb.de/
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...id-failure-to-build-on-linux-aarch64.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch

diff --git a/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch b/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
new file mode 100644
index 0000000000..53acd7294b
--- /dev/null
+++ b/package/gzip/0001-build-avoid-failure-to-build-on-linux-aarch64.patch
@@ -0,0 +1,43 @@
+From 56b57a937db747c3f94746379c4d95d8a787bde4 Mon Sep 17 00:00:00 2001
+From: Jim Meyering <meyering@meta.com>
+Date: Mon, 21 Sep 2026 01:42:18 -0700
+Subject: [PATCH] build: avoid failure to build on linux aarch64
+
+* gzip.c: Include gzip.h only after all system headers.
+gzip.h's "head" definition affected a subsequent signal.h-
+included system struct member named "head".
+Reported by Adam Sampson in https://bugs.gnu.org/81904
+
+Upstream: https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gzip.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gzip.c b/gzip.c
+index 220f6fc..6c0af7f 100644
+--- a/gzip.c
++++ b/gzip.c
+@@ -58,7 +58,6 @@ static char const license_msg[] =
+ 
+ #include "tailor.h"
+ 
+-#include "gzip.h"
+ #include "lzw.h"
+ #include "revision.h"
+ #include "version.h"
+@@ -99,6 +98,11 @@ static char const license_msg[] =
+ #  include <utimens.h>
+ #endif
+ 
++/* Include this only after all system headers. Otherwise, its definition
++   of "head" conflicts with member names in linux-headers 7.2.6's
++   asm/sigcontext.h pulled in via <signal.h>.  */
++#include "gzip.h"
++
+ #ifndef MAX_PATH_LEN
+ #  define MAX_PATH_LEN   1024 /* max pathname length */
+ #endif
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
