Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E00C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D876760BA0;
	Sat,  4 Nov 2023 20:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D876760BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXy-0HHcqyMo; Sat,  4 Nov 2023 20:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C58360B32;
	Sat,  4 Nov 2023 20:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C58360B32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 779591BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F18140359
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F18140359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwXTR02rILiH for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:42:37 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A1E24033F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1E24033F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57C2A20003;
 Sat,  4 Nov 2023 20:42:35 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:42:34 +0100
To: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <20231104214234.136b0e66@windsurf>
In-Reply-To: <20231003234734.525050-1-ajd@linux.ibm.com>
References: <20231003234734.525050-1-ajd@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699130555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+EOejyEiZRmZE/tzwiF6hx0aF+Df3gBg6bLDCEjfIs=;
 b=hHG55dkSoqIEcJOMwh76JRJpFLoyaY0SO0YoS1eyRw4aHKa48Wt++PJkLF+g71wTCrfN5Q
 duQIRPCyTAezQ6P4FvAe0LYJI/HvIsz0YroTJFeV/q2CKIx7I3mh+Qfu418ftkq9yBBBCw
 hzggMvsNeOLOu/qf8IE1dxnFcDsXdFdV2797Nq/5jfkIrtmuvRZLLCx9JZxH2x/XQKoQ4U
 yTLMRI5Zc34qiXTkNRnipHjUImeXxh/yZo4GS+ZOhM2AZN6p60YllimxMVtrQP6LzizmbG
 l54zfFKYiEFjvXLOE3N0o0kjfs9tadEPVvWvyXT7CAjBMDTHoPlKM9sBKrMZPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hHG55dkS
Subject: Re: [Buildroot] [PATCH] package/libzlib: Switch to using HTTPS
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

On Wed,  4 Oct 2023 10:47:34 +1100
Andrew Donnellan <ajd@linux.ibm.com> wrote:

> Switch to using HTTPS for downloading libzlib from zlib.net.
> 
> (zlib.net doesn't default to HTTPS but does suggest HTTPS in the permalink
> for the latest zlib release. Also works better with some corporate firewalls
> that get suspicious about zlib for some reason.)
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  package/libzlib/libzlib.mk | 2 +-
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
