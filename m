Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC23EC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4CF41053;
	Fri, 23 Sep 2022 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4CF41053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPSZo0yOkwkM; Fri, 23 Sep 2022 21:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBE2D404AE;
	Fri, 23 Sep 2022 21:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE2D404AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6591BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAEC0404AE
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAEC0404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hr4LHq2_kEqH for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAD340220
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBAD340220
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:35:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3AF9C240005;
 Fri, 23 Sep 2022 21:35:16 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:35:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220923233515.1b63023e@windsurf>
In-Reply-To: <20220921210733.21853-1-fontaine.fabrice@gmail.com>
References: <20220921210733.21853-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaziMEsmDtxw6krgZJXfkqDJ78d2ZpE/VMvx03IYl/A=;
 b=P8W7JRBlfEzWWj2uNn1/YpZBw5fhqmUAYd2ChJzYvHqb0cDqYdHfAz0xcwe+AB7Dqfqc1P
 jQwOH1+J7HNsGLE4KNR74vObERi4RPHv0mCmBZv3d2QmNcbeTv1lxL4x5iytkLHjaIPicz
 ojuYvurikA4l9yFUBs48vVkCSKqxSXWYkEU4Gd4QwesS5Q8y26Bewqlg2wATUGAKVNy0xl
 KyU3hjiQisDxqwIymAvZ269mZS3AEbao++ubYHajjkSICMwPv5l01Zm8wBsPUkx5TayYC9
 Es8UP9EJTh+NQHHaZBTpROh+UxJAA1qvyybEeEU/9PAHpM9t+FCZ3nxH+TsZLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P8W7JRBl
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.9
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

On Wed, 21 Sep 2022 23:07:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (akready in version)
> - Update hash of COPYING (year updated with
>   https://github.com/libexpat/libexpat/commit/39b2e99355039626438d48a4eca6aacba2b44d5e)
> 
> https://blog.hartwork.org/posts/expat-2-4-9-released
> https://github.com/libexpat/libexpat/blob/R_2_4_9/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...re-safe-exiting-internalEntityParser.patch | 53 -------------------
>  package/expat/expat.hash                      | 10 ++--
>  package/expat/expat.mk                        |  5 +-
>  3 files changed, 6 insertions(+), 62 deletions(-)
>  delete mode 100644 package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch

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
