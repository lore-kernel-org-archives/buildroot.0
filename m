Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0009FE7718C
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 21:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2A3412D3;
	Fri, 20 Dec 2024 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2DQFEp4_pIl; Fri, 20 Dec 2024 21:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FAD54125F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FAD54125F;
	Fri, 20 Dec 2024 21:03:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE3EA920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F7241255
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMZAypzBxwXD for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 21:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.153;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D44484125F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D44484125F
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D44484125F
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:03:50 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id DC6E82092030;
 Fri, 20 Dec 2024 22:03:48 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id V2EEgqsbA6x7; Fri, 20 Dec 2024 22:03:47 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id CD95D2092286;
 Fri, 20 Dec 2024 22:03:47 +0100 (CET)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 9E67020D3282;
 Fri, 20 Dec 2024 22:03:47 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 22:03:47 +0100
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241109175509.1364647-2-ju.o@free.fr>
References: <20241109175509.1364647-1-ju.o@free.fr>
 <20241109175509.1364647-2-ju.o@free.fr>
Message-ID: <6f0a8cf5398ae61a9405eee406b818ef@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:content-type:content-type:message-id
 :references:in-reply-to:subject:subject:from:from:date:date
 :mime-version:received:received:received; s=dkim20240523; t=
 1734728627; x=1736543028; bh=yK9rP80BbxJ2c4sCqoUW1TsQ7YCdYsnlVaw
 h+NjzUb0=; b=hYYpTPgR6CjZ4JLj1qU0xauGSpM+SiWZScRidgUN8MfDI4M8rCY
 lw9jiAYAbjdBqaWtydacdKBey7AqXrKj9shxT8CeTVsMpezmudBCiHMKpg++ejN/
 QiSdnB5lZiWCH9zV9ycpk46Aw1oNcBZG26CnJwfdR5Zf16/MdArtk4EuycQMnqel
 1IRanTfOsXeM1AfGJzsAHzAzHTX72+b7iP/cgiild/Up1sBfwuVVYznADJMZZnHo
 5twk+vgLf6zra3dd0L+gPOBqFyx35qxfjNqird8/FjPxyEBrG8UJ1WWdvRN2EV9e
 c9Esu+TVax0g/a3mszeA3CXX1s3h/5qtKlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=hYYpTPgR
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: new proj runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-11-09 18:55, Julien Olivain wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Reviewed-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
> Patch series runtime tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8316072722
> ---
> DEVELOPERS                                 |  1 +
> support/testing/tests/package/test_proj.py | 59 ++++++++++++++++++++++
> 2 files changed, 60 insertions(+)
> create mode 100644 support/testing/tests/package/test_proj.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1d70e46e8d..1eb2a58502 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1970,6 +1970,7 @@ F:    support/testing/tests/package/test_pigz.py
> F:    support/testing/tests/package/test_postgresql.py
> F:    support/testing/tests/package/test_pppd.py
> F:    support/testing/tests/package/test_pppd/
> +F:    support/testing/tests/package/test_proj.py
> F:    support/testing/tests/package/test_pv.py
> F:    support/testing/tests/package/test_python_distro.py
> F:    support/testing/tests/package/test_python_gnupg.py
> diff --git a/support/testing/tests/package/test_proj.py 
> b/support/testing/tests/package/test_proj.py
> new file mode 100644
> index 0000000000..ed23c229fd
> --- /dev/null
> +++ b/support/testing/tests/package/test_proj.py
> @@ -0,0 +1,59 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestProj(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_PROJ=y
> +        BR2_PACKAGE_PROJ_APPS=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", 
> "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can run. The "proj" command does not
> +        # have a "--version" option. It will just show its version
> +        # when invoked without any argument.
> +        self.assertRunOk("proj")
> +
> +        # The commands in this tests are taken from the Proj
> +        # documentation quickstart page, at:
> +        # https://proj.org/en/9.5/usage/quickstart.html
> +
> +        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80"
> +        cmd = "echo 55.2 12.2"
> +        cmd += f" | proj {proj_str}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        expected_values = [3399483.80, 752085.60]
> +        values = list(map(lambda x: float(x), out[0].split()))
> +        for i in range(len(expected_values)):
> +            self.assertAlmostEqual(values[i], expected_values[i])
> +
> +        proj_str = "+proj=merc +lat_ts=56.5 +ellps=GRS80 +to +proj=utm 
> +zone=32"
> +        cmd = "echo 3399483.80 752085.60"
> +        cmd += f" | cs2cs {proj_str}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        expected_values = [6103992.36, 1924052.47, 0.00]
> +        values = list(map(lambda x: float(x), out[0].split()))
> +        for i in range(len(expected_values)):
> +            self.assertAlmostEqual(values[i], expected_values[i])
> +
> +        proj_str = "+init=epsg:4326 +to +init=epsg:25832"
> +        cmd = "echo 56 12"
> +        cmd += f" | cs2cs {proj_str}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        expected_values = [6231950.54, 1920310.71, 0.00]
> +        values = list(map(lambda x: float(x), out[0].split()))
> +        for i in range(len(expected_values)):
> +            self.assertAlmostEqual(values[i], expected_values[i])


-- 
https://zgyarmati.de
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
