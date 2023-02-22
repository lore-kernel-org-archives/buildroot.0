Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C825C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 23:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903186058C;
	Wed, 22 Feb 2023 23:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903186058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcHpMPcw3EuW; Wed, 22 Feb 2023 23:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9C76176A;
	Wed, 22 Feb 2023 23:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9C76176A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48E9A1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52C64179A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52C64179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4ISqhyb0iCt for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 23:01:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF8D41781
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF8D41781
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 23:01:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D51F1BF205;
 Wed, 22 Feb 2023 23:01:30 +0000 (UTC)
Date: Thu, 23 Feb 2023 00:01:29 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223000129.0f8c4d51@windsurf>
In-Reply-To: <20230222220835.355342-1-fontaine.fabrice@gmail.com>
References: <20230222220835.355342-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677106890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nX4CLaeqKAWK6znj0+YNoy30w6SrBDEe/i0YjeTdO58=;
 b=FdEzCNBM5pP8wjVW0M+XbThmV9d9ttWMoBKCmkihcCYn++qjI4um+rYAR7t8rhubs3zTuQ
 be+EftyZanH+ArZLiLkHv0kuIY8CFSToYN9WHt5oJLylY5v8Mo0MsYlw6RmmyJ+U2Byb4I
 koWI2LgygViRDMNcE5m/OALVoLPVuKPjvgaPBCrwRtRVmU4N/BvXEGtY+T5V5xpKfKWJlj
 NNL6rP1msPHp8Z3tK/PBOm+R4+mt7Gu2YConawM+x3LMqScLQvn0b/0ga2hgU/Mt8oaqof
 ryT+pI1SUtUqzAqHAqnp1tnZmR7Fo6H4AUxY7aYdLjMxquN8gKkn+1MEsN3hSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FdEzCNBM
Subject: Re: [Buildroot] [PATCH 1/1] package/optee-client: fix
 BR2_PACKAGE_OPTEE_CLIENT_TEEACL
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 22 Feb 2023 23:08:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix typo added by commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82
> resulting in the following build failure:
> 
> -- Checking for module 'uuid'
> --   Package 'uuid', required by 'virtual:world', not found
> CMake Error at /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
>   A required package was not found
> Call Stack (most recent call first):
>   /tmp/instance-5/output-1/per-package/optee-client/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:825 (_pkg_check_modules_internal)
>   CMakeLists.txt:43 (pkg_check_modules)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e1c6b5c9e841a003037045b2ff7afd9836e7c640
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/optee-client/optee-client.mk | 2 +-
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
