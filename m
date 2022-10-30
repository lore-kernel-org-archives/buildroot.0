Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD26C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5FB40358;
	Sun, 30 Oct 2022 11:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D5FB40358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDlDHljwEgYj; Sun, 30 Oct 2022 11:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E72240340;
	Sun, 30 Oct 2022 11:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E72240340
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF231BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BEC660594
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BEC660594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-1yum0WGLRn for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA8C605AC
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CA8C605AC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 84964240005;
 Sun, 30 Oct 2022 11:08:31 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030120743.4dcde3ff@windsurf>
In-Reply-To: <20221030031035.1635268-1-james.hilliard1@gmail.com>
References: <20221030031035.1635268-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9JP3aSZrRKcPJQ2Ic+hbtzqnD8Ov8SqIvjHeDP5D0Y=;
 b=ZtTbXPb60/a4SX3kqeWwqcXz1nVMRgP98bX1AAAz/0M+cs4LPHW3JiVYX+ouZ5siaBggnx
 Jau8FB6Ya51lEYGjZ+ZmD+yKrZOy4sOt/tNTppl7Huf9xRuYKhfJPC7nh0qZqWLBPCWe8J
 Y8CEXIOGZ6ECCFRDFtRIYi2swjhrCYJJ29t+RqHOS+zCxLyTR39V4CuJTrjX4pf6qpKcZV
 aMfKsQjkk1gHSe1DAWjbj/GNNQJYBRHX6gHSsjX8w9QUnuETam6AdUFtmA7N8hUIlQCqFP
 yI8qOdbTF6s6Q2idLzv1Y+fndAI4hg57Y+001lZpqDtM909siVEjgIoWmXbHHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZtTbXPb6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to
 version 0.9.0
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

On Sat, 29 Oct 2022 21:10:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypa-build/python-pypa-build.hash | 4 ++--
>  package/python-pypa-build/python-pypa-build.mk   | 4 ++--
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
