Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF11C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 17:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B26817A7;
	Mon, 18 Dec 2023 17:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54B26817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WOZu-XxBzEl2; Mon, 18 Dec 2023 17:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804DD817AE;
	Mon, 18 Dec 2023 17:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804DD817AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3AD11BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97DC8405E6
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 17:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DC8405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fl3ILcptACCE for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 17:31:14 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3556A4056F
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 17:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3556A4056F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F351EB0055E;
 Mon, 18 Dec 2023 18:31:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 18:31:08 +0100
Date: Mon, 18 Dec 2023 18:31:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYCB3EqymtRdzOzd@landeda>
References: <20231102184154.46185-1-adam.duskett@amarulasolutions.com>
 <20231102184154.46185-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102184154.46185-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702920671;
 bh=yn9nnFseUauPeVXxvRimctJI4XXFA7bXQ1/Rm5CY9Bo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FeQQHL/eYSbCla0DNrf5ckYHYebzu2sxp/5C1OrVdMV81PLa1tY6STA73ni/hR6BN
 e4c85DIF9zelNmuU/pmWfJ1KnGCKEG8J/zGei6lSCjb2U0wcOSaBKWFXXrkfFTRuud
 TBJejAN2RvGdKFYd7KXTkq7IgPmNEe4rNQ4tf6N1foVZ9O+0qfTk4mjFEtB4qGTxoO
 WcQPS4Esxzz2D4J30lJDfQnNI6FzxAlOWIIL0qWKuObbaoFNYFIHuTX2/OnbDO2Y73
 GsLD5PQyk34KfcvD0S8tAINi3aQ+TBe+YQu5kUg3AIPvD8O6FOSNXUfb5Mr/fo02kZ
 HrEdlL1JuWZEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FeQQHL/e
Subject: Re: [Buildroot] [PATCH v2 2/2]
 support/testing/tests/package/test_postgresql.py: new test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-02 12:41 -0600, Adam Duskett spake thusly:
> Perform a basic check that performs the following:
>   - Check if /var/lib/pgsql/postmaster.pid exists.
>   - Check if 'psql -c SHOW server_version;' returns sucessfully.

Thanks for this new runtime test!

> Note: systemd takes quite a while to start up, so check the output of
>       `systemctl is-active postgresql` until it shows "active" with a timeout
>       of 15 seconds.

I think that we already concluded that testing if a unit was active or
not was not representing whether the service was actually running. In
the fultter test case for example, the unit was active, but the flutter
app was just keeping crashing again and again, so the test wsa failing
to detect failure...

So, I don't think usingt is-active is a good way to test whether a
service is actually running.

Furthermore, the unit may be active, but the service might not yet be
ready to serve, so again I don;t think it is still valid to reply on it.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   - Drop BR2_PER_PACKAGE_DIRECTORIES (Thomas)

Actually, I disagree with Thomas here: we added support for PPD in the
infra, so that if PPD is enabled in a test, then TLPB is done to speed
up the test.

[--SNIP--]
> diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
> new file mode 100644
> index 0000000000..fa692bab7b
> --- /dev/null
> +++ b/support/testing/tests/package/test_postgresql.py
> @@ -0,0 +1,73 @@
> +import os
> +import time
> +import infra.basetest
> +
> +
> +class TestPostgreSQLInitSysV(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_POSTGRESQL=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        self.emulator.boot(
> +            arch="armv5",
> +            kernel="builtin",
> +            options=["-drive", f"file={img},if=scsi,format=raw"],
> +            kernel_cmdline=["root=/dev/sda"])
> +        self.emulator.login()
> +
> +        # Check if the Daemon is running
> +        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
> +        # Check if we can connect to the database.
> +        self.assertRunOk("su postgres -c \"psql -c 'SHOW server_version;'\"")

I don't understand why we need to test for the PID file before we
connect to the daemon. If the daemon is not running, we won't be able to
connect to it, so the test will fail, so the PID file test is redundant,
no?

Regards,
Yann E. MORIN.

> +
> +class TestPostgreSQLInitSystemd(infra.basetest.BRTest):
> +    # Taken from test_systemd.py
> +    config = """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_INIT_SYSTEMD=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_PACKAGE_POSTGRESQL=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        self.emulator.boot(
> +            arch="armv7",
> +            kernel="builtin",
> +            options=["-drive", f"file={img},if=sd,format=raw"],
> +            kernel_cmdline=["root=/dev/mmcblk0"])
> +        self.emulator.login()
> +
> +        # It may take some time for PostgreSQL to finish startup. Give it at least 15 seconds.
> +        is_active = False
> +        for i in range(15):
> +            output, _ = self.emulator.run("systemctl is-active postgresql")
> +            if output[0] == "active":
> +                is_active = True
> +                break
> +            time.sleep(1)
> +        if not is_active:
> +            self.fail("postgresql failed to activate!")
> +
> +        # Check if the Daemon is running
> +        self.assertRunOk("ls /var/lib/pgsql/postmaster.pid")
> +
> +        # Check if we can connect to the database.
> +        self.assertRunOk("cd / && su postgres -c \"psql -c 'SHOW server_version;'\"")
> -- 
> 2.41.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
