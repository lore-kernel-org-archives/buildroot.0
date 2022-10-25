Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F91BC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FB580BE0;
	Tue, 25 Oct 2022 18:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1FB580BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4PbG8CznOy0; Tue, 25 Oct 2022 18:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3A9C80B52;
	Tue, 25 Oct 2022 18:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3A9C80B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 049F31BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D42FC4012B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D42FC4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmulp-gqOHXF for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:23:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94CDE4010C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94CDE4010C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:23:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 73D931C0004;
 Tue, 25 Oct 2022 18:23:06 +0000 (UTC)
Date: Tue, 25 Oct 2022 20:23:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221025202305.4429d5ef@windsurf>
In-Reply-To: <20221023204044.23467-1-fontaine.fabrice@gmail.com>
References: <20221023204044.23467-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666722186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NLNy4BgVBgFz5Yl5FltR8OYMlGH3qkjo4/Y0WuLJSA=;
 b=X6oTr8DvQ3cgkcFoL/yHNZblY174seW4seFeLDvLi34vmhIhxex1RjrafAxgrAJ+F0/FVF
 g8kkLIsiCDEVT0lJU2IiiInAzVIpT7b85rS5XbaKLtkP4mB80icN4WHfiSml8EZ9lMgHr9
 6mBM39Ofuox8JFqtsQSDhWGgwB1thQj2X8dPgw46XSg8cO7NOBfOT3j4SUxeQwjxNsDPO/
 cY7VaXdhVw8WZb19yxxliwCm/tlg6T9EUgYVGGUJc1CN4Vnv3c3CyMmcX7DtRgrYo9UlUh
 FjgNjiC+jvvMqyc7P7bn8aDcfdroCjcV2z4V9YLwcnbyEWYSw6ikxAJ1J6oXcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X6oTr8Dv
Subject: Re: [Buildroot] [PATCH 1/1] package/libshout: bump to version 2.4.6
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

On Sun, 23 Oct 2022 22:40:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version) and so autoreconf
> - libvorbis is optional since
>   https://gitlab.xiph.org/xiph/icecast-libshout/-/commit/181ac9f3f51825077194599f5c4621fa323b1b7f
> 
> https://gitlab.xiph.org/xiph/icecast-libshout/-/blob/v2.4.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re.ac-add-an-option-to-disable-tools.patch | 51 -------------------
>  package/libshout/Config.in                    |  1 -
>  package/libshout/libshout.hash                |  4 +-
>  package/libshout/libshout.mk                  | 13 +++--
>  4 files changed, 11 insertions(+), 58 deletions(-)
>  delete mode 100644 package/libshout/0001-configure.ac-add-an-option-to-disable-tools.patch

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
