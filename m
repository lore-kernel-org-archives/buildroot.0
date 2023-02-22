Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB43C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 23:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70FAD60C27;
	Wed, 22 Feb 2023 23:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70FAD60C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KhzQBOAQ-QDt; Wed, 22 Feb 2023 23:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAC86177E;
	Wed, 22 Feb 2023 23:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FAC86177E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1CE91BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B9C1401B1
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9C1401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzXdKubdguQx for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 23:01:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD0C40123
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BD0C40123
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 23:01:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28F88240005;
 Wed, 22 Feb 2023 23:01:34 +0000 (UTC)
Date: Thu, 23 Feb 2023 00:01:33 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223000133.6e7cd7f3@windsurf>
In-Reply-To: <20230222221750.558885-1-fontaine.fabrice@gmail.com>
References: <20230222221750.558885-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677106894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcKVoMk2EyW6qWqUIv/FjMOtlHSWm2ACUTyBUwxeBdA=;
 b=XiY82lWiFHh+v9k6m0Q+HhVT3xTRI8mtQ2Ikox+kY9CIqOzwL89h1KDqKXUaqs/siHZm91
 yubi7J0Vlm28yKEkivb/bBB9LZsG3KQYln18f5spzKMnN/gkDSsH99WhyDJtT0Ea8Z15bL
 0V5vHjt768kYlNhgKCwFIrIjhhjv/+ouoIZMk7tByQBdBAXMxPbi/KYzkvKDXvIaJMeX71
 4PWTEqeYSd+duEjqE2ZElyCOpuCml7y0+KQotOv+K/DLk+vDHpyDoTjiGhZGlOuUqIm/iJ
 ADWxYRyRiNZBBvKQiZVsGDhMU9M994N8vVs0hq+482tK2n603uJH/NblyoLsbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XiY82lWi
Subject: Re: [Buildroot] [PATCH 1/1] package/optee-client: fix uclibc build
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

On Wed, 22 Feb 2023 23:17:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure raised since bump to version
> 3.19.0 in commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82:
> 
> /tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c: In function 'teeacl_user_is_member_of':
> /tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c:75:12: error: implicit declaration of function 'reallocarray' [-Werror=implicit-function-declaration]
>    75 |   groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
>       |            ^~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/03eba71ab9b87676f2606ecf2a9b5a151fc396bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-use-realloc-instead-of-reallocarray.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch

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
