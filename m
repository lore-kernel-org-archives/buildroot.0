Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1B3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B8560C21;
	Sun,  6 Feb 2022 10:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fIMXtbu7vPz; Sun,  6 Feb 2022 10:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC4960B6A;
	Sun,  6 Feb 2022 10:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7CF1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B60D54035D
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCAygx8pcn2Q for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:24:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9375C40354
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:24:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 53882E0004;
 Sun,  6 Feb 2022 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644143084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeMs6QnASQQP9QnXnvIE9atwdFUiqdaBI+O5UWvWhcE=;
 b=W4HfH0cwX/jlkhm03gGgUWz+0MAR/PrVWodOvfKK/sG6UKu9xR30SIxWRX0y2thP6IsVud
 ymuqGEQ8i3ZclR+lE1zwH/YJNL1qNNZnth7zNAaOHSZP9+nQ+k1tmb7Bouk9JABy8VTdM+
 2JVIrHMgkbaZ6riJ5nATUmu1ln5gsMbT4cn2ndPLl3jiVs2i+NXxaYro5gSjElNUqH9DuH
 Gd1WNEzmVxsZyNxKHyHGKlylsI6K5Eqjlhyv1FoAL+fvZeqXKesDKViTW9/EWiYOMgBDwh
 sdHA3sahB1KDGdthK8DcmGWVSt5NSb/pwJBJQ0Tv1w/mkj15Da4SInNMlm1qBw==
Date: Sun, 6 Feb 2022 11:24:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220206112443.3c6d0b93@windsurf>
In-Reply-To: <20220203224709.736830-1-fontaine.fabrice@gmail.com>
References: <20220203224709.736830-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/speexdsp: use snapshot tarball
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Feb 2022 23:47:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use snapshot tarball so SPEEXDSP_VERSION will match what is returned by
> https://release-monitoring.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/speexdsp/speexdsp.hash | 2 +-
>  package/speexdsp/speexdsp.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
