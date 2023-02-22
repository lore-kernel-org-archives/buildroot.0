Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B272C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 492276138F;
	Wed, 22 Feb 2023 21:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 492276138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3Ithctg2kSh; Wed, 22 Feb 2023 21:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715EA612DC;
	Wed, 22 Feb 2023 21:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715EA612DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE7371BF59E
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72DF419DB
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72DF419DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etKB5z6X-7zc for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE67419D9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE67419D9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:00:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 772471C0006;
 Wed, 22 Feb 2023 21:00:46 +0000 (UTC)
Date: Wed, 22 Feb 2023 22:00:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230222220045.5508e055@windsurf>
In-Reply-To: <20230222181254.2533041-1-fontaine.fabrice@gmail.com>
References: <20230222181254.2533041-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677099646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+z8Hzr22q2TY6nYZ+B+e859aho5F9/FRjldqsgBZK6U=;
 b=leXqeEtzT8e9ZYuP7c20f4pSKeCK+upqMjrTczQBx6rU5h7qkPof0BUYpUkkqsn4nNu+fb
 hMlH2TPTgtn8OdHJISYhu2hEwygTBQwxEWWfchHa9R2VIQ9ltOoqbwPNFMd9DnlKeP2csM
 Qpe0zKqp6gHYUXCSD0pJR6YMevSewEnFFGAmxWMRxyxZ4qYOwyW7ji7eVMVRz5nIhUD1Ma
 1d+5i01zsyh6TUG6m92Kw+s6XFoU7rrX/yU/iXtnt17EDmokDwBTSdoadsUO0v+UydwD0x
 xIl5ZN6VeVKDHJ8no8wS/4eKmLLsYqS33uBgUqRUjEr7orfKrAhB40rQ59V+5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=leXqeEtz
Subject: Re: [Buildroot] [PATCH 1/1] package/xerces: drop patch
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

On Wed, 22 Feb 2023 19:12:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch which is not needed since commit
> 62cab101356c97432da482e168adaf065de65c4f. This patch is actually raising
> a build failure since bump to version 3.2.4 in commit
> d2d8f146a9f0ed3b66c4dd470bb76efdbb630a75 and
> https://github.com/apache/xerces-c/commit/af1935b567c18c8b2de71d6ea97239be60876335:
> 
> CMake Error at src/CMakeLists.txt:1271 (add_library):
>   Target "xerces-c" links to target "CURL::libcurl" but the target was not
>   found.  Perhaps a find_package() call is missing for an IMPORTED target, or
>   an ALIAS target is missing?
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c62856a5eeb34714f26235b2d6f8adc4ea612686
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-fix-static-linking-with-curl.patch   | 39 -------------------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 package/xerces/0001-fix-static-linking-with-curl.patch

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
