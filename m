Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC646C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84F4A405EF;
	Sat,  8 Jun 2024 11:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xxYZBCX7gqC; Sat,  8 Jun 2024 11:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33388405F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33388405F2;
	Sat,  8 Jun 2024 11:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63AEF1BF589
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DD5A82168
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQnQWwi8eeKJ for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E94482159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E94482159
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E94482159
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:13:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4C36240002;
 Sat,  8 Jun 2024 11:13:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFu10-00GpMz-0F;
 Sat, 08 Jun 2024 13:13:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240512100524.15346-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 13:13:42 +0200
In-Reply-To: <20240512100524.15346-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 May 2024 12:05:24 +0200")
Message-ID: <87y17f7km1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] toolchain/Config.in: update BR2_TOOLCHAIN_HAS_LIBATOMIC
 dependencies
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update BR2_TOOLCHAIN_HAS_LIBATOMIC dependencies to avoid the following
 > build failure with libopenssl and
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE:

 > /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libcrypto.a(libcrypto-lib-threads_pthread.o): in function `CRYPTO_atomic_or':
 > threads_pthread.c:(.text+0xfa): undefined reference to `__atomic_is_lock_free'

 > libatomic is available since gcc 4.8, when thread support is enabled.
 > However, the gcc logic in libatomic/configure.tgt does not recognize
 > "uclinux" as a valid OS part of the target tuple, and therefore it
 > does not build libatomic. The "uclinux" part of the tuple is used by
 > Buildroot when BR2_BINFMT_FLAT=y [1]. This broken logic has only been
 > fixed for arm since gcc 10.1.0 [2].

 > Indeed, bootlin armv7m is an uclibc toolchain compiled with atomic
 > support through libatomic.

 > [1] https://git.buildroot.net/buildroot/commit/?id=b3d1fb26dcadd8c570e2c415ce05398ecc810b32
 > [2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b1e21e5a5d19b436f948710e09157c5b3244f541

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d25e898f9715bf6a21284807361a57735a7a2e1d
 >  - http://autobuild.buildroot.org/results/e37ed5ad6ba41d610bffe9c234f699e203ef5069

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update dependencies to enable libatomic with uclibc only on arm with
 >    gcc 10

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
