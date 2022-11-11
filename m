Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F44C4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C47881F8E;
	Fri, 11 Nov 2022 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C47881F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nafdy5TGzcfa; Fri, 11 Nov 2022 20:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C74781F87;
	Fri, 11 Nov 2022 20:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C74781F87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD391BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22CED605AD
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CED605AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcCeG9UaYABM for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B98B6059A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B98B6059A
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:52:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0ED531BF205;
 Fri, 11 Nov 2022 20:51:59 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:51:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221111215159.41e7d22f@windsurf>
In-Reply-To: <20221105212343.353414-1-fontaine.fabrice@gmail.com>
References: <20221105212343.353414-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668199920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iupe/Q4L0aunLYYBDBiUT8+ljGoBV+Mw/kepIkSabUk=;
 b=OtUC2IGvI/1eqplGsT9+gPOuy4jyRqNdrsk0EXO6QQFTyaiwuIBBWuJbF8AavRalXIZrNs
 0nclHi9eVmStVQgTuyxQopPOfruOdQ9QmyVl/ZClKHtpn7zS8+lCxp5P95dVRw5l4ZHg37
 EuQEJFAY/CsbQQFNOgZU1PPYUxOdkZrum+TCD2UI3RiCqvHvs9PS0GCNVPwtOqxlBEhZxw
 iVFj2vIF7w4HfTzwWeRb5swLwey1kH5pe2l09RAU+DyLiNkFU6biKhSAAaUhxwKNSHcsQS
 35KJ1fQjXhWjDttLDvurPmCCMYi43WaWX8dYfjJinSjMuoUBMtRFbYlzOak5OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OtUC2IGv
Subject: Re: [Buildroot] [PATCH v2,1/1] package/lxc: bump to version 5.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat,  5 Nov 2022 22:23:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> LXC 5.0 will be supported until June 2027 and our current LTS release,
> LXC 4.0 will now switch to a slower maintenance pace, only getting
> critical bugfixes and security updates.
> 
> We strongly recommend all LXC users to plan an upgrade to the 5.0
> branch.
> 
> - Switch to meson-package
> - Add an upstream patch to fix the following build failure with glibc
>   2.36 (unfortunately upstream doesn't plan to fix this for 4.x:
>   https://github.com/lxc/lxc/issues/4183 and patch is only working with
>   meson, not autotools)
> 
> https://discuss.linuxcontainers.org/t/lxc-5-0-lts-has-been-released
> https://discuss.linuxcontainers.org/t/lxc-5-0-1-has-been-released
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f77e2dc44c9a224f280e08089a890e85c302274f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This change has apparently broken the LXC runtime test:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261449

   https://buildroot.org.gitlab.io/-/buildroot/-/jobs/3282261449/artifacts/test-output/TestLxc-build.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
