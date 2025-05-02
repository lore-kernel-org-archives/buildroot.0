Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7417AC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE3841584;
	Fri,  2 May 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fi2h_Lc6Xx4B; Fri,  2 May 2025 10:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C56441561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C56441561;
	Fri,  2 May 2025 10:57:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B38AEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 217EC606D6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw1wrkym4kIY for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D903606CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D903606CB
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D903606CB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C8691C0F8A; Fri,  2 May 2025 12:57:28 +0200 (CEST)
Message-ID: <cfb509bd-40eb-420c-abbe-a4a7cc4f2d02@rnout.be>
Date: Fri, 2 May 2025 12:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250330142031.919525-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250330142031.919525-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183448; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vo9VtfaUp6b7tyuAaio1Rg6DgkGS8Q2lEUDwlZij7ds=;
 b=btrd1GT6ORsUYMTsCFjPLp0snHfVu0bDqv74VYqMeNWDaJY9Zrsm1iNAe5Ztrj/QTbt5rL
 KwuuS3iKV88nBxlvthP6DL/U21xPU5W5icTH4Iys9nDSFpW7mGXkqq7xwpP69zqVpCuq6l
 4j+hnC/fSozWrhW7T1HtyV/bW+rFPJeMNGKpXYYniBOYEE2o6j3noeBjB1OBoRSCa8fm82
 J7KWvEvyheu/jTjAX3YD0Y/c1qbf6XR3Uky9tiHaAaoC3RuZQdtfVBOC10GUqgI9bAzSQo
 CKvJqYMBXwZg7g9JwmGlBlXGaxgH0HxfwbCQE0fOOzs2jYquXIc3bR7+nJqjng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=btrd1GT6
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new hyperfine runtime
 test
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



On 30/03/2025 16:20, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9568780110
> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_hyperfine.py   | 25 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
>   create mode 100644 support/testing/tests/package/test_hyperfine.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 44f7684c97..13c630432f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1914,6 +1914,7 @@ F:	support/testing/tests/package/test_gstreamer1.py
>   F:	support/testing/tests/package/test_gzip.py
>   F:	support/testing/tests/package/test_highway.py
>   F:	support/testing/tests/package/test_hwloc.py
> +F:	support/testing/tests/package/test_hyperfine.py
>   F:	support/testing/tests/package/test_iozone.py
>   F:	support/testing/tests/package/test_iperf.py
>   F:	support/testing/tests/package/test_iperf3.py
> diff --git a/support/testing/tests/package/test_hyperfine.py b/support/testing/tests/package/test_hyperfine.py
> new file mode 100644
> index 0000000000..4db62c7116
> --- /dev/null
> +++ b/support/testing/tests/package/test_hyperfine.py
> @@ -0,0 +1,25 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestHyperfine(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_HYPERFINE=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        self.assertRunOk("hyperfine --version")
> +
> +        test_cmd = "sleep 0.1"
> +        cmd = f"hyperfine --style basic --runs 10 '{test_cmd}'"
> +        self.assertRunOk(cmd, timeout=15)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
