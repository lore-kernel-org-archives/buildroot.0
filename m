Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FA5C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C33E240983;
	Sat, 28 Jan 2023 21:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C33E240983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLq_SOJ3lZ3E; Sat, 28 Jan 2023 21:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 007D7404B9;
	Sat, 28 Jan 2023 21:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007D7404B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 546121BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28AFF404B9
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28AFF404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNnSWYkJuKdc for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:34:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D9940463
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07D9940463
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:34:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E1761C0003;
 Sat, 28 Jan 2023 21:34:36 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:34:35 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230128223435.2d708808@windsurf>
In-Reply-To: <20230128223142.1c292f98@windsurf>
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
 <20230127201446.1181422-1-vfazio@xes-inc.com>
 <20230128223142.1c292f98@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674941677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOo1jL2SDZQU5VzJY0sMWivvbOSCw+Yl95cI3GRM0w0=;
 b=aACKD2gR6b8I9oTmN0rDsDK4DEQna8VXCr33nGYwxUZQPFd3EoWN+VfBLpGHSLFy/1hvBd
 rNYBH7qDxKA853/Yw6H5ClnIGq1udNf+7cCv7RgT/k4pCR0LTJ8lMupmqPZUjqrVVJ2yjW
 2QTNLFVi0H8bH+zGmYYtykYeM9DpA+/+c61IKMAJDYrb6Z0FleCPwjfjbNVT/UjSv7X90x
 Orhr4quPeWx6lseRVVcT2X9f8lM4LOvQO3/bCASlIzL7Gb9Ct1vBpJOAcPkehKu90VVDeS
 p4IADYXGI/jC5DLs1e2GR/tsfAaw3MLzcliTCpS0GmaTrCnGHb0P6ON9hVrDuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aACKD2gR
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ethtool: fix builds for
 older toolchains
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Vincent Fazio <vfazio@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 28 Jan 2023 22:31:42 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> >  package/ethtool/0001-uapi-Bring-in-if.h.patch | 483 ++++++++++++++++++
> >  ...2-marvell.c-Fix-build-with-musl-libc.patch |  71 +++
> >  2 files changed, 554 insertions(+)
> >  create mode 100644 package/ethtool/0001-uapi-Bring-in-if.h.patch
> >  create mode 100644 package/ethtool/0002-marvell.c-Fix-build-with-musl-libc.patch  
> 
> Applied to master, thanks.

Sorry, I messed up, I applied the v1 of the patch, which only added the
0001-uapi-Bring-in-if.h.patch patch and not the musl fix.

Could you resubmit the musl fix separately?

In any case, having the musl fix in the patch titled "fix builds for
older toolchains" was not really correct, as the musl fix has nothing
to do with "older toolchains".

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
