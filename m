Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA2C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 10:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08F2408D4;
	Mon, 25 Dec 2023 10:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08F2408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8KpKX4FJKiO; Mon, 25 Dec 2023 10:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D2F1408A6;
	Mon, 25 Dec 2023 10:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D2F1408A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 705A01BF2BE
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55DA2408A6
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 10:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DA2408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-ISk42DjD-O for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 10:13:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 521294089C
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 10:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521294089C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46F79FF803;
 Mon, 25 Dec 2023 10:12:58 +0000 (UTC)
Date: Mon, 25 Dec 2023 11:12:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231225111257.3fdffc23@windsurf>
In-Reply-To: <20231214100156.121408-1-james.hilliard1@gmail.com>
References: <20231214100156.121408-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703499178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GcVGtZxsmW5B3aLHkVbx6wfATfWq5bOmiSdZItFzVJk=;
 b=Bp1qQsJZ0C3cHhh1k+LhM+iukaU7pXtZna7Vvrfe16A1Dfe16XP9CoJ9URkxUacomXTPdU
 QyBnnEdtVDRY8Qwl+HwvTrSkAQLQU56FYyDjbsekh8w7wzV6Ktu5bciRkeVVhFwaf6IE1K
 qNjryUe3j7TnPZrhNNSJFxBgP3jVqbcvJRkIe6iLGkmsAPW7HAlAs2epA8Z+1w5KsBt4Ft
 Vcb2sC1qzF9ZpqbeOfJvfyfntbhP3JD60JDdbY4vVtW+YGmMC1TQW2Dqh8+AOUKqn/FHRs
 uPf34TefU+H242kRhL9da0mCBIJ+bc7iZa5a0/6ngGcmq/SOT+gi3DmsWZIQhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bp1qQsJZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multipart: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Dec 2023 03:01:56 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/python-multipart/Config.in             |  6 ++++++
>  package/python-multipart/python-multipart.hash |  5 +++++
>  package/python-multipart/python-multipart.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-multipart/Config.in
>  create mode 100644 package/python-multipart/python-multipart.hash
>  create mode 100644 package/python-multipart/python-multipart.mk

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
