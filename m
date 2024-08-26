Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC34C5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 11:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60586075D;
	Mon, 26 Aug 2024 11:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45tMrWnGhPFT; Mon, 26 Aug 2024 11:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB6A86071E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB6A86071E;
	Mon, 26 Aug 2024 11:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5471BF282
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1B26071E
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 11:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1Hw_OpmaaYl for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 11:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 695C5605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695C5605B7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 695C5605B7
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 11:05:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.124.82]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1s6kDJ1cjO-00eZ5E; Mon, 26
 Aug 2024 13:05:51 +0200
Message-ID: <6553ac7f-9eac-483f-acdd-23703e5e90e9@gmx.de>
Date: Mon, 26 Aug 2024 13:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20240825092543.2484923-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240825092543.2484923-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:9k55/BqC9RqQXfZ8xufT39b7xJ1G88BVpH+9XVEppymNSlPUy2M
 lWU/Fj157sfe0YCLa05iSjkqW5B5ZfVNWbn7b4FHgUmWZ+72BSShJ7X/mcGTSeg2P1En0Aa
 BugJH8zeM1DRyin3g6EgwcbnQTnmJqqYTLF5pT0QWOU1J3ybE03GjGj+/1qhSEWI5Kyn38L
 lzwfoE52dMTaakYhJERrg==
UI-OutboundReport: notjunk:1;M01:P0:0mmn3qao6BM=;32PgapXvHP7RTi7byW+FJTI/H/J
 FNPskjona0QaOHwvWOPlWMzuL0TCbynN1liA88GTegmBqLiY5f7WURtt3QdjNGl1cU5PYa7JR
 f2eLgkbulDW+Fge7201P8WbR7xPstZ5IzvWKvvhVf0rbvUlkLj75O3u1Wu1dW/JLoKy/7lMjD
 KATFwMBBlfFH7R8pyoAbbCvfJWp0+l8bMSUwBD/DeDCeGFy06wQbzFhh/kYuZFfQLP+Ns70Wk
 pqsskkGAfbC8cWHPnMaQw3oJl4/WtwPrEM+Va9iR8l1qMZ4kC1Cg5D7oqGdxgb2dt/rrL7SOK
 RS4l7t5mdd6cfxr7Md03axq4x7ySzHvxPZU0+pZZlM2GpIrLWPy4XLTuS9lYL+Uj61mkH9bn8
 UQ5D8nsHGVv64MWPRV2Oi/Iin5MSmAaqYTsmoOr5vwk8VJVrQFoQ0pzq3Oh9CZwMg+yix9kWR
 vbr+P9PmrHwRcTDPkqM9Kr8bNciRLvjnh+2DuAsZiPd/1/8MatfLDEs1DHj5XPSUY/mtL4FKU
 ++vzolSsK89LaxsVzpdn5qhmya8CwUZuftcH3SgdiXeAn6QNy7xAf3iyq5otA1bBsN+iTQ4TC
 rW9CssJnkKHmAqxZOQctZa2ZSvqcmAnXdrMjJicnEh58dWXoEXXt/boYeaeHuuyNn1Jkmwtxf
 4sgHQKxP1AN1oMBhJAFyzDnN/GBwwbyj1pMWH8Fv8ab6yUDQpfkVWjWeeMejoMmYdFtlM/MFE
 lcYFWo1sTGxsk3bBPV70xzxbh2k3WEtUaEhRAZkNOhLmjm4mNNKXwJKGHYZCY9hLeGwzw1v0/
 oZYriLLZszxna49rjhOjBA2Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724670351; x=1725275151; i=fiona.klute@gmx.de;
 bh=Rrea99hCFqWnYuJVzGwkGv38xKs5/W+3r23ag0fZNU8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qfbMEF8ZiQyOyGtozSUl69JSpD9TJGaTz4cVzQx4xQIaSE4Q3yWq/XVSbsAIeINu
 OiKcJSVX1seIvUnrEul11iA2iKXultVcwOqYJNGIW21k9u7uUzK3XX8IHBhC0m+rG
 RiBu2voHkRLMn6sLvxZ4L1aqLKohzeM0/W/1UKCpUV9erdV1Gt/v/OiUFdoCSS8r+
 vixLzmMWFAx8vZ65cR6LCz7OYwKqz45TGbyaCeY1d3v+CLKA733MRhOtdSzyEinJf
 VMsSq3ElWeF8aAhy1vz5r3iKCSEQKh22ix8mJet97onTxVlFL1r1HMbjVkvHo6Nqd
 RqDqa+h9ah0JRGkMSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qfbMEF8Z
