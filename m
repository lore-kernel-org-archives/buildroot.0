Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D6DFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA06429EB;
	Sun, 26 Apr 2026 15:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaX6j_pH-zsE; Sun, 26 Apr 2026 15:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F09429EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777218404;
	bh=gytBrkhOpWE1v+G8eji2792WPrcDH4wwAnHodZu2zYk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z0ubs52uqat17HEHCDSx4CBbG3STWjbJ1IEc83jKkJubs0pcFm4iH7oWA82NsOBrg
	 p1jXOIA66qyC9KSIQasnjdwRgoeFEd8ppvRXIZF2RQEVv3iPad+XDcvXx4w3k06oL2
	 LnBfTEK16HQtPJDw9nMUmyDgeflguURwpaxSJkZ3S1xAT4+yz7yicgIrLVTGAR46gT
	 SQFIebm74rYvWT6dK2GHfScT2fpnipme01dqQ/+qhg18r4/d+qtAIzvze4MsOXiUDv
	 KA3oquTv6gTkQskI36AEe+7caqX3P0+OToirArHYoOOa9X+6HKm1PSZOsHgj9osNx2
	 4P95gzXNuJV+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92F09429EC;
	Sun, 26 Apr 2026 15:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 888EA2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A44A41FFD
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 672ncDupeILa for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18A514018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18A514018E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18A514018E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:46:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWzk3-1vt7x93hiz-00Pp8B; Sun, 26
 Apr 2026 17:46:39 +0200
Message-ID: <905aa94a-1e74-4f01-94b5-4c8ff8631dec@gmx.de>
Date: Sun, 26 Apr 2026 17:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260426071710.363519-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260426071710.363519-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:I7kSbgAiVSPGF2DAGROHIZGPv4SO5//lBs1U0xkP8+Fz/vwC297
 X0Un+uXacBMLtmNNKhhMBy++qgcsUuVsHrepU2AlD+Ga3v7WiagfBNIHk9vPsnVuFxQEX48
 i0fFUWJ3Gs2qmWe4EJ2kEh/0jSe7cbIGXI5EjseFyvY00Um7X121T1JqFo3MI2AQYL/Cg2v
 239Ljm/MiRqBtpirNW0Ww==
UI-OutboundReport: notjunk:1;M01:P0:Hv0btiEHsrg=;1Mz7EMjWUdX6n9UB/5uK3h2Qscu
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777218399; x=1777823199; i=fiona.klute@gmx.de;
 bh=rb+6D8I4D/VAZR06znnOBJX4mIKmOwaeCN53cZL6G54=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=P/dqxbXvHa1nTujYrzytqhmuYlbNfxqeXhP06pxhsXybu9MkreJzjHgFamqkMSWK
 vMCyLXKnOWW4DJlPKphKsxoS9wWIywUNPj27d+LFvLHcB+/k3PSh5Mi0CTQ1Q8Pty
 mBRas6iDjOVphQGqcEGXQLTO74b/CDh3ph+WddFKpeIwYXwsvBFSrzYGvY6MUR0y8
 Rq0GQ+sFe9sNlbYRsoK16Y7p4VjiGubLPE0Z8mkB4hc56COFR+AejmLU0hUfR2yTS
 bNDTGKpo+VThjLJwvxPwTmALTAkWEtbxgnujLc/0rr4xOrVZ1fvdCSjGH3BD+UB+X
 awVIFR3aP83pYj51Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=P/dqxbXv
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.11.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.04.26 um 09:17 schrieb Bernd Kuhls:
> https://mesonbuild.com/Release-notes-for-1-11-0.html
> 
> Removed patch which is included in this bump.
> 
> Disabled the usage of ccache in mesa3d with BR2_PACKAGE_MESA3D_RUSTICL=y
> due to upstream commit:
> https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
> (bisected https://github.com/mesonbuild/meson/compare/1.10.1...1.10.2 to
>   find the offending commit, the same defconfig works with meson 1.10.1)
> 
> Without this change mesa3d configure is broken:
> 
> output/build/mesa3d-26.0.3/src/gallium/frontends/rusticl/meson.build:420:27:
>   ERROR: No build machine compiler for 'src/gallium/frontends/rusticl/proc/lib.rs'
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Fiona Klute <fiona.klute@gmx.de>

