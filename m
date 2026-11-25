Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C46606A330
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nqOrxJ3R
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F7A1407F2;
	Wed, 25 Nov 2026 13:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_5q_zFRrs11; Wed, 25 Nov 2026 13:25:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8264B4065B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795613139;
	b=gK+q/mgNcBmtUDzaru9MYvDjTyhyW1Rt15hfBY4Y2BSLz5WgvYAYT2SOf6C26qni2+qU
	 DM3XUR5mUnI5Gri8TUdBj3dyYdzlvcqSNWkgL0unHNTMQ4K1tdZL1pk4y9z51hZ9motxD
	 egHRGlLPB7Om1oLuYD9AB2Lla8XjUkqEhh4OhPJYhp0x8+hZMbDsYnA+rc6bJ+1Px4JU/
	 ZkzgqekBdOEblbX7IfBuFq9ocJVEo8RrWrGn62IMuxYDC/ZYgtS7bAtFuiDt8QCWrkZfp
	 pJH1phhL7AFii65+Ec5eEigiUo42ikSoWGZ9b37eFQfY+dGwCyxblNbyqrfl5XIavXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795613139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LKTdsueXzM+Anrd2T2NrfiQX934VMCRi3JI9wCRn2Hs=;
	b=nZDjMBih5h+TQ+IhwRUgsrO0KyDM0qDrnyZCZSN5sDqDft/WUTImluI4WMLD2dHLrTVg
	 zMexvMXDwFFBOBxy20bjBkqB9FA0YXBdSPjHr3mf3/jJ/CuudnniUQkPZA4Jn4+jlVliy
	 8/a0kunR5b45uWNOOGp1+hjrmFrz++jI1C9u4mpVqtR2aptiST2E80dQOpAFE1RfksWm2
	 hUn1AV8ow2E0XWrRfcHF+eCQgmZDI7GPuK2LrtsSEgj6NBJPwLsugAC39BX60dnzogNyG
	 +vnZXR3BkawIrWe8ZfZZLiEmQSlDDMu8rqgskkqLAMSVh+R7tl0lgX+dsmkxOSXVylA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795613139;
	bh=LKTdsueXzM+Anrd2T2NrfiQX934VMCRi3JI9wCRn2Hs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=nqOrxJ3Rd/l0VVt+UrEmAt1L8Dq07nmehWeb9tvgnCuRbsp/EOL2NjbDpTDGYe1v4
	 M06+OdLlSQPa4bKDwuf++ssZUwSu3A2nLRS7UrVAyygGzQhKD4rryAzu7qcUnWZqtr
	 9Cb8oZLnXiYMLRDYBIlJgpqMYV6+kDxNjcBygukId2KrhtrGmJBMrkScRha9lLczhS
	 aoqM+sN6JO4azfsaR6qafBlNL4jSjTix7I4OH1p8pYXmMxhEQO2qJk6dk89WryvQpD
	 YMHhZz6WVxmoP7dN152JCBx3VHZJoKYpVjyrydD6Hb1a3jNM7++VXZSQGNJBy851uB
	 K5qX8yl8LtNxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8264B4065B;
	Wed, 25 Nov 2026 13:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CCC22B
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CB236076D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpkUjuMojdrG for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 13:25:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5245A605E0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5245A605E0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:25:32 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A7A802C8522A;
 Wed, 25 Nov 2026 14:25:30 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 25 Nov 2026 14:25:01 +0100
Message-ID: <20261125132502.1057833-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [2026.08.x] package/python-setuptools: add patch to fix
 CVE-2026-59890
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport the upstream fix for CVE-2026-59890 (GHSA-h35f-9h28-mq5c)[1], a
MANIFEST.in exclusion bypass in sdist via Unicode normalization
collision (NFC/NFD).

CVE-2026-59890 affects building sdists, which the normal buildroot
workflow doesn't do. But setuptools could also be part of our sdk
and it can be enabled for the target, or it could be used in custom
build steps in an external tree.

The advisory mentions this is most relevant on macOS APFS/HFS+ but this
can also be triggered by building an sdist from a source tree containing
NFD names, e.g. a tarball or commit created on macOS.

[1] https://github.com/pypa/setuptools/security/advisories/GHSA-h35f-9h28-mq5c

Fixes: CVE-2026-59890
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...de-form-when-matching-MANIFEST.in-pa.patch | 106 ++++++++++++++++++
 .../python-setuptools/python-setuptools.mk    |   3 +
 2 files changed, 109 insertions(+)
 create mode 100644 package/python-setuptools/0002-Normalize-Unicode-form-when-matching-MANIFEST.in-pa.patch