Subject: Re: [Buildroot] [PATCH] package/gobject-introspection: use objdump
 instead of prelink-cross
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 25.08.24 um 11:25 schrieb Thomas Petazzoni:
> This commit switches the gobject-introspection package from using
> prelink-cross to simply using "objdump -p". This basically implements
> the same change as was done in OpenEmbedded commit:
>
>    https://git.openembedded.org/openembedded-core/commit/?id=767e0880d4d729e659e859dd99c1cdb084b8ba51
>
> In particular, this allows to get rid of the architecture dependency
> of prelink-cross, which wasn't currently encoded, but that was
> actually causing failures such as:
>
> /home/autobuild/autobuild/instance-17/output-1/host/sbin/prelink-rtld: error while loading shared libraries: /lib/libc.so.6: cannot handle TLS data
>
> It also paves the way for removing host-prelink-cross entirely, as the
> only remaining user of it now is dracut.
>
> The test tests.package.test_python_gobject.TestPythonPy3Gobject (which
> uses gobject-introspection) has been tested to run fine after this
> commit.
>
> Fixes:
>
>    http://autobuild.buildroot.net/results/7efa6a18f543752dfe33577f74c20bda3f8b1e65/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Tested with aarch64/musl target, both with and without my pending
libglib2/gobject-introspection update series.

Thanks,
Fiona

> ---
>   .checkpackageignore                           |  1 -
>   ...-error-return-codes-from-ldd-wrapper.patch | 31 -------------------
>   .../g-ir-scanner-lddwrapper.in                |  3 +-
>   .../gobject-introspection.mk                  |  3 +-
>   4 files changed, 3 insertions(+), 35 deletions(-)
>   delete mode 100644 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 81e48bf859..4b1bd6a42e 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -586,7 +586,6 @@ package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_p
>   package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
>   package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
>   package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
> -package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
>   package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
>   package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
> diff --git a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> deleted file mode 100644
> index f1ea518954..0000000000
> --- a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From e0fc4a2a5161a36483ddc518be9bb14390f11b19 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 5 Sep 2018 16:46:52 +0200
> -Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
> -
> -prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
> -It is not an error per se, but it breaks subprocess.check_output().
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ----
> - giscanner/shlibs.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> -index 9f8ab5df..7a1a72fe 100644
> ---- a/giscanner/shlibs.py
> -+++ b/giscanner/shlibs.py
> -@@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
> -             args.extend(['otool', '-L', binary.args[0]])
> -         else:
> -             args.extend(['ldd', binary.args[0]])
> --        output = subprocess.check_output(args)
> -+        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
> -         if isinstance(output, bytes):
> -             output = output.decode("utf-8", "replace")
> -
> ---
> -2.25.1
> -
> diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> index 2f09bca77a..7f3db67da4 100644
> --- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> @@ -1,3 +1,2 @@
>   #!/usr/bin/env sh
> -
> -"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
> +@TARGET_OBJDUMP@ -p "$@"
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index f0c7fcd2ca..ad72af22a2 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -15,7 +15,6 @@ GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scanner
>   GOBJECT_INTROSPECTION_DEPENDENCIES = \
>   	host-autoconf-archive \
>   	host-gobject-introspection \
> -	host-prelink-cross \
>   	host-qemu \
>   	libffi \
>   	libglib2 \
> @@ -78,6 +77,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
>
>   	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
>   		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
> +	$(SED) "s%@TARGET_OBJDUMP@%$(TARGET_OBJDUMP)%" \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
>
>   	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
>   		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
