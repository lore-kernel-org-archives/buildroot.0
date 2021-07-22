Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482BFC6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 17:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F486109D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 17:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F486109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CA6829EE;
	Thu, 22 Jul 2021 17:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CC25T6H5qGTE; Thu, 22 Jul 2021 17:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA978291C;
	Thu, 22 Jul 2021 17:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 764ED1BF31E
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 17:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7324C827AA
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 17:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4QE8TtAu2c1 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 17:59:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57CF3826D6
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626976752;
 bh=y4HYuCYvEJJbYMNmzVfS7Q4WycW5HEEZwSyvVb0meCo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=STYH7OsvV/q6j/9GzerAl8xvyrEg0M7g2baTIiyJunvhU06uGbRZm5E48fSHAiibm
 iCohLi/QFjA2GPxDtL1Vh4+fxgQfj5WHGd/6jL1fapaAwOyt/xCGcPyImOOO2AXram
 nkH15J60VcP549Ju6AVwg4n9lnKSd3fWXkIChpVk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.131]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1lFE6w1vva-00urm6; Thu, 22
 Jul 2021 19:59:12 +0200
Date: Thu, 22 Jul 2021 19:59:11 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Scott Bartolett <SBartolett@thorlabs.com>
Message-ID: <20210722195911.6cd864df@gmx.net>
In-Reply-To: <SJ0PR08MB6542F0679D01DEF2541E4B61B8E39@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542F0679D01DEF2541E4B61B8E39@SJ0PR08MB6542.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9I/pO6sZyTzeWcBxF/nOnxtVFdBo9qrAHvWNnihn+Hxt36KfYlJ
 FIh0IXjOafOhjXRjuaw7HsKBCu4NiKSCkhV5uVgNN9tAoR6UnAcJCI2T1zycZsrljsxLMxx
 uAVvVxGHMBV+Fjv92ePY2bf2iMqrdUKNQvmliljbnt8VSpHJlHYil7+Icn6JHgwOtw939D3
 ftMY9rji80n1zGI0irHtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uXeDh3fiZyA=:ol3YZS9H99xcIngrqNuKXV
 vZULFt42UqFkaEGqo5Kkhr/cojpvKHVTwZK+jQKRup7NkjVk0X71PnWzij5cklWrL4jpdrRjK
 rJTyWAR4lMeKIVqfpZgQfsJsbcoS+mSJm344lHRNXdW/zJw7HcqgLAa/Ex/GwBBm2NOn5U8C2
 jxJbUqRjY0dNQPkt0lG1G4v7C161z/iV7DdpcuQ8T/Bzt6V6tsmMivOQTYrSJqMsuwGfPN7Vz
 87fmRU6+PotU+FWkYUTpmIkvt0g02XCR2brLiG78cQYxxlufH9odIKqnsIaelM2xmfLAF7LX5
 7EM30FYsZI5nJVaH3pagsaIo44BgWVESfNhpeMmoDXPc5eHLsv64GezsxvAjiAPVMmHBDEc9B
 oHAZ3FXVIpnt0E1HlVa7JR/l8OeZFye3FDUeOsjcfDPSq8/miDdspvyWqahoKzhfDSqXfHc5g
 SyQpZrfWjP+BpIQt90HAQGqDsaG/lCjEYJghdI5+2AtmGCCL3CVRvZiZscmpEJgU+NV8cjQQj
 dIEOskOfwrZldS3VDRdqyHcD8uZUhBaKU71n5MtCv7VSk06pSzKaHltYLjmpNHgk0iX3hGnf1
 fB1pwB05Gny+WWZE61lrrtCjyd2cftn4sPyD2EFhfU29Jcb1U5+eTLgWYnroI8AV+b5kp24ZT
 ULgdL1rWjX/I99z/jctExnJYMrONZYziV5FRFX4jFK7fl4xW7Oy5Ferb1jiDyL3R+vRrXvMyt
 P6MZ6aUEQoA+CcqBIeRK6EdZ2Ba9zmiEg9vqkFiWR3i/FHQwmxQQH1Cw0Q+PvI86LwVdpn4H5
 KsFti2nuuQlcF/b6foIEdJwO4FrSNBa0JElw3SIB5q2q1gYmMpISVxmIU1QOjXu1eGhnDFQoJ
 89NKdapO4TgZtmX62oMwEDCFYhzuLmUc/XUk4vmz+kAzTwiyIlnOgdXOh/FgV4m3z9hUCFcrN
 Rj+bhdQNdKe9p+g0tPzUrgAExz3h6bP5DCPJr9fh4eCCANk7WjlCrLlIp86XVInAJDkToB7e0
 mNDHK+OaO08vYpTY5LMhjWZ9ta79GY7Yn8WkHKMV3Il8zvMP/VTumXI2MQfzKH2JhExZ7E1YI
 F0n7mmF8gBmPVBlC4b5yJB2ZAPwJGd0yla2
Subject: Re: [Buildroot] BR2_PACKAGE_QT5BASE_MYSQL error
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Scott,

On Wed, 21 Jul 2021 21:21:47 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
> 
> I'm getting the following error when I enable the Qt5 MySQL Plugin - BR2_PACKAGE_QT5BASE_MYSQL.
> 
> ERROR: Feature 'sql-mysql' was enabled, but the pre-condition 'libs.mysql' failed.
> make[1]: *** [package/pkg-generic.mk:240: /home/vytran/buildroot-2021.05/output/build/qt5base-5.15.2/.stamp_configured] Error 3
> make: *** [Makefile:84: _all] Error 2
> 
> 
> I have the following:
> 
> BR2_PACKAGE_MYSQL = y
> BR2_PACKAGE_HAS_MYSQL = y
> BR2_PACKAGE_PROVIDES_MYSQL = mariadb
> BR2_PACKAGE_QT5BASE_MYSQL = y
> 
> When I disable BR2_PACKAGE_QT5BASE_MYSQL, it builds ok and MySQL works fine.  But my Qt application cannot find and drivers.  I assume I need the Qt5 MySQL Plugin for that.

From the qt5base configure step:

  Trying source 0 (type mysqlConfig) of library mysql ...
  + .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config --version
  > .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config: line 100: \
    .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: cannot execute binary file: Exec format error

And:

	$ file host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config
	host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 5.10.0, with debug_info, not stripped

Seems the mariadb_config executable (used from the mysql_config script) is
cross-compiled for the target instead compiled nativ for the host...

Your can work-around/fix it by (after qt5base failure, adjust pathes for your need,
e.g. mariabdb-10.3.28, etc):

	$ gcc -I ./build/mariadb-10.3.30/libmariadb/include -o host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config build/mariadb-10.3.30/libmariadb/mariadb_config/mariadb_config.c
	$ rm -rf build/qt5base-5.15.2


And restart the build...

Regards,
Peter

> 
> I'm using Buildroot 2021.05.
> Regards,
> Scott

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
