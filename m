Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0D1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6186B84290;
	Tue, 15 Mar 2022 20:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cfu3tWmEEvua; Tue, 15 Mar 2022 20:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF5E817A3;
	Tue, 15 Mar 2022 20:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2731BF263
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FCF817A3
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xq0YVlxTXstg for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:59:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6FBE8176B
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:59:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 57C0A20005;
 Tue, 15 Mar 2022 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647377976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alzYckXSZL9Dxb/fNZcXYxAChDNNvzC6xiYDHsXnIzY=;
 b=AfvKM6z8M0JHJOeo0q+fUL910S/hrK7Uve+3hYCgzagVKjy+fm2d0QYmJ37ZX6NRS4/Lf0
 2W0EYzk/mnZYwHs/syA2zo0eSVuhpEI6sm6qJ11dDAr3MVeItWwfiBsTYz0KAa+tpWsNX+
 sUwok92W/blkw+P0jQpslicEimF01Rm8M0/CplT38KKT68FyLfNsKvDGwn0+u6oBODH+Gl
 ojBug9eNcLwSruUZxtzclz6LPEdUw5FWOydnJss9N2UEXgNO36Yo7aq/SuOLZ2qfNpY3qr
 0H9hX0mxmmXM9EAcLPSohNXxc6yxGYs6EJPewWeGAiri75eauZQsQI3VZpzJ9A==
Date: Tue, 15 Mar 2022 21:59:35 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220315215935.6341fafd@windsurf>
In-Reply-To: <20220311065928.14849-1-ps.report@gmx.net>
References: <20220311065928.14849-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/mtools: bump version to 4.0.38
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Mar 2022 07:59:28 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-03/msg00000.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/mtools/mtools.hash | 2 +-
>  package/mtools/mtools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
