Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E12606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 22:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H1U0I0m4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE8E60712;
	Tue, 20 Oct 2026 22:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKbE5hZxWmoL; Tue, 20 Oct 2026 22:13:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9CDC46071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792534396;
	b=X3B/KLP0NgtY7E4dMbHwTo1SXaWA65VGgxvr2zbkgV3+DILX/M+t4hQeaXr9Wv10TxiO
	 i3IcLCTdkZBM3SoMN9eY1ChmrB74BZ+bB6ll/nDm1BUl+dtfymuEo2n1ItYXW+dD9Yw60
	 aJbepudZ4YwzNarSc4Z8JUYrTNCUmIPOGzF4SxVK1Tr8czDByAEBAwgBBKINU+xICxzDi
	 bt2aRGHEuWeuv1tCHTIhGR2u9AOz3KaUI4gzp7u8gecs5xGl1BB8JT+QqRzFi51tWpzeo
	 b/FzT/e/HDQPzlzIuP/JBN0xhMS673oMSV5f138ahozUHOZc9786WOhj7Z5Ti1JGcCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792534396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q/0mNbAEtNaqvknzyV4OrC7gWCh9ofsh1yF2odQfnMc=;
	b=BuSe/dNKVdiB5jAsqZCKwB3GkBLzoSIkD3EqPI75KNINf6J5YIXrI++xFqOjs3n2O2L6
	 jm4mfROHeHZaNTKGYNxnspsR1ATFpBLphaJBj04DXKYEjxXTg47eNBDXEWP90wgaA8TE7
	 EToD2I/nGtSs8YYWwAlFFAT0PbZTfcjNICyJUfJXU+JFhcmNt46PBvZOKrMen13cr7ttW
	 IPGx19S0xHYdp3VnIxAH3cKL231xUPJQvlJoH5ALwC42p71Q/VyU/ifLK/VmJus2an1VA
	 IyOgSCz+i6wMLx2MDAxC+VhPQm4xs6yYneKmnSffKBwTvN9QVUHAeW4zxsTGdAFc8wQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792534396;
	bh=q/0mNbAEtNaqvknzyV4OrC7gWCh9ofsh1yF2odQfnMc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=H1U0I0m4XtVRYbrrVIX530uVWxJFNXUJmul8HMn5wwJ9YdJdWkl54lFLE2zNliWAL
	 jEmT5eMXx2nPuUHGcWIuSBI0GnTMJj2ER6Xdnea+fs3wgXnBZ/pl7QC7qI+CXQqj9Y
	 ZkP6vvXWv8A8qfqMBp1gp73TLRgEcWA0J0gqw0X4UuiofZB02l+ZZMK5kz4VguGYWr
	 a9EgbFXUYKNIp7vK/0LuCInBlm3MAKg8Oc0wB1oXnQHlc6aAwtIheGvTLlyloQTSn/
	 EFl4VsLnZJwAswIf5UDtv9H8v6xQ/ZK+ma/A7cWtYxctVX7y+D+QtZNBywdhU2BxSu
	 DB5YhtnD8rr0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CDC46071D;
	Tue, 20 Oct 2026 22:13:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF6BF769
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94F2D80FB7
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqAdjuAVEHpn for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 22:13:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 32CF380F92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792534393;
 b=LZEUGS1+ECntyuzWeN9QaK2EJ4vlvI/Pcs6GElQ75P+iOfZHRuIU2tUZoIRyTzi0ibuS
 yW1bVNN3Xet/o9GLzOoKuMXE1o3zJThK5kRAn8+qXQLfbrUvmm0rvYmvEpSv6DlXU0bvj
 CZbBFdl77zu8x/QmY0e3rxTu1gN3nSbl2VshSqsMECjg6mvT1/4r/O74sRLBXV4LIhFxs
 VcBbe/IRIAn9W4xy/txMIbYVwYXTq+ypFEWr+zuiaV+psIpfS1CcofzEM9i93993RXrsz
 zhnIA6DS8BwOuSjzbSpaHWAvB/L9CySy9UNFEq1i15e6Cujyx0ZKistDWiWd2K/uCzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792534393;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=fY6r+/bsgNoxS4BqYGSY2ASbq+iCJjwoxQx5xtT9cLE=;
 b=tHBQqm5ghhnwtzDczE2u6Ru4UfhVIbr+v402fifOSMNyV6JQgsDpRYQihbZTQOtE34/S
 SRMG4QpZJfZ/Aw/QAuFGuI6c1CdqAzPw0qIo2igIty7gOJkg2y8ke70Ohn+xAZ5eJHt+p
 rexOU/2+9jfT6a6B1RZXesSYBCNK1dwz+B2JW1MuBaD/uuyK4mnTzHqFOxiULN6qpuL4j
 cO4oqoLaGaRYfWl+eAxOrc01qIKwl4rur9cVv1wbOsDMZ0Z/57JaLkO5JNIW+XJkQ3SoW
 U1yMIG2Uk8ooJL8FCAA3cTVdrc08xYy/L4tTtbfgIpKBs2UX/xn9VjzyC+iMJd/Zpqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=K9G7WDQ0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32CF380F92
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 22:13:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c450ab1483cso2811066b.3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 15:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792534391; x=1793139191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fY6r+/bsgNoxS4BqYGSY2ASbq+iCJjwoxQx5xtT9cLE=;
 b=K2ZZpdJc/jBar/n/6q6d7y7GMqp0ZDAyEFN8VRM6h7BtpffPKPBqBsrF/AEyxDaMSw
 ULAdEF4sDclRVW3KeOJje5oYrgZsPxp3zaSM8/P+V2y7danZo45F/iZBnbwMqam/XOPx
 V6rGVirxWELJOv/6yk6bam5jGrP9guRjM5cSOf70+MNFc06jrQPZeevipWR/DoPEoBek
 6OfUshofjXsp9943G6JbnO3nEGGm3M5rlOQ/RRx1Xs3vrZy3tpOqxaupqfbA0mtdyJ5f
 85lnd6xZ3DBYdYqi2NxwZoo1IKFte96zs1n+YdGcgj9K2RyzCE6+akVs9R/pGM9Xq7ta
 PPGw==
