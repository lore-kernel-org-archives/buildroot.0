Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A1C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60DFD4042B;
	Fri,  3 Nov 2023 19:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60DFD4042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uS459Dg08Up4; Fri,  3 Nov 2023 19:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D26B40482;
	Fri,  3 Nov 2023 19:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D26B40482
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224171BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0885C60B31
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0885C60B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHTfC73xfizt for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:54:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E261A60B2C
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E261A60B2C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32EBAE0003;
 Fri,  3 Nov 2023 19:54:39 +0000 (UTC)
Date: Fri, 3 Nov 2023 20:54:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103205438.730b1dc1@windsurf>
In-Reply-To: <20231103190812.2484268-1-fontaine.fabrice@gmail.com>
References: <20231103190812.2484268-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699041279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43C/D8r+axfhHBISdbstbjfj3Nve2QrV7qLkLjhFE+E=;
 b=AbZJGo9NW7KQuzaiJSJQ4DQWpHfUY8KoeLd9EwBE7E4Pn9Gu0oz4HyMqgwjUZ8P8db2RBo
 qwZ1J8cZpFqZN1tfavuK/1HJ7zB0YaJL/wrc8WKHboXhRMY8l/EXtKMkqVPcjkz71jPfBV
 q0Wf68oQ9VyA5Yvn1kF+BgLRyH9c+ghTHccrmS2xOuK5sZXd3FNH3OkSzbhN3Kd6HtRTmP
 kj/yX8w0IcjBgbhEaqndyqFwSQj6PkJpsH+pVBSUwS9xRfTqdHJtUrjCz9O1XP1pWhv8/Z
 vEUtaWI/ItI6aCWXZFAD+SVH4QGTIQKcuFA7WRFQ7O301novn+93xKZ9+nhV8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AbZJGo9N
Subject: Re: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.6
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
Cc: Mario Lang <mlang@blind.guru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Nov 2023 20:08:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop second patch (already in version)
> - Update hash of README (DotPadd added with
>   https://github.com/brltty/brltty/commit/5a9288c6bc3226201146aaafed4885f2bb277739
>   and year updated with
>   https://github.com/brltty/brltty/commit/f21f2199162012a74398afb1265d458933a19291
>   https://github.com/brltty/brltty/commit/68589179695e129ab2b0972071a93b2233115df6)
> - This bump will fix the following build failure raised since bump of
>   gettext-gnu to version 0.22 in commit f6a6e3a8363a32e5443c9eadc2ee047853640d1a
>   thanks to
>   https://github.com/brltty/brltty/commit/31061173fd80c7ed0f83e8d20d62c59dbedcebe0:
> 
> /home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt --output-file zh.mo -- ./zh.po
> /home/thomas/autobuild/instance-2/output-1/host/bin/msgfmt: input file doesn't contain a header entry with a charset specification
> make[3]: *** [Makefile:86: ru.mo] Error 1
> 
> https://github.com/brltty/brltty/blob/BRLTTY-6.6/Documents/ChangeLog
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/29f5ef8a52db4dd717fbaf1ade9d250dfcebe6ff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...unProgramTerminationCommands-used-a-.patch | 29 -------------------
>  package/brltty/brltty.hash                    |  4 +--
>  package/brltty/brltty.mk                      |  2 +-
>  4 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/brltty/0002-shell-prologue-runProgramTerminationCommands-used-a-.patch

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
