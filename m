Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B45DC636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3DC4159C;
	Tue,  7 Feb 2023 22:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3DC4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4AhLN8ECAX0; Tue,  7 Feb 2023 22:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1208741548;
	Tue,  7 Feb 2023 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1208741548
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA591BF41C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1536181E61
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1536181E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5ghEZdnHZc2 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:06:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6ED781E49
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6ED781E49
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:06:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B2F324000A;
 Tue,  7 Feb 2023 22:06:25 +0000 (UTC)
Date: Tue, 7 Feb 2023 23:06:23 +0100
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230207230623.022d91da@windsurf>
In-Reply-To: <20230207170303.2508780-1-vfazio@xes-inc.com>
References: <20230207170303.2508780-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675807585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2+eku3aJE7fE5KZ+V5n24UtRTVp8PgpaE+bA0ew+R0=;
 b=DowWet6/N3fr4sOcpRcBaZrt3bipCrlyTFOkyHhBAW/Y71a8uuY8XDvmyxI3aaLfTAbUIa
 PYdsQGUp0B2nunbcBws+Y4SUj7klXMCuVu3z+6vx0Qa8SzXBIFVRORWzoa/UVCaRMN34v9
 /pxKR+nHK/cpAD2R5l1JdaI3plC8Tpc8vcv6uI2vJha15Vj5FQ7Ln9LTYFhVOdFt4aS2Go
 va/+ncF+YBpNpcQPyrYWrdwZtOMWsPX2z/RKWL6GV5wLFZvyxNhDEMuRJtXmmJWBZ5PmJC
 2quk6Ddr1TnUoPIL9cvZv737skD4MYnf2TXDtC3WTgPoECEaNUQUtEnq7HDJqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DowWet6/
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: fix microblaze compiles
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
Cc: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 11:03:03 -0600
Vincent Fazio <vfazio@xes-inc.com> wrote:

> From: Vincent Fazio <vfazio@gmail.com>
> 
> Patch xz to check if __attribute__((symver ..)) is supported via a
> compile check during configure.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/c0d/c0de72e5a34b379e0c516ad08984bb2c4b0abb5c//
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  ...0001-Detect-symver-attribute-support.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/xz/0001-Detect-symver-attribute-support.patch

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
