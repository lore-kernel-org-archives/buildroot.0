Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD37AC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 773B480F49;
	Fri, 28 Aug 2026 14:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4YWj7gpYLri; Fri, 28 Aug 2026 14:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927151;
	bh=KnxFmYX17BZMaX93oa44SS5BcoAgO5fO4YD2J1+BPXM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PrMSi1oZZJHB2m1Lfjitk8Y6JeVpjhydiN/Af0FbpBLP82LMtLFr75QXVQCPakiU6
	 eb4gBvGgtTvAve57tfEUBaQe/EaLI0fnF1j6bjxN+D6cHAPZeAT0bbSTAxdlfPwoze
	 xTrdUSlJQp9OS+n4WZLF2wAmmNhAcEhTz2hCEr9arkYGJg/9IDu104E4x2JFguaSK8
	 PnIGV56w0QSFS8c7aaLL4pDL2r5tS+DyKqTxtZOaqGyywNaIO/IAJfj/HRvZJrylPs
	 GZ6iaLHqIWMokwugq0yEhMKMxxTL9nmMHGJK8AFQbmqrisAZcmudmY7B4BlAjBR2x6
	 PLWdI/UNSJuiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03474810E2;
	Fri, 28 Aug 2026 14:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9458386
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B42A1407E3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AANxwY0d6rYe for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C39B7407BA
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3D96921FB; Fri, 28 Aug 2026 14:24:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 662b43976b8549db734782a583042af7c7752d7a
X-Git-Newrev: 20d16b36941f31fac3582da47d54ab4106e7ed0a
X-Patchwork-Hint: ignore
Message-Id: <20260828142441.B3D96921FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/go: security bump
 to version 1.26.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20d16b36941f31fac3582da47d54ab4106e7ed0a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Fixes the following security issues:

 - x/mod/sumdb/tlog: fix transparency log tile verification bypass

   A malicious GOPROXY was previously capable of forging up to two sumdb
   tiles that allow for a requested module to bypass the GOSUMDB check and
   persist attacker-controlled module content to a local Go module cache.

   This attack allows for a malicious GOPROXY to serve malicious module
   content that cannot be detected by evaluating the transparency log.

   All tiles are now correctly verified against their parents.

   In order to determine if you have been affected:

   rm -r go.sum go.work.sum vendor/ && go mod tidy

   Thanks to Filippo Valsorda (Geomys) for reporting this issue.

   This is CVE-2026-56865 and Go issue https://go.dev/issue/80744.

 - x/mod/sumdb: ignore unrelated, unauthenticated hashes in Lookup

   A malicious GOSUMDB was capable of serving arbitrary module content not
   contained within the transparency log.

   This attack allows for a coordinating GOPROXY and GOSUMDB to serve a
   client malicious module content that cannot be detected by evaluating
   the transparency log.

   In order to determine if you have been affected:

   rm -r go.sum go.work.sum vendor/ && go mod tidy

   Thanks to mundur for reporting this issue.

   This is CVE-2026-56864 and Go issue https://go.dev/issue/80745.

 - encoding/xml: add recursion depth guard during decode

   Previously, DecodeElement would reset the depth counter causing it to
   never fire; this could lead to stack exhaustion.

   This is CVE-2026-56859 and Go issue https://go.dev/issue/80481.

 - net/http: apply ReadHeaderTimeout when doing unencrypted HTTP/2 check

   When a server is configured to support unencrypted HTTP/2, it reads a few
   bytes from each new connection to see if they contain the HTTP/2 client
   preface.  Previously, this was being done with no timeout applied.
   ReadHeaderTimeout is now applied for this.

   This is CVE-2026-56853 and Go issue https://go.dev/issue/80205.

 - net/url: avoid quadratic complexity in resolvePath

   Previously, resolving relative paths containing parent directory (..)
   segments performed string conversions and buffer rewrites on each step,
   resulting in quadratic time complexity and high memory allocation
   overhead.

   Now, path resolution operates on a byte buffer using index-based
   backtracking for ..  segments, eliminating the quadratic time complexity
   and significantly reducing memory allocations.

   This is CVE-2026-56860 and Go issue https://go.dev/issue/80494.

 - golang.org/x/net/dns/dnsmessage: panic when parsing invalid SVCB record

   Parsing an invalid SVCB or HTTPS RR can panic when the size of a
   parameter value overflows the message buffer.

   Thanks to Mundur (https://github.com/M0nd0R) for reporting this issue.

   This is CVE-2026-46600 and Go issue https://go.dev/issue/79795.

 - crypto/tls: limit handshake messages we are willing to accept post-handshake

   Previously, we always counted handshake messages, such as KeyUpdate, as
   state-advancing, regardless of whether a handshake has been completed or
   not.  As a result, a malicious client can keep sending KeyUpdate messages
   to force the server to keep performing key derivation operations
   indefinitely.

   Thanks to Qi Deng of Aurascape.ai for reporting this issue.

   This is CVE-2026-56862 and Go issue https://go.dev/issue/80528.

 - html/template: fix Javascript regexp context tracking

   Previously, pathological inputs could close an unescaped / early,
   allowing for attack-controlled data to inject arbitrary content,
   potentially leading to XSS.

   Thanks to Ali Sherif for reporting this issue.

   This is CVE-2026-56858 and Go issue https://go.dev/issue/80435.

 - x/net/idna: failure to reject ASCII-only Punycode-encoded labels

   The ToASCII and ToUnicode functions incorrectly accepted Punycode-encoded
   labels that decode to an ASCII-only label.  For example,
   ToUnicode("xn--example-.com") incorrectly returned the name "example.com"
   rather than an error.

   The idna package implements the processing algorithm from UTS 46.  Older
   versions of UTS 46 included a specification bug which permitted multiple
   ASCII labels to decode to the same Unicode label.  UTS 46 revision 33
   fixed the specification bug.  The idna package now implements the updated
   specification.

   This behavior can lead to privilege escalation in programs using the idna
   package.  For example, a program which performs privilege checks on the
   ASCII hostname may reject "example.com" but permit "xn--example-.com".
   If that program subsequently converts the ASCII hostname to Unicode, it
   will inadvertently permits access to the Unicode name "example.com".

   Thanks to KC1zs4 (https://github.com/KC1zs4) for reporting this issue.

   This is CVE-2026-39821 and Go issue https://go.dev/issue/78760.

 - encoding/asn1: enforce maximum recursion depth

   Enforce a recursion limit in Unmarshal to prevent stack exhaustion when
   parsing deeply-nested, recursive structures.

   Thanks to Marwan Atia (marwansamir688@gmail.com) for reporting this issue.

   This is CVE-2026-33818 and Go issue https://go.dev/issue/80405.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9e9110bf23a86d1e312e23fc19921cd911f53861)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6c9c20be69..1c43cabf7b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
-sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
-sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
-sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
-sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
-sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
-sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
+sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1  go1.26.6.src.tar.gz
+sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4  go1.26.6.linux-386.tar.gz
+sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89  go1.26.6.linux-amd64.tar.gz
+sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e  go1.26.6.linux-arm64.tar.gz
+sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea  go1.26.6.linux-armv6l.tar.gz
+sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388  go1.26.6.linux-ppc64le.tar.gz
+sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde  go1.26.6.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 265d3aa880..df1023c19b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -7,7 +7,7 @@
 # When bumping this to 1.27 (or beyond), remove the workaround for
 # upstream issue https://github.com/golang/go/issues/77436, below
 # (i.e. revert the commit adding these lines).
-GO_VERSION = 1.26.5
+GO_VERSION = 1.26.6
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
