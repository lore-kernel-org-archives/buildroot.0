Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BD0C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81ACA6130C;
	Fri, 16 May 2025 17:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHR8N50RtJUC; Fri, 16 May 2025 17:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B71613B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B71613B9;
	Fri, 16 May 2025 17:59:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0688913D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FE3341786
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCaWYZQ_uNbr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4561C41779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4561C41779
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4561C41779
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F17661C1014; Fri, 16 May 2025 19:59:37 +0200 (CEST)
Message-ID: <24710c82-5e14-49cb-88e4-7b1037beff72@rnout.be>
Date: Fri, 16 May 2025 18:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
 <20250408-libcamera-qcam-v1-1-680c8a48dc17@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250408-libcamera-qcam-v1-1-680c8a48dc17@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4y0hmjts6fDxOJ1IdOnSTtufQI2P4br6OdmSme/kHD8=;
 b=BZ2YHC6VYUPqbX8sX4t5wPYeTdYQdFZCzs+YVSc8+uN6iZtqMMpM7k+/J/UEyHy9nKdQQh
 mj/2z1TKciA20H6cbLkBEayVu3C3GTWsa2buvZ6exB32iIl17Okn7bwYrc80dZuyDFlEsI
 bv/ilOHih+y44Mv6oYefMyM8w1H1hwZtTCLTTjN5l6A1ryI78BC6mPT3eWVyya72uevoga
 FBLTqx7Et8Dj9TErftcGxJsKZyBJp2qwP4mHMAaZ6N/nKWCjF1dWDU7pwQ3/F3qpYs0ocs
 kKP/6U5CdwiF57ar4tr8uc0Zaoyg5T9XIkA4tA8AFzjeZGRRWPWo6VRD1fHxpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BZ2YHC6V
Subject: Re: [Buildroot] [PATCH RFC 1/2] package/meson: look for qt6 tools
 on Buildroot host machine
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/04/2025 17:16, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Qt tools that are looked by the meson qt module are only required as a
> build time dependency, to be run on the Buildroot host machine.
> 
> Therefore, meson should be looking for them on the host machine and not
> on the Buildroot target.
> 
> This fixes Buildroot meson not being able to find the qt6 tools whenever
> necessary (e.g. for libcamera qcam, whose support is added in a later
> commit).

  As mentioned in the other thread, we should take the upstream fixes instead.

  Regards,
  Arnout

> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   ...e-look-for-qt-tools-only-on-build-machine.patch | 56 ++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch b/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..c00ae0dbc3c63296afdc8a3d245091ee8337ddd8
> --- /dev/null
> +++ b/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch
> @@ -0,0 +1,56 @@
> +From b42daeeb3396df1a02c95d2f583058a74e7854e3 Mon Sep 17 00:00:00 2001
> +From: Quentin Schulz <quentin.schulz@cherry.de>
> +Date: Tue, 18 Mar 2025 15:07:53 +0100
> +Subject: [PATCH] qt module: look for qt tools only on build machine
> +
> +Qt tools may be needed at build time, let's make their detection based
> +on the build machine rather than the host machine as currently done.
> +
> +This incidentally fixes cross-compilation search for moc, rcc, uic and
> +lrelease Qt tools because they are installed in libexec dir and that
> +path is somehow not properly looked for otherwise.
> +
> +Before:
> +
> +"""
> +Detecting Qt6 tools
> +Run-time dependency qt6 (modules: Core) found: YES 6.8.1 (pkg-config)
> +Program /usr/bin/moc found: NO
> +Program /usr/lib/qt6/libexec/moc found: NO
> +Program moc6 found: NO
> +Program moc-qt6 found: NO
> +Program moc found: NO
> +"""
> +
> +After:
> +
> +"""
> +Detecting Qt6 tools
> +Found pkg-config: YES (/home/qschulz/work/upstream/buildroot/output/host/bin/pkg-config) 2.3.0
> +Build-time dependency qt6 (modules: Core) found: YES 6.8.1 (pkg-config)
> +Program /home/qschulz/work/upstream/buildroot/output/host/bin/moc found: NO
> +Program /home/qschulz/work/upstream/buildroot/output/host/libexec/moc found: YES 6.8.1 6.8.1 (/home/qschulz/work/upstream/buildroot/output/host/libexec/moc)
> +"""
> +
> +Suggested-by: Ross Burton <ross.burton@arm.com>
> +Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> +Upstream: Submitted [https://github.com/mesonbuild/meson/pull/14381]
> +Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> +---
> + mesonbuild/modules/_qt.py | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/mesonbuild/modules/_qt.py b/mesonbuild/modules/_qt.py
> +index 7d52842f9..309068c51 100644
> +--- a/mesonbuild/modules/_qt.py
> ++++ b/mesonbuild/modules/_qt.py
> +@@ -270,6 +270,9 @@ class QtBaseModule(ExtensionModule):
> +         self._tools_detected = True
> +         mlog.log(f'Detecting Qt{self.qt_version} tools')
> +         kwargs = {'required': required, 'modules': 'Core', 'method': method}
> ++        # Tools are for compile-time steps, so force native check for
> ++        # compatibility with cross-compile scenarios
> ++        kwargs["native"] = True
> +         # Just pick one to make mypy happy
> +         qt = T.cast('QtPkgConfigDependency', find_external_dependency(f'qt{self.qt_version}', state.environment, kwargs))
> +         if qt.found():
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
