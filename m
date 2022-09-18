Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09989C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9527F6114C;
	Sun, 18 Sep 2022 10:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9527F6114C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_POgJUQ0o4r; Sun, 18 Sep 2022 10:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C13F560E36;
	Sun, 18 Sep 2022 10:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C13F560E36
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC061BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D12054012E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12054012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgT7j1dU2vqO for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:41:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52934011C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B52934011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:41:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A63A740002;
 Sun, 18 Sep 2022 10:41:39 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:41:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918124138.25b112d2@windsurf>
In-Reply-To: <20220826135503.20612-18-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-18-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663497699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG9vLmctecZRaPuoriZVNj9D0VyshKUs5HH6laenCRU=;
 b=SNVJa9PMeJE69wn+aKjHzqQoyF/MW+wirZQ21q9mklhsieVX471AYPtbEZW4doiMkC7cej
 UD2UUaukJCqu5tuqGhbBc2H7ZDWuwSgi80PcUwztu5ywllLUzpqHAtGH9Ysv91aoYZd/NN
 1+BbWubMzmJKIsnPd2vb7gDblRdTFXDcm2vM/EtlomvtDCh9E8Dogk5lnsc4crN2TJO0DN
 2Dq8+ZcwvH2XEOC/NnYWXS9FmxODjHPD6d7/Gq3Gad0T8xNcfGDe8J1MOOVL/3lqI3EYn1
 XrC4hF93qrTyfamfmLe0OBGSWesxohYFp4jl7QCoBA0hOQvow9LtFHuTWgvJ9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SNVJa9PM
Subject: Re: [Buildroot] [PATCH v4 17/29] package/qt6/qt6base: add support
 for passing custom options
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

On Fri, 26 Aug 2022 15:54:51 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/Config.in  | 10 ++++++++++
>  package/qt6/qt6base/qt6base.mk |  3 +++
>  2 files changed, 13 insertions(+)

In Qt5, there were indeed zillions of options to fine-tune a lot of
things. Is that still the same in Qt6? I'd like to see some
evidence/facts, and not just copy/pasting what was done in qt5base just
because it was done in qt5base. 

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
