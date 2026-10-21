Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C743606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RVme2mHy
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0231841BDF;
	Wed, 21 Oct 2026 18:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HvEMbkqL0yG; Wed, 21 Oct 2026 18:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D40FF41B05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792609187;
	b=iyV5Jj+GCeebo826GFeG4ZbY1kMlJaSWt0tJYNATB9JuSNp6Hj9iny1To4omHItwG31B
	 1ejlZMoK05ta9JWOZE3mTtxlv3QMQ1cBKXetaVkokFfv1hiqaZeb8XKEQz6Oke4KFY0/r
	 Xy4OZMqg2vIsTYvpffRujBmbyRovii8UKPtXnx+En2qPibLr2Czj8cNmC3xo6PdIjPr25
	 SOrCopNV4TlNY+xSr1tTd0mPsx/w0JA8UT28yy7A6VNqvIw9fS8vnUhF38U9a15chh4T3
	 MlkEsDid8gLf9pB61nreeVBRj9M/2Z84jESd8fkg//UDxKBiA/EINhGKF9F61fKYPdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792609187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R2k1Dps9+zIW0yzd60ZcBKhpSP7KSkgNeAiKTEJW/dI=;
	b=kAMIj+n03TbuMk28ZpJxMah4xPS2EAwghr8EctFEtgc1KHTbkx6oFzWBzwNMny9v4n9d
	 vcBvbhWt3zct8//lrilTvV8KQxeEnL0rJucS73tNYzBwrIZQ1vLEl8qdZkGCZhpiod8eg
	 GRdewJrAbKadf6kgT0+NOrNb5MJZbNxkC3eqYVjKfumYWnlHwLmmO/dkxMiLISnpSEf8d
	 CFHImMgp0ESZFCqTWXCN6St2n/wzOol+GCuJIO0HVvwJeaAIQgHpXS3eognlKe8ZEgZq0
	 KUynLtkPW/P4sawFbENOsWA9UjHbzBsyIgdeWag7isQAzP6flVDyxZzulbCO++cfKrQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792609186;
	bh=R2k1Dps9+zIW0yzd60ZcBKhpSP7KSkgNeAiKTEJW/dI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RVme2mHyyJa8yVbuOR8v6PszJOHhDFvsy+/bxCfYwV/xsThuvzn4sWUAKUxwEiQrm
	 TdsgobvNg6ZoXwIIiIXSH3HJ5FBT8SjtS9Haw8TLQ7fxZcQkcB+gXHxWhkO/03QMJm
	 W2bGs5WsQb3HP6DCGGN1+eS6OY6ZQjI0N0wAPnObhWY2IS8X3lRLALnOSH6F4lv65C
	 IX+sc254N6Ln62pdfgyMHod0tZz3FcVjpXMx6uCjihqLCR874vrLhyvxmkmFGp3QNI
	 LUhLO39iBDZaj5/bNN90sgmYwpMnZFFo/eqjH0aYBKvXGegsLDen+PG59K7SWBXIkC
	 +BCaxraeQL2fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40FF41B05;
	Wed, 21 Oct 2026 18:59:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBF34769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD6D8705FE
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7K9FZSpl-GW for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:59:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 46C3570F28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792609083;
 b=UboudM4tvbf1zmUnnrFHdaTwB9phr7IjKIXkXDJniQ+39zONRkPCV/hPQst5tSjCw3Ik
 YUVGogfDzz9HRqJBdbOws7Pq0CoxVaq6HF4bRTpcD3naUX/De9HRSzNMxbXfTSRiDYQF9
 jK0i1IRTqim3aYv6d4hssFDNznE6YcBB4KyOzjIjDaj9dZR17SVn3JQLDfYwBjycwTduC
 hQNal48HIqQ74Cws6pq9pTGXy9lwTRyKNHBTQ/gyHLLkT9H9iVTs9bBeld3BLYY2gl3zP
 1MnroTCqTif/87T50NxX4cOE7EP+30o9iI7E43iP1XjvG7XZxFUt8+U7L+QXG3EZPFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792609083;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JlA8PxYhb1FHd15GdLX/MuIZI/SEt0I++YYMbZWGeok=;
 b=gleoG2bDoRBb8cvN9xQFq0dEwlu3TE3p+v/1dkWkuce3Q/tIpqnZ1lCNRVYxNHGLOQSC
 d5e0VRkbtK38Zl8RE4t62faEKjUFaPpzXK21ro67qGU90kn9ovmXb5Ykqe1FSixd7Dak+
 Ey3cKCefYhF23CI709xrWeJoXHQRbcKAvcKBA+2cevJ7agp5RhoUtINADFP6QQwLoIr74
 HE3NPsLYhCZs8yhmKkkkgSJ2FJs31FOg1QteJObC1KAPwxU1KuHryXbe6lFyDoFOGc0aE
 C0VJqKp4SEivwAE/yPoSafEkR5MeT5PJ6xshuot8iUJX37nK6BMD3/YYFcoq5eGsk3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46C3570F28
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:58:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 483BE99A8E; Wed, 21 Oct 2026 18:56:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 20:57:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b2f53da31daf77dcf6e1606f5ca780813cf57fd
X-Git-Newrev: a9b64904b6e6b08e52dd3874b6782283ae4d4d54
X-Patchwork-Hint: ignore
Message-Id: <20261021185639.483BE99A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix host
 build when /bin/sh warns
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9b64904b6e6b08e52dd3874b6782283ae4d4d54
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
