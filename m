Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB43C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 07:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A851401B3;
	Tue, 26 Jul 2022 07:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A851401B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7kgTFjNlu3-2; Tue, 26 Jul 2022 07:08:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5984196E;
	Tue, 26 Jul 2022 07:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5984196E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D120A1BF280
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9B7C60D95
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B7C60D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shqi6CWTcZ1s for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 07:08:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EF460C18
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41EF460C18
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:08:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2447B240009;
 Tue, 26 Jul 2022 07:07:56 +0000 (UTC)
Date: Tue, 26 Jul 2022 09:07:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726090755.2ec1a4a8@windsurf>
In-Reply-To: <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
 <20220726082503.48ce118f@windsurf>
 <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658819278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwLewc6rkZ6tKPDr82ihBRzMjIYoU+CnO1sKDDJUjTM=;
 b=BDITAGNQugVZiN7O/vA/1hPy6hk4x06J+6k85NhnOGzNE+/SZeTAI/h9i8iAsGdnBOUQyC
 ZotRNdGxnT+WC0Of4UkTB7t6IW42FNKodyRXKJXp4FhrrQspE20rm/P1VQb4gxjWZOfKkH
 lZTlp/Um/FXjO9gFpQbVGqEbPAhx5tp6g64mPAkMhvBH/Vfttf41BjIqeZwDbKIRb0bB/Z
 7qkJwknZeygC8SxO5cIGZVA5otXeryiGneRvwktytxm0l79v+Xp0cmoPuUFuJC6zPKajIS
 VD9GMy6/TrvIUjPZH4t4bZ/RIv0Md9pUYrjF5K5ieimjssWQVAJiYOZ9tq4CHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BDITAGNQ
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 00:38:11 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > I *think* this is wrong, at least in the classical autotools sense of
> > prefix vs. DESTDIR.  
> 
> This isn't really different from how we handle target/staging prefix+install.

It is completely different. Do you know the difference between prefix
and DESTDIR?

prefix is the path where the software will be located when executed.

DESTDIR is here to divert the installation.

For host packages, we use prefix=$(HOST_DIR) and no DESTDIR because the
software will be located in $(HOST_DIR) when executed.

For target packages, we use prefix=/usr and DESTDIR=$(TARGET_DIR) /
$(STAGING_DIR) because the software will be located in /usr when
executed on the target, but temporarily during the installation we need
the files to go in $(TARGET_DIR) or $(STAGING_DIR).

See also https://www.gnu.org/prep/standards/html_node/DESTDIR.html.

> > And you should drop --destdir $$(HOST_DIR) here.  
> 
> I recall this didn't work due to pkg-config file generation being prefix based
> which was resulting in pkg-config files being incompatible with per-package
> directories.

And this needs to be investigated since as explained above --prefix /
and --destdir $(HOST_DIR) is most likely incorrect for host packages.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
