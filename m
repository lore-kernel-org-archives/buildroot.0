Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7rgVDkW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18ABF811D7;
	Fri, 30 Oct 2026 14:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUqTjKuH-aCx; Fri, 30 Oct 2026 14:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07614811AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369193;
	b=fCZwIo+Dd7nb3nvOb6rvpd7qmsEOc1gjFqPr2M7wdjjrGBvs/HO7J4DvBw471TEF2yBP
	 YoMHZChiafWcbXpwsVIFkMPC2Fy8uT/bE4AYflSq7r3YpXqFPP95MsNmp6is6wdA37TB3
	 BjwntOzcV4AX2mgZTBBGGizf8VN9+x4QnrFuQDX4cZHd6UOj3O0Z2re5ObmxYwYpVBKY0
	 t97ZYYQR7X6qAQHcRD1QqDPTUvNRXzRxg8qS8bJJFKhbkoeLo0e83J3VDBgOzK+LDmFgb
	 XVBFmV+bhG2mPdsyxFrxJBSUTSDcoZjW06AwxpkPKTv+PwuzKJSSj67fsmV6xbkmZyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xn2yQ0JdLrd6jUyiAgGsaEvMnwomwuBy2TbvvHu4bQM=;
	b=ibVNfmQM8/ztLLxrdgEAHtAr0tyJUJs+oBqqeknnOaiJlGqRu7WBGLr9dJJdFq/Q/MJq
	 DJfnB3amt4dN97ei3jdASMeq0DrDTbGwr4U2UsUR/zPHilVcdlX/Q5xLiqFJ2NIh0pjpp
	 /4uGfXmDwJ9PuObPqs1QRnjzTxHjIXBqaxUSU7TlAuFd2lgDMFTvawE5LE2ZKTPY7nql3
	 0OI6KOLZOFt/RQ9q4fsJ7CZ6sTE1qbJQV0V/VJYfwbg9bS6t+TK4quph5wnvNRZPHlKlU
	 MVXi0SllAPTJRpTEB84m3tjL1jGB5F9y8u+UeEKJJZt3Fg84bVXWXuMB3WMOXLYEQLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369193;
	bh=xn2yQ0JdLrd6jUyiAgGsaEvMnwomwuBy2TbvvHu4bQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e7rgVDkW9UN4hyglo0T/Mhj6Qnk4I7hkNKGgMg0GOUmnr9KKmw3UVVaK2KunYtYyz
	 LtpIeAjGpIHu+4o7u/Ci5ejm5kLA6rpSnGEMYxd/iAWXBH2q60nd8OczwqGqV4HxUM
	 eDitBm/N214EBe6nbuZ0BmBbyT0g7LfFj7TGeYAOfeSZ8Mmp4h6MKIttVZwBOoBEjX
	 5FYEAgsO9Di4A6GNsrFEvwfi+jXXqtM9WGyF8qhx6iPoLnAef+OOC0kdYPrCBb+D2s
	 TQuRb+gAPDgeygvCI7EBouzyK7pMK3EI9N/meEU84F2998BvRRMa5o9ihZoD1lomZe
	 7zpoXsVJOhOZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07614811AC;
	Fri, 30 Oct 2026 14:06:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F461362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D8940B26
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbpWXVRb8xYf for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 659A440B1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369158;
 b=ldGe+lFE7DKiOM41cCFKSbnBRcdtOWN3ObjyiNpyqu+MjuY3f6KiTaF+6eg08ELqWYdE
 aXeLZpaxOe4vPy3sWhkRvRo/7Hl72Gvnj+bW0zforGjG7Gm1Qd+BBPqaHXFZLKhXxbuR0
 zZUWRyZ9Q8FFoXOjLmcE3zU7W4YrwDSNmFtLDfaMg+Q6baKgFQ3FgXd9LW+io9DyK5/HM
 VsgV0mDhcxOUuoR1xlWFoGhpGEhjFl9NcBOc5QVrn33vAaJ80N0v9Ha8Cge+iZuzOVoBF
 6WDTZEQtGa8fpoIROrW+6JZ7EY/14tGwMOj2ypgtLovsJswzpJQsSIDV0gBEPToVY5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369158;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZBXca+BHqUs1UwSmNgQIuO/hMDmAqLDUTdvxo4cFAFU=;
 b=em7Oy5DbTNECVMcITMZZIwbN/AsdCPLjVCcJG6K4T+IW+ZMYG8leuOpT9npqMu8NzZz4
 2bAT1CJfYuB4ANUne0aGmBXSPtX38UE7Y9dAgIs+YgTweriKlMgkkafCpJFZEyW+Zshv5
 9TVQhENRX5Iz/tgzCdIptxgyjt97dBhy14bAdxbpEGgQKQrRq1U5bKRQ3qzTfuc/QumaK
 E4Oc5oaSz3i8wnscVoJ4w69dWz1tv6Gk6VkdDz5IkYFPF4MOKBT69+YeZ9uEjBbIzXOPh
 01wZKm2v7y4b2v0scrzemyspMOuGApJV2y5QUOGCVoPvbGurlHsTsfTizWkwLj8OwRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 659A440B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76C699D388; Fri, 30 Oct 2026 14:04:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 956529c8a2439dd041d3c384cb39a7c848f7ad89
