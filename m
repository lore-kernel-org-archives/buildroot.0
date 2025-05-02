Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B9FC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0352641584;
	Fri,  2 May 2025 10:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWLuNsU-JJKw; Fri,  2 May 2025 10:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7967140E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7967140E0B;
	Fri,  2 May 2025 10:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF895EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B28606C4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqMtxFnlKATD for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E229760643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E229760643
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E229760643
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADCD91C0D8C; Fri,  2 May 2025 12:49:09 +0200 (CEST)
Message-ID: <c515dbc2-ca8b-4c3a-82eb-380fe45875dc@rnout.be>
Date: Fri, 2 May 2025 12:49:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250118200659.883230-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250118200659.883230-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182950; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uq32/heAkZ9jJ+/LNjqVx8IJE3MG/whmTsTHJpAM82c=;
 b=DqpijYGFWKiBiK8ecRN6XHKvifltdR86RwNPBf6dOu/rb6l/DuovLJHU7u8svb5EsHib+N
 D6tiAYlNl1torqfkk9b6xgjAUUyuBh/f441xFR0TK0UksvxL4BCnWdse29w8gUqdIgyBp6
 ACHOJBCpljpTwAwlMEGGxP1Ka31aFtmP5i5kUnYGkBggtaoyt5ylVqyydCoVmOPM0CUTX7
 ijkFhUj4Jci/t2APdLfL0W6aHb2ujHlOePqjmzX2okqiBi9+RgmYQT7RIUEoF6H5cJ1ITx
 ho+bZrE45C1OyK3QEhSbt8bDpn8ggfJKOO8yETvm9Ue1XWDqJK7jmUFi5eR6+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DqpijYGF
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add lighttpd runtime
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



On 18/01/2025 21:06, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |  1 +
>   .../testing/tests/package/test_lighttpd.py    | 26 +++++++++++++++++++
>   2 files changed, 27 insertions(+)
>   create mode 100644 support/testing/tests/package/test_lighttpd.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 805b8215ec5..a526afa541c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1847,6 +1847,7 @@ F:	support/testing/tests/package/test_libcamera.py
>   F:	support/testing/tests/package/test_libcamera/
>   F:	support/testing/tests/package/test_libgpgme.py
>   F:	support/testing/tests/package/test_libjxl.py
> +F:	support/testing/tests/package/test_lighttpd.py
>   F:	support/testing/tests/package/test_links.py
>   F:	support/testing/tests/package/test_links/
>   F:	support/testing/tests/package/test_lrzip.py
> diff --git a/support/testing/tests/package/test_lighttpd.py b/support/testing/tests/package/test_lighttpd.py
> new file mode 100644
> index 00000000000..54dd68bcdae
> --- /dev/null
> +++ b/support/testing/tests/package/test_lighttpd.py
> @@ -0,0 +1,26 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestLighttpd(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_LIGHTTPD=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        msg = "Hello Buildroot!"
> +
> +        self.assertRunOk("lighttpd -v")
> +        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
> +        self.assertRunOk("wget http://localhost/index.html")
> +        self.assertRunOk(f"grep -F '{msg}' index.html")

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
