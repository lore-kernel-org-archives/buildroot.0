Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D32CC74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3AB981F5C;
	Sat, 18 Mar 2023 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3AB981F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eO5n7EkhaDcV; Sat, 18 Mar 2023 21:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08ABF82070;
	Sat, 18 Mar 2023 21:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08ABF82070
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7BD51BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08138202B
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08138202B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXnGrrvvZhLp for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:21:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9756181F5C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9756181F5C
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:21:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 30D2A240002;
 Sat, 18 Mar 2023 21:21:44 +0000 (UTC)
Date: Sat, 18 Mar 2023 22:21:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230318222143.6a10465c@windsurf>
In-Reply-To: <20230318123058.4103-1-fontaine.fabrice@gmail.com>
References: <20230318123058.4103-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679174504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZ80TlMe4fbKbL+5l4LHYO1pyzLBuArBjVb2iUvI7v8=;
 b=o36qaWKAYdJsSbOPbEQkar6RJqWBGjafEiMAYhju9vkmi9rh39Gj9JEQsbrvMULxEcWb8h
 e7lVR+zOp2xJwRI0P3jnx4ymJShA4dHFFeY363EyQ6gZ2SfI1rjWg6mmV+28G04d+YiRhi
 kvS0jdQtn/M/pgDEd2PN0w8Fck/na1JViUBsg88WHKqoVev1aNfw+2vLAjWTASaNAxlKNd
 uPDObyUEy6lOZRSZbbiQjyYwiNMJN0sF1+AlVGJj4j7STAEYvcckQcWrC5ff9m1cXxWOEW
 P+WjLLmgzmZ30PAou0ZPIAyngeMooBnevMlB2D0X8BTB8mNqqtB8UZCCZ2Ps0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o36qaWKA
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: needs
 OpenSSL-enabled libcurl
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
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 18 Mar 2023 13:30:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised bump to version 2.17.0 in commit
> eab9110afbef9c39569c4cc988aed15c48f7ce44 and
> https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
> 
> Error: libcurl is not built with the OpenSSL backend
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/32aa8f0bece5da2a16d761f175d46c7d3e0a8965
>  - http://autobuild.buildroot.org/results/535253f483c927da456c0be292df6a58c1f39737
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/s390-tools/s390-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
