Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FF9C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CCB6812E7;
	Sun, 25 Sep 2022 20:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CCB6812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtcrnCs46ayz; Sun, 25 Sep 2022 20:48:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581C6812BB;
	Sun, 25 Sep 2022 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581C6812BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B09A21BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99880812A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99880812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pix43tcmbeNA for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:48:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F21F81297
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F21F81297
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:48:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 755911BF204;
 Sun, 25 Sep 2022 20:48:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ocYYA-005JQe-HK; Sun, 25 Sep 2022 22:48:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220912071239.2848460-1-james.hilliard1@gmail.com>
Date: Sun, 25 Sep 2022 22:48:30 +0200
In-Reply-To: <20220912071239.2848460-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 12 Sep 2022 01:12:39 -0600")
Message-ID: <878rm7b2ox.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/icu: clear TARGET env variable
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > If the TARGET env variable is set icu may try to use it.
 > To prevent this from causing issues clear it from the icu env.

 > Fixes:
 >>>> host-icu 70-1 Building
 > PATH="/home/buildroot/buildroot/output/per-package/host-icu/host/bin:/home/buildroot/buildroot/output/per-package/host-icu/host/sbin:/home/buildroot/bin:/home/buildroot/.local/bin:/home/buildroot/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 > PKG_CONFIG="/home/buildroot/buildroot/output/per-package/host-icu/host/bin/pkg-config"
 > PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
 > PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
 > PKG_CONFIG_LIBDIR="/home/buildroot/buildroot/output/per-package/host-icu/host/lib/pkgconfig:/home/buildroot/buildroot/output/per-package/host-icu/host/share/pkgconfig"
 >  /usr/bin/make -j33  -C
 > /home/buildroot/buildroot/output/build/host-icu-70-1/source
 > cd ./config; \
 >     /usr/bin/make -f pkgdataMakefile
 > rm -rf config/icu-config
 > rebuilding config/icucross.mk
 > rebuilding config/icucross.inc
 > /bin/bash ./mkinstalldirs lib
 > /bin/bash ./mkinstalldirs bin
 > /usr/bin/install -c ./config/icu-config-top config/icu-config
 > rm -rf pkgdata.inc
 > chmod u+w config/icu-config
 > mkdir lib
 > mkdir bin
 > LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/Makefile.inc
 > | grep -v '#M#' | uniq >> config/icu-config
 > config/icu-uc.pc updated.
 > config/icu-i18n.pc updated.
 > /usr/bin/make[2]: Making `all' in `stubdata'
 > LC_ALL=C /usr/bin/sed -f ./config/make2sh.sed < ./config/mh-linux |
 > grep -v '#M#' | uniq >> config/icu-config
 > cat ./config/icu-config-bottom >> config/icu-config
 >    (deps)     stubdata.cpp
 > chmod u-w config/icu-config
 > Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
 > make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
