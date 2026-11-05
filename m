Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E6D606A9A9
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qpLwE8rA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F7B605D0;
	Fri,  6 Nov 2026 16:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFV3eg8shOJ8; Fri,  6 Nov 2026 16:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E46A7607AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981348;
	b=dR9WUV/wYeeWBmBR1o/j8L5F5NGrONkN5p9F0wZI4tyHK74uFdTEyY8VO9WUs+MdFfEb
	 CdpX9qsVM+kPbXP1sbT7YLcsev9icd/IsKbA2SJcKgLnxkV6uKNWBT8qrW256Xy/HjuDb
	 R5u4ZBKPxZ0EvvtDd0Z0qYcGkLIol+Sa0uoVYP+gc/jD4qF0YpitPitJH5Mq7oy+sC88L
	 4R14CVeduOd2sOpQqDO9BSFKGCfhLllOL1cERgaDOoEhEJpWSlyyhjHduYtFJdEpFudk9
	 mbzKtEZLg5I8nQ+QOvW8WHaOkYVB3VH3+8izgnoPykw1lRzXdHAuQsGRrbMev8Qysag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=qTKqtoXVSOhO4HqqavHM/yxGGolOWv9XQIEr8gbLqk8=;
	b=HZXCnWhK2fcsPDtOOMEOMMovEwcDvGcdIYoWe7bwCbpUO3qa0D8rCnFA1uwKbHEUvFqU
	 oR6GrDAiF3PV+d0hxFN7AUe2BQGI2va5W9DrsLV8PPjLBwhvXGv8Zmg36uvZp3uRO3fEw
	 Ff70KzGwvU8EIdN5HKO0AFPddIjIOcpN6ufma47tMfX06niBsN1cZ/6QE1sFTDoLLoSQS
	 9S32CmGvrXkZdluuCAmJFC9Fp3Rq0ad0MycSO5sYb3Qv5zTWYt7omX9Fgw4cIBACt27vC
	 hitDSL8BkvM9jg++4oS+t9qQhM95cj7OW+UOypa9CI46saxbk+2QWqWhv1WkNV5gVVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981348;
	bh=qTKqtoXVSOhO4HqqavHM/yxGGolOWv9XQIEr8gbLqk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qpLwE8rAV0Hq1zliSVHuGJO+zNaujj1f1NXrlYMYm8h/efRGQeqIuV8GFMRWzphCG
	 BiMrAl8VTO+C/eLCb9+v/jS0TU3GJ8UwsJgZZGTqijpMeUgldqVOsHO1tV0YvhNAkf
	 VAkYgf36Tj6vJ6jv8tWwedL1oh0//XF1y9vQBdnFEGTVHra5x686wJTB8s/J5OdDjQ
	 VuwcUqgkxmFVGCEwQY6oj+ZCf2yMwu22CK1frM2GkCtdVmNpJ1M6pgOK2JP7u9FLg/
	 angaGtoFt/RudfxefI3xNOIYWZc2L+c1vlevfB/IO7WgwZwj3Y0zzNB3Wgu4oVMkvC
	 bZqSgULbZq49w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E46A7607AD;
	Fri,  6 Nov 2026 16:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE6F4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80F64608E2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-8EC_KTuk8z for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4658B608DA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4658B608DA
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7078C9E0B0; Fri,  6 Nov 2026 16:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: fb63290ed615a4fa496d800e33b3a4105d4e283c
X-Git-Newrev: c4ec2745e380b5c42433e647289921614397f124
X-Patchwork-Hint: ignore
Message-Id: <20261106160702.7078C9E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-dnspython:
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
Content-Type: multipart/mixed; boundary="===============7668897392879392820=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7668897392879392820==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4ec2745e380b5c42433e647289921614397f124
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

(alternative to commit 1bc28b9dcad33c23407a0eb5b5783e0c5aee6d4b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-to-a-chain-length-of-at-most-16-pointers.patch | 104 +++++++++++++++++++++
 package/python-dnspython/python-dnspython.mk       |   3 +
 2 files changed, 107 insertions(+)

diff --git a/package/python-dnspython/0001-limit-decompression-to-a-chain-length-of-at-most-16-pointers.patch b/package/python-dnspython/0001-limit-decompression-to-a-chain-length-of-at-most-16-pointers.patch
new file mode 100644
index 0000000000..ead1177f66
--- /dev/null
+++ b/package/python-dnspython/0001-limit-decompression-to-a-chain-length-of-at-most-16-pointers.patch
@@ -0,0 +1,104 @@
+From fb3ec688176e0e2f525ad8bc163eefe5583269cc Mon Sep 17 00:00:00 2001
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
+Upstream: https://github.com/rthalley/dnspython/commit/b485e460c266540a1a09ca6d8d1d7b685b1d3023
+CVE: CVE-2026-114605
+[Raphaël: backport to 2.8.0]
+---
+ dns/name.py        | 11 ++++++++++-
+ tests/test_name.py | 22 ++++++++++++++++++++++
+ 2 files changed, 32 insertions(+), 1 deletion(-)
+
+diff --git a/dns/name.py b/dns/name.py
+index 45c8f45..8500d2b 100644
+--- a/dns/name.py
++++ b/dns/name.py
+@@ -91,6 +91,10 @@ class BadPointer(dns.exception.FormError):
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
+@@ -1069,9 +1073,10 @@ def from_text(
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
+@@ -1087,6 +1092,7 @@ def from_wire_parser(parser: "dns.wire.Parser") -> Name:
+ 
+     labels = []
+     biggest_pointer = parser.current
++    hops = 0
+     with parser.restore_furthest():
+         count = parser.get_uint8()
+         while count != 0:
+@@ -1097,6 +1103,9 @@ def from_wire_parser(parser: "dns.wire.Parser") -> Name:
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
+index 96c0345..f4bb860 100644
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
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index da3cf223fd..4c50d0941a 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -11,5 +11,8 @@ PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = hatch
 
+# 0001-limit-decompression-to-a-chain-length-of-at-most-16-pointers.patch
+PYTHON_DNSPYTHON_IGNORE_CVES += CVE-2026-114605
+
 $(eval $(python-package))
 $(eval $(host-python-package))

--===============7668897392879392820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7668897392879392820==--