Aarch64 build with 11 meson packages (not mesa3d).

Best regards,
Fiona

> ---
>   package/mesa3d/mesa3d.mk                      |  6 +++
>   ...not-fail-if-only-the-build-machine-u.patch | 45 -------------------
>   package/meson/meson.hash                      |  4 +-
>   package/meson/meson.mk                        |  2 +-
>   4 files changed, 9 insertions(+), 48 deletions(-)
>   delete mode 100644 package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index fb5499de81..047cfaba2a 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -71,6 +71,12 @@ MESA3D_CONF_OPTS += \
>   	-Drust_std=2021 \
>   	-Dmesa-clc-bundle-headers=enabled
>   
> +# meson does not allow ccache
> +# https://github.com/mesonbuild/meson/commit/aac5f78580a3ea1cf0cae487cb46cab68a048660
> +MESA3D_CONF_ENV += \
> +	CC_FOR_BUILD="$(HOSTCC_NOCCACHE)" \
> +	CXX_FOR_BUILD="$(HOSTCXX_NOCCACHE)"
> +
>   MESA3D_MESON_EXTRA_BINARIES += \
>   	rust=['$(HOST_DIR)/bin/rustc','--target=$(RUSTC_TARGET_NAME)'] \
>   	rust_ld='$(TARGET_CROSS)gcc'
> diff --git a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
> deleted file mode 100644
> index 22f9ace42e..0000000000
> --- a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From c1db93be859b360b64fe20d49a286278b56df64e Mon Sep 17 00:00:00 2001
> -From: Paolo Bonzini <pbonzini@redhat.com>
> -Date: Tue, 3 Feb 2026 12:56:36 +0100
> -Subject: [PATCH] ninjabackend: do not fail if only the build machine uses C++
> -
> -This is caused by the introduction of the cpp_importstd option; while
> -target_uses_import_std() tries to protect from the option not existing,
> -this does not work if cpp_importstd exists but build.cpp_importstd does
> -not, and get_option_for_target() wants to look at the latter.
> -
> -Just return false on a KeyError for simplicity.
> -
> -Fixes: #15497
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> -
> -Upstream: https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - mesonbuild/backend/ninjabackend.py | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
> -index 42f24d47d..e0aaa39c4 100644
> ---- a/mesonbuild/backend/ninjabackend.py
> -+++ b/mesonbuild/backend/ninjabackend.py
> -@@ -3297,11 +3297,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47485'''))
> -     def target_uses_import_std(self, target: build.BuildTarget) -> bool:
> -         if 'cpp' not in target.compilers:
> -             return False
> --        if 'cpp_importstd' not in self.environment.coredata.optstore:
> --            return False
> --        if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'false':
> -+        try:
> -+            if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'true':
> -+                return True
> -+        except KeyError:
> -             return False
> --        return True
> -
> -     def handle_cpp_import_std(self, target: build.BuildTarget, compiler):
> -         istd_args = []
> ---
> -2.47.3
> -
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 7ac7c8364d..b2fff8974d 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/mesonbuild/meson/releases/tag/1.10.1
> -sha256  c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317  meson-1.10.1.tar.gz
> +# From https://github.com/mesonbuild/meson/releases/tag/1.11.1
> +sha256  6788ae299979643f8d841bcaf64352558436cae45a0355148a3aeeccf7913866  meson-1.11.1.tar.gz
>   # Locally computed
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 6b2a25f1dd..0a61cc9c0b 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 1.10.1
> +MESON_VERSION = 1.11.1
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
