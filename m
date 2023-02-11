Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19024C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 15:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90C564039D;
	Sat, 11 Feb 2023 15:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C564039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlwSrmP2qv63; Sat, 11 Feb 2023 15:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C530440360;
	Sat, 11 Feb 2023 15:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C530440360
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7D6E1BF293
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91D6D60ABB
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D6D60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YR2Yg_yGQkFC for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 15:10:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9515E60AA5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9515E60AA5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 15:10:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F0AB55FFA5;
 Sat, 11 Feb 2023 16:10:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 16:10:34 +0100
Date: Sat, 11 Feb 2023 16:10:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230211151034.GH2796@scaer>
MIME-Version: 1.0
Content-Disposition: inline
Iaddn-Reply-To: <20221122203130.184496-5-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676128239;
 bh=1VHC4yqG0QPOKROnfX9qFsTC2Zu/I8bBzHOlSZVNOo8=;
 h=Date:From:To:Cc:Subject:From;
 b=LFR8/MGRnNbEO7wGE+zlsuslaDPOa1GjAwRw78WMugtbelFuNy/1efLBR8Ccdn+m7
 OtOxOSAJHsxD8340icENewY2XjoOrY/GejHXpaMKNNbimIVA8++Ka59bT0kP+dPfdJ
 tlAYxEwsSd4Su0ePCxb6gxEhOJ4F74xg3bJ5IlIm9EOBgzW8UzZ7Dd1KANgcwtAnUz
 YqpldPxSXPVrwtmW5vgBdnl+q1P6SIQLcBRG0d30XcFb9qtMQOi+2Wbp11uEgKiwK9
 I7qtG5uplkARyKpwJZ9/yInD8kqnZpBHJEThOD5IWWDz3bbjcO5PBo9I2udyJinNnT
 TrnMwiZNR129A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LFR8/MGR
Subject: Re: [Buildroot] [PATCH next v2 5/7]
 package/python-magic-wormhole-mailbox-server: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-11-22 21:31 +0100, Julien Olivain spake thusly:
> This package is the main server that Magic-Wormhole clients connect to.
> The server performs store-and-forward delivery for small key-exchange
> and control messages. Bulk data is sent over a direct TCP connection,
> or through a transit-relay.
> 
> https://github.com/magic-wormhole/magic-wormhole-mailbox-server
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
> new file mode 100644
> index 0000000000..db20d3e7b6
> --- /dev/null
> +++ b/package/python-magic-wormhole-mailbox-server/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
> +	bool "python-magic-wormhole-mailbox-server"
> +	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
> +	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> +	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime

python-autobahn depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS,
so this should have been propagated. It's relatively easy to reproduce
on current master as of commit 451672e890b5:

    $ KCONFIG_SEED=0x1D15B9D4 make randconfig
    [...]
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_AUTOBAHN
      Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
      Selected by [y]:
      - BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER [=y] && BR2_PACKAGE_PYTHON3 [=y]

Care to send a fix, and check the other packages that were added in this
series, please?

Regards,
Yann E. MORIN.

> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	select BR2_PACKAGE_PYTHON_TWISTED # runtime
> +	help
> +	  This package is the main server that Magic-Wormhole clients
> +	  connect to. The server performs store-and-forward delivery
> +	  for small key-exchange and control messages. Bulk data is
> +	  sent over a direct TCP connection, or through a
> +	  transit-relay.
> +
> +	  https://github.com/magic-wormhole/magic-wormhole-mailbox-server
> diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
> new file mode 100644
> index 0000000000..c714712641
> --- /dev/null
> +++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/magic-wormhole-mailbox-server/json
> +md5  3da441df1f354a8399a728da3421ac8f  magic-wormhole-mailbox-server-0.4.1.tar.gz
> +sha256  1af10592909caaf519c00e706eac842c5e77f8d4356215fe9c61c7b2258a88fb  magic-wormhole-mailbox-server-0.4.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
> diff --git a/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
> new file mode 100644
> index 0000000000..a3394c7dcd
> --- /dev/null
> +++ b/package/python-magic-wormhole-mailbox-server/python-magic-wormhole-mailbox-server.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-magic-wormhole-mailbox-server
> +#
> +################################################################################
> +
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION = 0.4.1
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SOURCE = magic-wormhole-mailbox-server-$(PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_VERSION).tar.gz
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SITE = https://files.pythonhosted.org/packages/5b/ba/cbb211bc8f8bfdf7fb620d33331f07bcd889c7a28e7fd8a0de9029bb5a2f
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_SETUP_TYPE = setuptools
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE = MIT
> +PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> -- 
> 2.38.1
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
