Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0EAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9962C83E5C;
	Sun, 30 Jan 2022 14:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rh-9YDn9pk-w; Sun, 30 Jan 2022 14:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECF483E2F;
	Sun, 30 Jan 2022 14:52:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A9861BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 186784055E
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AVW2QXQY5CB for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:52:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E40C840509
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:52:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD49F40003;
 Sun, 30 Jan 2022 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLs4LV5jeUKhcfS8BgcupL+xqTMrJC3gdsdDLubJIvg=;
 b=D8RpKNGvIO9zUGN17slcivZBQN1VuTT5NnVwYb3tVeZg4ifvRXnKukYEm35Z4GdcKsNKdX
 XBaZQadrYY8sL8FAVuEyNX3W2BdmmyCqH57nyKWIG8Be2dmc9+zaR2+pBGgHOhSdGKUIc9
 7l6h8ru3uWv5kYul0S/7F/mAje/3RoqddTm9p/oSzPkxkmh4xUgzxy7/x/NHiPTGDaKsL+
 HCV94Viiu3LxECMd54ORSA+ytq/VB787McLsmTTwAxs/6EJOzL79DIXcO24TI+Xy9PPJOz
 2igCY+A21utWF/kW8JiyWzpw/Y9qxKuOFyYRrOTUBOuu+4DKQDGqOeKjjrP3Rg==
Date: Sun, 30 Jan 2022 15:52:35 +0100
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Message-ID: <20220130155235.2f51e08a@windsurf>
In-Reply-To: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.70.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 22:42:34 +0100
Thomas Devoogdt <thomas.devoogdt@gmail.com> wrote:

> The internal_pcre option was dropped in:
> https://gitlab.gnome.org/GNOME/glib/-/commit/9fbd7f3dc1f029b64b6991a540402b2bfa98de5c
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
> ---
>  package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
>  package/libglib2/libglib2.hash                     | 4 ++--
>  package/libglib2/libglib2.mk                       | 6 ++----
>  3 files changed, 5 insertions(+), 7 deletions(-)

I've applied, thanks!

It would be nice if you could watch http://autobuild.buildroot.net/ in
the next few days and see if there are any failures related to libglib2
(note: failures can happen in other packages that libglib2), as major
updates of libglib2 have several times caused breakage.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
