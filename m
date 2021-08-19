Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6348C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBFA6108E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EBFA6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6772E605E9;
	Thu, 19 Aug 2021 20:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6rczZqQikut; Thu, 19 Aug 2021 20:48:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48AF60775;
	Thu, 19 Aug 2021 20:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF5B41BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C679940001
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjQ3Hl14WzwH for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:48:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48F7E404D8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:48:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 01C241C0002;
 Thu, 19 Aug 2021 20:48:27 +0000 (UTC)
Date: Thu, 19 Aug 2021 22:48:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210819224826.016dfdac@windsurf>
In-Reply-To: <20210818165555.7148-1-peter@korsgaard.com>
References: <20210818165555.7148-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/haproxy: security bump to version
 2.4.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 18 Aug 2021 18:55:54 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2021-39240: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
>   before 2.3.13, and 2.4 before 2.4.3.  It does not ensure that the scheme
>   and path portions of a URI have the expected characters.  For example, the
>   authority field (as observed on a target HTTP/2 server) might differ from
>   what the routing rules were intended to achieve.
> 
> - CVE-2021-39241: An issue was discovered in HAProxy 2.0 before 2.0.24, 2.2
>   before 2.2.16, 2.3 before 2.3.13, and 2.4 before 2.4.3.  An HTTP method
>   name may contain a space followed by the name of a protected resource.  It
>   is possible that a server would interpret this as a request for that
>   protected resource, such as in the "GET /admin?  HTTP/1.1 /static/images
>   HTTP/1.1" example.
> 
> - CVE-2021-39242: An issue was discovered in HAProxy 2.2 before 2.2.16, 2.3
>   before 2.3.13, and 2.4 before 2.4.3.  It can lead to a situation with an
>   attacker-controlled HTTP Host header, because a mismatch between Host and
>   authority is mishandled.
> 
> For more details, see the advisory:
> https://www.mail-archive.com/haproxy@formilux.org/msg41041.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
