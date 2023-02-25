Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF8C7EE23
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFDBE40BB1;
	Sat, 25 Feb 2023 21:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFDBE40BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_GSQzkGXS9o; Sat, 25 Feb 2023 21:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 007DC40BD6;
	Sat, 25 Feb 2023 21:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007DC40BD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08951BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB11540BA4
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB11540BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wuBktVPnGNCq for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:02:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66D1A40156
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66D1A40156
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:02:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F16540005;
 Sat, 25 Feb 2023 21:02:49 +0000 (UTC)
Date: Sat, 25 Feb 2023 22:02:47 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225220247.4bdfa321@windsurf>
In-Reply-To: <20230225160123.264914-1-fontaine.fabrice@gmail.com>
References: <20230225160123.264914-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677358969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0B54WQHWa1OuMyW2iE8OA8ixJBS9CekVbxU7X3Me4EE=;
 b=EIicvJg2ZYb+/cPxlSzNQhs6flAnxczijwhRgJ9v04xyqU5KWsSLuNDz+8ws8NQXN73W4r
 uevTKQg3pyE0M5KPEhf+Ne9TEQYFZJa2lG+YDZhEQuXwbANL+Iaci9Gcq4teprZVh61aKl
 7nrNSj2cICxQ6VVuoSpGLuuEtixxkVGq2gshCh2+1NITXgZudIjybki20/a6fjkyvIx7Ny
 9hipm5/oKPbjPZTA79wmTltpZJr5IooJjh/jyUSR4RvEpwGqnphxHXdbwibM78pbB16baq
 8UAVvkm1XB1YrgvuKHH1k7XwmM+ciPiTLZXw2qyiP0x0VjplIg48vebp2Br9kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EIicvJg2
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add lpc32xxcdl
 handling
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

On Sat, 25 Feb 2023 17:01:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit 20695936ad63f602662bc4c6124a26312c46ff52:
> 
> make[2]: *** /tmp/instance-0/output-1/build/lpc32xxcdl-2.11/csps/lpc32xx/bsps//source: No such file or directory.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/72c9a4080318b1b247ca3517c95c689dff1068d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 4 ++++
>  1 file changed, 4 insertions(+)

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
