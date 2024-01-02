Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69872C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2094091B;
	Tue,  2 Jan 2024 08:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2094091B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywTiF7ICR2uL; Tue,  2 Jan 2024 08:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54ED2408FF;
	Tue,  2 Jan 2024 08:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54ED2408FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0AC1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 327EE81279
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 327EE81279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrGzX8mAH4MT for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B588D81276
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B588D81276
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDE174000D;
 Tue,  2 Jan 2024 08:55:14 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:55:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095514.48bce31e@windsurf>
In-Reply-To: <20240101221521.42578-1-fontaine.fabrice@gmail.com>
References: <20240101221521.42578-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8ixGNzDvdgbaTncf1GC8FIEmguVSRJDb7MkH228MvI=;
 b=RTW40rtdTwM5j6TwNhu7KsemM0x3feFtxlZK8KAsUVhnsIWH7T/0TgF6xOYsQsZ1JiT+xf
 pQbl3zhgT+kFFNWkhbfswKslpABTzwnlcOC5zva8RQQhUMI3nb63N71ZBFbIu1A5DehzIC
 gZNYRnNvlt2J7pJfmK9ybUCqdXKSRkCER95eyrPShIcRAxuefJHKixwnIZ+mesBAJiJdTr
 BCbtCcYJ7uYIhwjiv+fON+Sr3ojfDFWql6Ol3PXcvVPu+lStuhV8426y5NziwgFLltxBzd
 MtQ8YuOcYIuG+LChuoK+GwOfoeb29zl1uqWoWj00Sb+GIb+f3MgyyVWuRS738g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTW40rtd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: security bump
 to version 2.14.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Jan 2024 23:15:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Implemented "strict kex" support and other countermeasures to protect
> against the Terrapin Attack described in CVE-2023-48795
> 
> https://github.com/advisories/GHSA-hfmc-7525-mj55
> https://github.com/ronf/asyncssh/blob/v2.14.2/docs/changes.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-asyncssh/python-asyncssh.hash | 4 ++--
>  package/python-asyncssh/python-asyncssh.mk   | 4 ++--
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
