Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2064185C;
	Thu,  3 Nov 2022 22:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF2064185C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suf7qlHGZSXc; Thu,  3 Nov 2022 22:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAE041859;
	Thu,  3 Nov 2022 22:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFAE041859
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2D21BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B22961048
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B22961048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoLozXx0hVzj for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752E461043
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 752E461043
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:08:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 85C18240007;
 Thu,  3 Nov 2022 22:08:41 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:08:40 +0100
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221103230840.4cf977aa@windsurf>
In-Reply-To: <20221101181320.368702-1-thomas.petazzoni@bootlin.com>
References: <20221101181320.368702-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQJwc8lRa6Rz+nuxo87CzEnTUqsU2R9aS47L0Ett67o=;
 b=TiPgjjryTXgbSROWWd5FGlc/51jq98PBui2CZnJjgQJAWrUs7viL5NNzqOmEbn3naxD+ox
 l7HnV6lNsx2oIq9wdOq+AjDjj7CyO9qzxvz+pknDj6LWEnVXc3JBIix9bBSJIfgcGLs7+b
 v/hxKGu9WzyIpidvY+hKtwsxEdPJ3ixLq7hLt1RnFVazavIKXHUCq5R506/1HuBsyhm6sI
 p3Z4d+qxhxdVZljSOwSYJsaNbI6gXLIEahYnXQlRBK2v7OsewkBAWhBXNw2OLWLAZFOiTB
 gJqqu48hw/9DvbLpKRFWADGZHteXntXoZIWZolP/SM2LoZjQV4BzOOPvrWNeVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TiPgjjry
Subject: Re: [Buildroot] [PATCH 1/3]
 support/testing/tests/package/test_python_flask*: increase time after
 server startup
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 19:13:17 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> It seems like on Gitlab CI, the runners are quite slow, and the Flask
> server does not startup in the 15 seconds we give it. So increase this
> to 30 seconds before trying to contact the Flask server.
> 
> Hopefully fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/3249828594
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/tests/package/test_python_flask.py              | 2 +-
>  support/testing/tests/package/test_python_flask_expects_json.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
