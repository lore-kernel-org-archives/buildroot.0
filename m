Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7839C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A349418F5;
	Fri, 22 Mar 2024 20:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5dH1YzajLYD; Fri, 22 Mar 2024 20:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EEA418DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EEA418DD;
	Fri, 22 Mar 2024 20:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683551BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53ADD60FFA
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olhip4WtMorC for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 663C660751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663C660751
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 663C660751
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:04:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C33DE0004;
 Fri, 22 Mar 2024 20:04:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnl83-006F2Z-1x;
 Fri, 22 Mar 2024 21:04:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240319213722.5078482859@busybox.osuosl.org>
Date: Fri, 22 Mar 2024 21:04:39 +0100
In-Reply-To: <20240319213722.5078482859@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 19 Mar 2024 22:14:57 +0100")
Message-ID: <875xxe2fu0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f68c45f73334b9c83c44e5bbb3d505050f8b720e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
 > j721e) because the optee flavor is missing.

 > We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
 > BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am62x but we actually can use
 > BR2_TARGET_OPTEE_OS_PLATFORM=k3-am62x as explained in the optee-os
 > Makefile [1]:

 >   # If $(PLATFORM) is defined and contains a hyphen, parse it as
 >   # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience

 > This is how meta-ti set the optee-os platform:

 >   meta-ti]$ git grep OPTEEMACHINE
 >   meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
 >   meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
 >   meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
 >   meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
 >   meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
 >   meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
 >   meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
 >   meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
 >   meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
 >   meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
 >   meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
 >   meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
 >   meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
 >   meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

 >   meta-ti uses the OPTEEMACHINE to set optee-os platform [2].

 > [1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
 > [2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

 > Suggested-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
