Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2292CC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C2F60BE1;
	Sun, 14 Aug 2022 12:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C2F60BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkjaA8qg9Qpf; Sun, 14 Aug 2022 12:30:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F1F60BD8;
	Sun, 14 Aug 2022 12:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F1F60BD8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7A901BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 926D960BC6
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 926D960BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNzE1XkG4w-u for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:30:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E50B86059F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E50B86059F
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 12:30:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AEFC41C0003;
 Sun, 14 Aug 2022 12:30:32 +0000 (UTC)
Date: Sun, 14 Aug 2022 14:30:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814143031.0ef0497e@windsurf>
In-Reply-To: <20220813195943.2411510-1-fontaine.fabrice@gmail.com>
References: <20220813195943.2411510-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660480232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZbWIWcOqgaAPSGjGcdHI8YRiZxpkBvzaW4qFv3id5I=;
 b=bovu1mHhBQ+JDMPNkixRWYVK/kydX+L9v9aXhcULrNrWZcGETzdMZeegrvJqrRvl3tOHzE
 O2bG1J+yLyvHJw4IPozihDW3NLbYeIZZS5KXWWDNr/vK60o5S2ZL8qLTv0E9nP6ISOUZnT
 J6cWx6eW0Rsa4+G5XunHwZXW39mJDF1nhutqZd4nOJTXwiQ8rLaw4FaCIr3GRWvYUKUW6+
 Yfog87pLIaZ2wluf/xlyJ+ycaRkASL4Iq5Jii+J3Zz09nFFAse4VhwA2Yjt4Q6qYmntK1f
 KbRb/mIqemkJ1ooWpRlm8eJWwR7xyDFZD6/U0BW6840b+AV0nYGcek4qMSi2xQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bovu1mHh
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: fix musl build
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

On Sat, 13 Aug 2022 21:59:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version
> 20211207 in commit ecf85b4ef58873e9acf749adedfbaa90baaaf3c0:
> 
> receivedata.c: In function 'findSlice':
> receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
>   348 |  ptrdiff_t pos = slice - clst->slices;
>       |  ^~~~~~~~~
> receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
>    16 | #include "fec.h"
>   +++ |+#include <stddef.h>
>    17 |
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/udpcast/0001-fix-musl-build.patch | 31 +++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/udpcast/0001-fix-musl-build.patch

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
