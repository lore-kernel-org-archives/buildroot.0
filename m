Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF3EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C9AC60EE1;
	Sat,  1 Jul 2023 14:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C9AC60EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QH8sIChE_vWO; Sat,  1 Jul 2023 14:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8568160E50;
	Sat,  1 Jul 2023 14:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8568160E50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 860BF1BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 525DD60E50
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525DD60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxX529wIyAbG for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD5060E3E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DD5060E3E
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:08:42 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBFB860003;
 Sat,  1 Jul 2023 14:08:39 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:08:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701160838.6c9f133d@windsurf>
In-Reply-To: <20230628175401.3397394-1-bernd@kuhls.net>
References: <20230628175401.3397394-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688220520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+NghzdYraVqDbTfdZBXLuqwX10CD+LIU4Ot/6eeNow=;
 b=SDi8omYzN1+wH4ic1F95AI1cHbFuYAcAM/XThi5k3C/1M1JyAnsI1Vbbhz1/VkJLNiqga9
 toJJZRhlYj33ASysuCd22AU2JyOYVs0HdpWfNV3LWB0TJG1RQvpngTrdW7RO1/vdHFym1C
 my5BI4Z+w99PZWoqkzz8QfF5Ujl9HIhJL2LuIZ94wD92xvsSxZfkPhWwjFlkw0pNM41KC+
 74fEiWKqxpHWRqel2/3i4Ms2VFKhLflt7DHwu4W//9aoaHcGOPKbk8WeHGXDWMbbm4FS5f
 1L7YswBjYea5fyK6/6XnVtV7DwLggnQOZDzeND1Bzsol+1oBi8I+l7itE39a6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SDi8omYz
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: add optional dependency
 to libunwind
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

On Wed, 28 Jun 2023 19:54:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added configure options for libunwind in commit
> https://github.com/samba-team/samba/commit/14feb93d481011765f62614ab49b304e17e4f6fd
> 
> Fixes:
> http://autobuild.buildroot.net/results/63c/63c469106e9daa198f77d8da7a5bb123edcce0f7/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/samba4/samba4.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
