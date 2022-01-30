Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE35C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01B7A60BD5;
	Sun, 30 Jan 2022 14:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3udTSER9eTF1; Sun, 30 Jan 2022 14:49:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE3160A9F;
	Sun, 30 Jan 2022 14:49:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3B141BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD71460A9F
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCSvF0efmQAf for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:49:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFE6960692
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:49:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28023240005;
 Sun, 30 Jan 2022 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yRVlDqKIEpZpfUE0eRUlmezrHHUokTWrNjp86ExRm0=;
 b=YogIpZh9WaOshvav7tRYEoa+t/S141jDwpZXyVwTC4hdNe2Anz/rn/k0/Gg+QgC0/2Q2cv
 kIWBN0zoEST8tgq3e3dkwx0Pt8TQU9vSQg3Ec715QhZgxvy6eFIbLrR5qPMUGsmRjXunmR
 +XvR/zHEdzG9j6Zr5K6AHBeZWIyIASqq4Q2r5bg8Z2j+/p1MjejX9OWArY4P6lMvJ/mJxo
 SQ++fCgM0UxDSVA1BwXDbOFww33QfGUBWbqHqoDMeCvEHlFGXxrTSWmaAhA+0NteFi1aVH
 nfs2ldG91y+XgMkxeRquM1oRcwEPdl965UpLSu59NWDvkMpiBu2SeearuaNA2A==
Date: Sun, 30 Jan 2022 15:49:08 +0100
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Message-ID: <20220130154908.0ff0f0b6@windsurf>
In-Reply-To: <20220129214235.5133-2-thomas.devoogdt@gmail.com>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220129214235.5133-2-thomas.devoogdt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Thanks for your patch.

On Sat, 29 Jan 2022 22:42:35 +0100
Thomas Devoogdt <thomas.devoogdt@gmail.com> wrote:

> Libsoup3 has a new API [1], packages using libsoup2 may not
> compile with libsoup3 or may crash at runtime in unexpected
> ways. So the default will (for now) stay on libsoup2.
> A tracking table for the migration can be found here [2].

A "choice" is not going to work well, as it means that in a given
configuration we will only be able to install either packages that need
libsoup2 *or* packages that libsoup3, bit not a mix of both.

Is it possible to install both libsoup2 and libsoup3 side-by-side in
the same system? This requires them having a different library name and
a different location for header files.

If that's the case, we will definitely want to have a separate libsoup3
package, so that we can install libsoup and libsoup3 side by side in
the same system.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