X-Git-Newrev: b5e59b55987fa67dc1608b224ee3b53f6563a75d
X-Patchwork-Hint: ignore
Message-Id: <20261030140430.76C699D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/gobject-introspection: fix host build when /bin/sh warns
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
Content-Type: multipart/mixed; boundary="===============8426821543113131357=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8426821543113131357==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5e59b55987fa67dc1608b224ee3b53f6563a75d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

host-gobject-introspection is built with LD_LIBRARY_PATH pointing to
$(HOST_DIR)/lib. When g-ir-scanner calls pkg-config, which in Buildroot
is a /bin/sh wrapper script, the shell inherits that LD_LIBRARY_PATH.
On hosts where /bin/sh is bash linked against the system libreadline
(e.g. Arch Linux), and host-ncurses has already been built, the
dynamic loader picks up Buildroot's libncursesw, which has no symbol
versioning, and warns on stderr:

/bin/sh: .../host/lib/libncursesw.so.6: no version information available (required by /usr/lib/libreadline.so.8)

giscanner merges pkg-config's stderr into its stdout and parses the
result as compiler flags, so the build fails with:

gcc: error: /bin/sh:: linker input file not found: No such file or directory
gcc: error: .../host/lib/libncursesw.so.6:: linker input file not found: No such file or directory
gcc: error: no: linker input file not found: No such file or directory
...

Backport the pending upstream merge request, so that giscanner only
parses pkg-config's stdout.

This issue has been present since commit 8270fca228b1
("package/gobject-introspection: fix host-linking"), which started
setting LD_LIBRARY_PATH for the build, while giscanner has been
merging pkg-config's stderr since 2018. It only shows up on some build
hosts, when host-ncurses is built before host-gobject-introspection.
It therefore affects 2020.05 and later, including 2025.02.x and
2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/615b6701c6c200f6e6f3081e784f981e4f4f644e

Fixes: 8270fca228b1892b699801536ce136460e4892e9 ("package/gobject-introspection: fix host-linking")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9b64904b6e6b08e52dd3874b6782283ae4d4d54)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0002-giscanner-Do-parse-stderr-as-flags.patch  | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch b/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch
new file mode 100644
index 0000000000..f19d8ce092
--- /dev/null
+++ b/package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch
@@ -0,0 +1,56 @@
+From 5685062db8924fe0a58a9a2a3f435217614dcc9f Mon Sep 17 00:00:00 2001
+From: Franciszek Stachura <fbstachura@gmail.com>
+Date: Thu, 20 Aug 2026 20:23:16 +0200
+Subject: [PATCH] giscanner: Do parse stderr as flags
+
+check_output in pkgconfig.py returns stdout with stderr. If pkg-config
+prints something to stderr (ex. dynamic linker warnings, or warnings
+from program passed in PKG_CONFIG), it may get parsed as flags and
+passed to the compiler.
+
+Do not capture stderr in check_output at all.
+
+Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/561
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ giscanner/pkgconfig.py          |  2 +-
+ tests/scanner/test_pkgconfig.py | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/giscanner/pkgconfig.py b/giscanner/pkgconfig.py
+index 39db41d61..19c5953ea 100644
+--- a/giscanner/pkgconfig.py
++++ b/giscanner/pkgconfig.py
+@@ -31,7 +31,7 @@ def check_output(flags, ignore_errors, command=None):
+     argv = command[:]
+     argv.extend(flags)
+     try:
+-        return subprocess.check_output(argv, universal_newlines=True, stderr=subprocess.STDOUT)
++        return subprocess.check_output(argv, universal_newlines=True)
+     except subprocess.CalledProcessError as e:
+         output = e.output or ''
+         if ignore_errors:
+diff --git a/tests/scanner/test_pkgconfig.py b/tests/scanner/test_pkgconfig.py
+index 8b654e38e..5da0eb4fc 100644
+--- a/tests/scanner/test_pkgconfig.py
++++ b/tests/scanner/test_pkgconfig.py
+@@ -104,6 +104,16 @@ class PkgConfigTest(unittest.TestCase):
+             flags = pkgconfig.cflags(['bar-3.0'], command=command)
+             self.assertEqual(flags, ['-DLOG="HELLO"'])
+ 
++    def test_pkgconfig_stderr(self):
++        s = """
++        import sys
++        print('warning: test', file=sys.stderr)
++        print('-ltest')
++        """
++        with pkg_config_script(s) as command:
++            flags = pkgconfig.cflags(['foo-2.0'], command=command)
++            self.assertEqual(flags, ['-ltest'])
++
+ 
+ if __name__ == '__main__':
+     unittest.main()
+-- 
+GitLab
+

--===============8426821543113131357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8426821543113131357==--
