Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790BE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jWt768ZW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5275A40D11;
	Fri, 30 Oct 2026 14:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzOaC3Df42TC; Fri, 30 Oct 2026 14:18:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 443D440D0E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369927;
	b=LYf1ZNOqB/6OmvxO44yVWQVQwLeYZTK3N0Da9V+1+GnPNlaXF2F1SOFrwmH4LfRXDTCZ
	 PK00fjtYNXm2AUo3uB8yTWM434+pxR3oci2+nMdZ+pg32/lWKsYUqG4XShECZ+P9tpuox
	 yoE1UwWOjm8YrnPnWJHl4eYiZpzw1aejytIl7YsFphpD7vty51Pk4SIwSNW+/mQMMj9G3
	 gaLcNHz/zyHHVspieBFbruoGPL4S3wZsVBzihZZarlnMzpne8nkfo1GfIMOy7KYxSlKUz
	 Yrcc3KzDnb+5v5i4Y/I6OQS0g58Izisk+tDaic7FYJbxHBDFtytyXDjw1Bv2Yb5lRew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UYdn4ars6kWCLQ2N3cdCOk90a6DkREgD1XVRyRJoq0E=;
	b=cJ1Q61z86hLrALll3TOXlVXkDBub2EssW1aLTqw26rkFj0ZyJlY/veaTMAbBu2W1Po4m
	 wupr/C38RhpZeSgyzm81hxilYfuHBxuNZXH7BjSeukYaa8mL/eWmALe4vbBPD1B3C35Bf
	 5ONnSpmsGUB3XlzCUtdd9ZxBc5Vii7LKirRoji+p8OJZuV7teouBtvme8SOo3+PUMcN/3
	 qEAqD9h5qrh98N6Dwj5g5oqwcxwhjbaVGLZB9w5EmkNTCmCOqsTcIDRgP3Ed/MsW6oWPd
	 Gckr39y22WK3MAptRGfsT2x9nQtItK09dB0XFvlp0XgumMFithhjX9C1S1ZpULF7JYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369927;
	bh=UYdn4ars6kWCLQ2N3cdCOk90a6DkREgD1XVRyRJoq0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jWt768ZWTuuFOpNRFXl7QfX68BWjiX/qPUWolqhJv2TseOYX5j8XdUL+Aii2HBzMZ
	 ZXT2e1z5qva6f1CjbZBadi09S3iceFBku0qRrP0M9db26C58ehx/wqkdI+wBt3cWej
	 6wwp/Sp8+PKjFvVi37jBQMptpRwADQPxTc7AEWIw6WCFL2UYaIdPaom0YIELruZKlO
	 PxLLIS7jxrnZWxeCJaBIujEe+c2WJVV9k/m+1SQb1EN3P48p8w3SCD/5gQ1AASIJAu
	 zyiSiRweqSc4x7sdqA3QUeZLFojg8jYlI16B3uYkiHU/E+5gCg/xKfntyr0jTgvpT/
	 G3npgCxOFu1Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443D440D0E;
	Fri, 30 Oct 2026 14:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CDF2D46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DCFC81135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QljSA9n78Rj5 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 40BF4810B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=UfqnjEMcKPeoCsrwu3ldj3EGCQ3DiDamgKdLXLoW7bjR0Yh5unR7wBiH52pCYzp0UXa+
 RihBDUyTfDFydH3u6YD8pcjCsquYBmhxOG+Yeaq9ZoTOFWGff5ZQAHqF3ZY3rId79s0GE
 S3WeATZjYsOItubAhFneLhCN84o+/awBa/Ag7DGGGZGIo4fs9vktry6DBDoV6G0PtnfCC
 6qujEy+O78ie8Rkk4q0Cl+WUFPQcJxaK8q8BDbIMlr1M5og+WamjZz17Hxgpc+8zB8mYw
 MG9L14J0MKq6O59IsK3hapWPMpXHAOsCmJxtZKgJx//9hbjwm2xeP5bhM57vUSvwhXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YrwEpyGnDDBmX2kgC9FkbABtd3gvdiMeCOs74jj9Vb0=;
 b=Ni4a2Sl6uEGvyVU0i31aXz9OtjHi1TC7CiJZxdjcqHU/P1kZoRdVW7AwlQmt1F6PtbR8
 YbZztg7jEaO602jnYcMKUNQAKhf9zgc/h8vKZoSqrJDSKAREOfX1jtQQGHaS6tHtoMVYa
 RDV4aHYjJjnl3YZY/upzM8zWYinjjYlLwQ3C1PS9VHaEP6So3KLYBGsu2chHQ295jYAE3
 CrlccWYXQ2+UOMXulMD6k38NKYAH/lvyflXVbY5BIhqgV4hWchG1HzVYM9k+68j6iI9Ub
 q9nr7b+3zkGqjB+dRW/SKWINSmCr5q2GYRj1y4F/myQEi2YLUGCkipk+r+UohnwiUIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40BF4810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 604949D389; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:06 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 49ff530efe939e59479ac06a090963d7443055e0
X-Git-Newrev: d717b9b02620abdc0c995b59a3f9df7803a769ee
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.604949D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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
Content-Type: multipart/mixed; boundary="===============5353829445170834722=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5353829445170834722==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d717b9b02620abdc0c995b59a3f9df7803a769ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5353829445170834722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5353829445170834722==--
