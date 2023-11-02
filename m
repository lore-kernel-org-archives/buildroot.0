Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5B3C4167B
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 13:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 017154348C;
	Thu,  2 Nov 2023 13:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 017154348C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aP0h_wM-YK1; Thu,  2 Nov 2023 13:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC20843499;
	Thu,  2 Nov 2023 13:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC20843499
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C83A1BF37A
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 13:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65EFC6FCD8
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 13:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EFC6FCD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5I09J-QbuMWG for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 13:41:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34AAB60FAB
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 13:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34AAB60FAB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2339060008;
 Thu,  2 Nov 2023 13:41:30 +0000 (UTC)
Date: Thu, 2 Nov 2023 14:41:29 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231102144129.26d5ac6b@windsurf>
In-Reply-To: <20231101223719.36953-1-fontaine.fabrice@gmail.com>
References: <20231101223719.36953-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698932490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QngL/HaaOEWo21nsAgGsGs2trlXhuh53hvTtShlH0C4=;
 b=gmEIckIls+YKTRimR8eIcLvEbtOO7loaHT810YUfHIb/UpXJOZraLbo/qvOAdrgPCjFZyI
 sawI5aBtw9VY4lZNTUzy28D4xsspYZzu1QpnHj0hR2b7o18/jnktW4Gz4v3VoiRqC8+bsJ
 eO9Ir89qhjXFu2KACziYTVpPs9F4SdUE/49a+OzU7nuVUwPXEm0TGq3UafLCMWRZfDI7re
 lO2v8I5b5uwcrWO/gLFdzquAOohbu3e39dCgzu9J/53HVYcpfHX4kJhZPWWI4Vfs5Bjm+u
 4WM8/IYuoLFnl24w/xDLPBwU7ywZA9JIQoT+H5csX/dBh/vm+jq8OkQqor+XAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gmEIckIl
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: bump to version 4.3.4
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  1 Nov 2023 23:37:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - LIBCOAP_IGNORE_CVES is not needed after bump
> - Update hash of license file: LGPL-2.1 added when RIOT support with
>   https://github.com/obgm/libcoap/commit/8d869fff047d34a1c825ffc1bab5d3fde28c75b7
> 
> https://github.com/obgm/libcoap/blob/v4.3.4/ChangeLog
> https://github.com/obgm/libcoap/compare/v4.3.1...v4.3.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-Backport-fix-for-CVE-2023-30362.patch | 59 -------------------
>  package/libcoap/libcoap.hash                  |  4 +-
>  package/libcoap/libcoap.mk                    |  6 +-
>  3 files changed, 3 insertions(+), 66 deletions(-)
>  delete mode 100644 package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch

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
