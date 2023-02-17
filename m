Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CECC05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E149F61AB5;
	Fri, 17 Feb 2023 13:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E149F61AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UunBzC3Mpzb3; Fri, 17 Feb 2023 13:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0731261791;
	Fri, 17 Feb 2023 13:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0731261791
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6C21BF34D
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D99F812CE
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 13:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D99F812CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YMC_Pohpx9vf for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 13:33:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2570812FE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2570812FE
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 13:33:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4436C20012;
 Fri, 17 Feb 2023 13:32:59 +0000 (UTC)
Date: Fri, 17 Feb 2023 14:32:58 +0100
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230217143258.0f756d59@windsurf>
In-Reply-To: <20230106210827.30007-1-ps.report@gmx.net>
References: <20230106210827.30007-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676640780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iulJKmXI/h8wA5I59hK23fKORhV8JMw3tft6n7o0ckE=;
 b=l0aVHKDDgZULflEDoCT4mZKNbC37/adoa7cQlCX0JWiDrPfgQ72f6HyQYBeriL6JNh4uvi
 jFBKB3z/ZBjauORyc3DZhOFcIKcFUZuhJyOEcPAeN0cD641q3GjjxcbC+eTJooEGBVif7W
 uqiJequJQmnCQYnSvxcUa2x9xPSnxhIhUwQfONJ47iYuTckPTdxEXsbh6T4ihBFic8DAAm
 sAvKUxUNeNfNtcbRr+ZfaMge0tWigjVJ71iddxWbo/1/69+ZTOsHdD4sN++j6PIOuRP+8k
 YEOTnCeWzJEUpFM3CtEta/bKTRZ8nf3QBMTlkUbZwuXI6C6vzb7dqczciZjHuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l0aVHKDD
Subject: Re: [Buildroot] [PATCH v1] package/dotconf: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri,  6 Jan 2023 22:08:25 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/Config.in            |  1 +
>  package/dotconf/Config.in    |  6 ++++++
>  package/dotconf/dotconf.hash |  3 +++
>  package/dotconf/dotconf.mk   | 15 +++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/dotconf/Config.in
>  create mode 100644 package/dotconf/dotconf.hash
>  create mode 100644 package/dotconf/dotconf.mk

I've applied after adding an entry in the DEVELOPERS file for this
package. I know you dropped yourself from the DEVELOPERS file in
September 2022, but apparently you're back, and for new packages, we
really want to have someone associated to them in the DEVELOPERS file
to take care of build issues. Hopefully you are fine with this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
