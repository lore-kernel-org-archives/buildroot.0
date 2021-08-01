Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFF2C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:49:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6A9610A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB6A9610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A316078F;
	Sun,  1 Aug 2021 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2_Xl7mnA4Hi; Sun,  1 Aug 2021 09:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FC860666;
	Sun,  1 Aug 2021 09:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4341BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A6AD83C40
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiSMgyXMxSk8 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D331482925
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:48:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5974BE0006;
 Sun,  1 Aug 2021 09:48:02 +0000 (UTC)
Date: Sun, 1 Aug 2021 11:48:01 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801114801.76b2f412@windsurf>
In-Reply-To: <20210801082919.2716993-1-fontaine.fabrice@gmail.com>
References: <20210801082919.2716993-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cegui: needs gcc >= 5
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun,  1 Aug 2021 10:29:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cegui needs gcc >= 5 since bump to current master in commit
> 352a8b3fe8b1d78073b1119369f10688e00bc859 and
> https://github.com/cegui/cegui/commit/17f7f6156eb0ba903d5ae926e372b8c5c26d8c68
> or the build will fail on:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp: In member function 'virtual CEGUI::String CEGUI::Spinner::getTextFromValue() const':
> /home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/widgets/Spinner.cpp:310:116: error: 'defaultfloat' is not a member of 'std'
>              tmp << std::fixed << std::setprecision(d_precision) << d_currentValue << std::setprecision(defPrec) << std::defaultfloat;
>                                                                                                                     ^
> 
> defaultfloat is not available before gcc 5 and
> https://github.com/gcc-mirror/gcc/commit/c4b64f5bcac6f7d5e1ae7d3026a3e228fb8adbbd
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/006ce109980a76870d2347e53307082b36d9904a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cegui/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
