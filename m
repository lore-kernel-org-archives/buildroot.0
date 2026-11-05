Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C0606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z/5g8IR7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CC77608B9;
	Fri,  6 Nov 2026 15:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0pwqQfGhIIJ; Fri,  6 Nov 2026 15:59:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FC16608CE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980756;
	b=iWdqjJBfUcA2pEEyi6zMrJkLEgnQT2xCFTaW6SsKPDXJFEPeY/nzp/f/c0eGoLC1/r39
	 FHZrANUtVGaCeQW5+Vc+zanzdeocq18xqEwaHfKHJMz5WpeyHMnJ8YWtGEn1TVfCFcWDR
	 r9WUT97EZSGnEOAeN6SbU+Qkkz4ODMtEeP3QRBO1Kkml1ZEIE/4uoKjxJR4aYYE1VkQAs
	 5+VMLWF6XQFrVoWoLhADp0TAivfSprlfDmxZ6iAFW2TFGpsPNqtEgoMkupvtG4DlFg2vY
	 2QyKcC9rLTixHNrQ0LNLKOQhfsiaOaGP+jGlBZS2dDprilHD03ixpyNnY/7jZVBKGNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=46ocKbLlrbzjEFBxc5mg691KJL1nAlNHqUCmll1Y9rU=;
	b=AGu7B8hzUAcm9RKu2dprToKLAPEVQHGer90dX03HoyIHFNsczk+eMd2ArAYSG/a9JU7N
	 y1tWY4h9WbFmitBLjQZ5ka+64A6jrCCREnMD4rGlQ15XnPYdGKRC+bPiCH1cHiIEjDFC2
	 YLhaX2fv4u/sZzqKhnq5BLTIoDwhotSLLbSAWlqOSBgDjvASSSK7rmHgJ7HMkv/RK9R6H
	 dxf+qMYHjT2d6Gc0mYvon3AwQrpJrLGzxxGHHc0hdVvkq9pg+HwsS2U7stxrgS+L/prrc
	 RdjCukWg3YaS1Ey0pO5EX87Emq1osZ7vGOW5WKvoAnPcdd8NL/kYBwX3lepc/GkybKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980756;
	bh=46ocKbLlrbzjEFBxc5mg691KJL1nAlNHqUCmll1Y9rU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/5g8IR7Tav9n5Hk++huW+9Dt4JKtjjTvVciwLGmFWliA7gce5ASGwbPOdTp9fc7b
	 7AHVfIHGbl6LTwV0x2qqAG19LhVCo4BvqZyjD7HN32Z/7W6cheCJadYR7DhVAemBvK
	 7Pq+rvD5w8Xea7B+QX2H88CUW0Z7DL5j5Gs00HwPzY3fcH4opdQJcrO+1QPRoclJsg
	 gU8yYQN04CEUjwueWAPVVblUXTZgiURd7RAe58PSHvzFWPr3EZhITxhUMxCAf2Op4h
	 Aw0eAbCknc4LIbcnwgD+pl9uiM7MbNWEKwVql4o4OnbZ316WNa6JjhxtTnrBQBeNTi
	 p4LArcx/b2UrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC16608CE;
	Fri,  6 Nov 2026 15:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA60BAFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6E65408FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNFswTJcYzEd for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 96E04406CA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E04406CA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF829E0A8; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:27:56 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: de0ca461f408cc12a9b153caa25ff7fefc2a24bd
X-Git-Newrev: 5b3aacf81125a8b2bf7ce9de122b16162f1ac074
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.CBF829E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-dnspython:
 add security fix for CVE-2026-114605
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2916536703677565148=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2916536703677565148==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b3aacf81125a8b2bf7ce9de122b16162f1ac074
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

