Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4EC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AA4A60664;
	Fri,  1 Mar 2024 10:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YW4Nu5IMKDL; Fri,  1 Mar 2024 10:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B106066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B106066B;
	Fri,  1 Mar 2024 10:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 476041BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 419ED820D6
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vw2ayfqOGIPj for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9421A81E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9421A81E55
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9421A81E55
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:06:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A74820004;
 Fri,  1 Mar 2024 10:05:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfzmB-006gil-0Q;
 Fri, 01 Mar 2024 11:05:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240207145429.846BB8759B@busybox.osuosl.org>
Date: Fri, 01 Mar 2024 11:05:59 +0100
In-Reply-To: <20240207145429.846BB8759B@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 7 Feb 2024 15:53:49 +0100")
Message-ID: <87v8669shk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/opencv-contrib: propagate
 opencv4 dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a2e01b23fc441a4be4416e68d91e331e00db3bbd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit a7736afacaef (package/opencv4-contrib: properly note dependencies
 > between modules) forgot to propagate the dependencies of selected
 > symbols, causing unmet dependencies warnings (unfortunately, not
 > errors), such as:

 >     $ KCONFIG_SEED=0x9F66F854 make randconfig
 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_DNN
 >       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y]
 >       Selected by [y]:
 >       - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y]

 > Propagate the dependencies and add associated comments.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