diff --git a/package/python-setuptools/0002-Normalize-Unicode-form-when-matching-MANIFEST.in-pa.patch b/package/python-setuptools/0002-Normalize-Unicode-form-when-matching-MANIFEST.in-pa.patch
new file mode 100644
index 0000000000..ce1ef12634
--- /dev/null
+++ b/package/python-setuptools/0002-Normalize-Unicode-form-when-matching-MANIFEST.in-pa.patch
@@ -0,0 +1,106 @@
+From dd9f436a36486b4cb8a4c70a2321548b0be09b8f Mon Sep 17 00:00:00 2001
+From: Jason R. Coombs <jaraco@jaraco.com>
+Date: Sat, 27 Jun 2026 14:46:34 +0000
+Subject: [PATCH] Normalize Unicode form when matching MANIFEST.in patterns
+
+FileList matched MANIFEST.in patterns against on-disk names
+byte-for-byte with no Unicode normalization. On macOS APFS/HFS+, a
+file stored NFD and a pattern authored NFC denote the same file but
+differ byte-for-byte, so an exclude/global-exclude/recursive-exclude/
+prune rule could silently fail to drop a non-ASCII-named file,
+publishing it in the sdist despite the rule.
+
+Normalize both the pattern and the candidate path to NFC before
+matching, via a new unicode_utils.normalize() helper and a
+_NormalizedMatcher wrapper around the compiled pattern in
+translate_pattern.
+
+Fixes GHSA-h35f-9h28-mq5c.
+
+CVE: CVE-2026-59890
+Upstream: https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f
+[Marcus: Drop tests and newsfragment changes]
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ setuptools/command/egg_info.py | 28 +++++++++++++++++++++++++++-
+ setuptools/unicode_utils.py    | 14 ++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/setuptools/command/egg_info.py b/setuptools/command/egg_info.py
+index 7e00ae2..0e31b8f 100644
+--- a/setuptools/command/egg_info.py
++++ b/setuptools/command/egg_info.py
+@@ -35,6 +35,27 @@ from distutils.util import convert_path
+ PY_MAJOR = f'{sys.version_info.major}.{sys.version_info.minor}'
+ 
+ 
++class _NormalizedMatcher:
++    """
++    Wrap a compiled pattern so that matching is insensitive to Unicode
++    normalization form.
++
++    File names walked from disk (NFD on macOS APFS/HFS+) and patterns from
++    ``MANIFEST.in`` (typically NFC) can denote the same file while differing
++    byte-for-byte. Normalizing both sides before matching keeps an exclusion
++    (or inclusion) from silently failing. See GHSA-h35f-9h28-mq5c.
++    """
++
++    def __init__(self, pattern: re.Pattern) -> None:
++        self._pattern = pattern
++
++    def match(self, path):
++        return self._pattern.match(unicode_utils.normalize(path))
++
++    def search(self, path):
++        return self._pattern.search(unicode_utils.normalize(path))
++
++
+ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     Translate a file path glob like '*.txt' in to a regular expression.
+@@ -44,6 +65,11 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+     """
+     pat = ''
+ 
++    # Normalize the pattern so it matches paths regardless of the Unicode
++    # normalization form used on disk (GHSA-h35f-9h28-mq5c). Candidate paths
++    # are normalized to the same form by ``_NormalizedMatcher``.
++    glob = unicode_utils.normalize(glob)
++
+     # This will split on '/' within [character classes]. This is deliberate.
+     chunks = glob.split(os.path.sep)
+ 
+@@ -115,7 +141,7 @@ def translate_pattern(glob):  # noqa: C901  # is too complex (14)  # FIXME
+             pat += sep
+ 
+     pat += r'\Z'
+-    return re.compile(pat, flags=re.MULTILINE | re.DOTALL)
++    return _NormalizedMatcher(re.compile(pat, flags=re.MULTILINE | re.DOTALL))
+ 
+ 
+ class InfoCommon:
+diff --git a/setuptools/unicode_utils.py b/setuptools/unicode_utils.py
+index f502f5b..dbce03e 100644
+--- a/setuptools/unicode_utils.py
++++ b/setuptools/unicode_utils.py
+@@ -19,6 +19,20 @@ def decompose(path):
+     return path
+ 
+ 
++def normalize(text):
++    """
++    Return *text* in a canonical Unicode form (NFC) so that names which are
++    visually identical but encoded differently compare equal.
++
++    macOS APFS/HFS+ store file names in decomposed form (NFD), while patterns
++    in ``MANIFEST.in`` are typically authored composed (NFC). The two denote
++    the same file but differ byte-for-byte, so matching them directly lets an
++    exclusion silently fail. Normalizing both the walked path and the pattern
++    to a single form before matching avoids that (GHSA-h35f-9h28-mq5c).
++    """
++    return unicodedata.normalize('NFC', text) if isinstance(text, str) else text
++
++
+ def filesys_decode(path):
+     """
+     Ensure that the given path is decoded,
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..73da6b2e88 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -15,5 +15,8 @@ PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
 PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
 
+# 0002-Normalize-Unicode-form-when-matching-MANIFEST.in-pa.patch
+PYTHON_SETUPTOOLS_IGNORE_CVES += CVE-2026-59890
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