X-Gm-Message-State: AFq9FYK/8fmKVIo19j3JkrRVZwH4k9n6cpUd6MujdBXKIBkIedLJV59f
 1B123CGZb5YIicOTI21kVrBkfndgxlRy6Rbd0Bq6oisZjsaRCUBF8jXP3XVCPA==
X-Gm-Gg: AYBFou3IQB26h945Y3WvTBVlnP1szkRvx9j6LW52sU1LsVD9fCP7papKAiD1XhHnSd0
 6Y7jMyVv9nm/LuaYFwWBLsEUQlQPdy73WXPD8Kff121e0RNSEpCuIyTOkdJLu7mFt7EPJKusmDF
 fgYs4OkA9BIi6Z97BCN3aQU9dSsQbcyDhIVOzHnRonj/2EF59O494lEUel00Xg+H0RXgL4Saz6I
 ZzIz4KMKXZ5mR6DMpVfJHjkN9JOCy/70KMYW8ZRiq/iAjPts7Ib5pzGiQokMniLMmsDodKtNLJ/
 LhwkFmrBGVXiseyImhwa7Fzdd28k8b9zKPjgIimJ4hi4KDfRuTxtoRGL5UdvwfI+GI37TCqot+L
 SfmQOK+zg3gi76kK3Cn30xKB8CT7j019Qz+WhVzLSMUFk7aLkyTWflDHxDmfJuGU/3uTnUN/9jw
 JULJjI2nrCbzRlqy7Kglakrlp/3pqKze1XrC2nDX0rRKUx95PO6lIjaAxr10sJALGJjTjL+1YV1
 ylYSpDBXcdW3bysT0QDzpSoHETdlqIRpsmPP7+AjkgMczdgciZLLg==
X-Received: by 2002:a17:907:9808:b0:c25:4f7c:8ec5 with SMTP id
 a640c23a62f3a-c46796c9aa3mr35334166b.23.1792534390374; 
 Tue, 20 Oct 2026 15:13:10 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678fd7023sm17432266b.50.2026.10.20.15.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 15:13:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 00:13:09 +0200
Message-Id: <20261020221309.4194290-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020212239.4182418-1-yegorslists@googlemail.com>
References: <20261020212239.4182418-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/gobject-introspection: fix host
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
Changes v1 -> v2:
  - backport the earlier upstream MR !561 by Franciszek Stachura,
    which makes the same change, instead of my duplicate MR !568

 ...2-giscanner-Do-parse-stderr-as-flags.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/gobject-introspection/0002-giscanner-Do-parse-stderr-as-flags.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