(alternative to commit 1bc28b9dcad33c23407a0eb5b5783e0c5aee6d4b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...pression-to-a-chain-length-of-at-most-16-.patch | 106 +++++++++++++++++++++
 package/python-dnspython/python-dnspython.mk       |   3 +
 2 files changed, 109 insertions(+)

diff --git a/package/python-dnspython/0001-Limit-decompression-to-a-chain-length-of-at-most-16-.patch b/package/python-dnspython/0001-Limit-decompression-to-a-chain-length-of-at-most-16-.patch
new file mode 100644
index 0000000000..6fba6b0f75
--- /dev/null
+++ b/package/python-dnspython/0001-Limit-decompression-to-a-chain-length-of-at-most-16-.patch
@@ -0,0 +1,106 @@
+From 95a1f238ce3a75eca4555a97f643e6980facc1ea Mon Sep 17 00:00:00 2001
+From: Bob Halley <halley@dnspython.org>
+Date: Sat, 26 Sep 2026 13:38:07 -0700
+Subject: [PATCH] Limit decompression to a chain length of at most 16 pointers.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A maliciously crafted DNS message may cause dns.name.from_wire_parser() to use excessive CPU for DNS name decompression. Applications which process untrusted DNS wire form messages with dnspython may be degraded or DoS'd by the extra CPU use required.
+
+Credit:
+
+Evgenios Gkritsis, Department of Informatics, University of Piraeus & Athena Research Center, Greece
+Constantinos Patsakis, Department of Informatics, University of Piraeus & Athena Research Center, Greece
+George Stergiopoulos, Department of Informatics, Athens University of Economics and Business, Greece
+
+(cherry picked from commit b485e460c266540a1a09ca6d8d1d7b685b1d3023)
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+CVE: CVE-2026-114605
+Upstream: https://github.com/rthalley/dnspython/commit/b485e460c266540a1a09ca6d8d1d7b685b1d3023
+---
+ dns/name.py        | 11 ++++++++++-
+ tests/test_name.py | 22 ++++++++++++++++++++++
+ 2 files changed, 32 insertions(+), 1 deletion(-)
+
+diff --git a/dns/name.py b/dns/name.py
+index f79f0d0f..0b2bf35e 100644
+--- a/dns/name.py
++++ b/dns/name.py
+@@ -86,6 +86,10 @@ class BadPointer(dns.exception.FormError):
+     """A DNS compression pointer points forward instead of backward."""
+ 
+ 
++class PointerChainTooLong(dns.exception.FormError):
++    """A DNS compression pointer chain was too long."""
++
++
+ class BadLabelType(dns.exception.FormError):
+     """The label type in DNS name wire format is unknown."""
+ 
+@@ -1064,9 +1068,10 @@ def from_text(
+     return Name(labels)
+ 
+ 
+-# we need 'dns.wire.Parser' quoted as dns.name and dns.wire depend on each other.
++MAX_COMPRESSION_POINTER_CHAIN = 16
+ 
+ 
++# we need 'dns.wire.Parser' quoted as dns.name and dns.wire depend on each other.
+ def from_wire_parser(parser: "dns.wire.Parser") -> Name:
+     """Convert possibly compressed wire format into a Name.
+ 
+@@ -1082,6 +1087,7 @@ def from_wire_parser(parser: "dns.wire.Parser") -> Name:
+ 
+     labels = []
+     biggest_pointer = parser.current
++    hops = 0
+     with parser.restore_furthest():
+         count = parser.get_uint8()
+         while count != 0:
+@@ -1092,6 +1098,9 @@ def from_wire_parser(parser: "dns.wire.Parser") -> Name:
+                 if current >= biggest_pointer:
+                     raise BadPointer
+                 biggest_pointer = current
++                hops += 1
++                if hops > MAX_COMPRESSION_POINTER_CHAIN:
++                    raise PointerChainTooLong
+                 parser.seek(current)
+             else:
+                 raise BadLabelType
+diff --git a/tests/test_name.py b/tests/test_name.py
+index 96c03459..f4bb860f 100644
+--- a/tests/test_name.py
++++ b/tests/test_name.py
+@@ -739,6 +739,28 @@ class NameTestCase(unittest.TestCase):
+ 
+         self.assertRaises(dns.name.BadLabelType, bad)
+ 
++    def testCompressionChainLength(self):
++        # We're going to decode some wire starting two bytes from the end.  At this
++        # position is a pointer which points to four bytes from the end, and it points
++        # to one 6 bytes from the end, etc., until finally the 16th pointer points at
++        # offset zero, which is the root label followed by a byte of padding.  After
++        # all of this useless pointer hopping, we should get the root name.
++        w = b"\x00\x00\xc0\x00\xc0\x02\xc0\x04\xc0\x06\xc0\x08\xc0\x0a\xc0\x0c\xc0\x0e\xc0\x10\xc0\x12\xc0\x14\xc0\x16\xc0\x18\xc0\x1a\xc0\x1c\xc0\x1e"
++        self.assertEqual(len(w), 34)
++        starts = [c for c in w if c == 0xC0]
++        self.assertEqual(len(starts), dns.name.MAX_COMPRESSION_POINTER_CHAIN)
++
++        def bad():
++            # Now we make the wire one pointer longer, which is too long!
++            w1 = w + b"\xc0\x20"
++            self.assertEqual(len(w1), 36)
++            starts = [c for c in w1 if c == 0xC0]
++            self.assertEqual(len(starts), dns.name.MAX_COMPRESSION_POINTER_CHAIN + 1)
++            dns.name.from_wire(w1, 34)
++
++        self.assertEqual(dns.name.from_wire(w, 32)[0], dns.name.from_text("."))
++        self.assertRaises(dns.name.PointerChainTooLong, bad)
++
+     def testParent1(self):
+         n = dns.name.from_text("foo.bar.")
+         self.assertEqual(n.parent(), dns.name.from_text("bar."))
+-- 
+2.54.0
+
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index 2d3622110c..aecd8409bc 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -11,5 +11,8 @@ PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = hatch
 
+# 0001-Limit-decompression-to-a-chain-length-of-at-most-16-.patch
+PYTHON_DNSPYTHON_IGNORE_CVES += CVE-2026-114605
+
 $(eval $(python-package))
 $(eval $(host-python-package))

--===============2916536703677565148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2916536703677565148==--
