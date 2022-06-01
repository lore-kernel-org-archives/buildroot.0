Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CE5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C177660D56;
	Wed,  1 Jun 2022 12:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJLQcX9unkkB; Wed,  1 Jun 2022 12:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E173960BE0;
	Wed,  1 Jun 2022 12:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 736B41BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70FC883134
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSStBDyj3N95 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:29:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49A7983131
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:29:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37A45200003;
 Wed,  1 Jun 2022 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654086587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUfL3Bmo4Ka3aLhFmBv60NzdWlAwNpGh21udpbgBhqc=;
 b=p7baenhQw8DwfyTmdlg7SQwWMaOolgk2anzgz8hPVC7Zhd76fckByNU26e60vP3h2VItzd
 Jm+PmqXhRhFaiL/fQ/vBGmF0WZV87OT4l56Eed2gfBI9sMp94HKYDgPpXl9asXlPoocGMf
 dpO4JgaI4qppi7JnhNvLNVUznPaFWNVyTb+AxcZ+d/MuxssVX54e/IERia3EzhOIoeoCvJ
 XiP7AzYkwSHxyhsEO11M5peWrr98GuI1440zdfeidySUhtPxtUux+wThFYcXoIevKbdww5
 i2UuXg2uMJaP23ignOKM1Ln8Fmqe8et8ZsroxzQIjOvR/PQRKXCtKVJ22/o+fA==
Date: Wed, 1 Jun 2022 14:29:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601142946.2916eaba@windsurf>
In-Reply-To: <20220531191036.107607-1-fontaine.fabrice@gmail.com>
References: <20220531191036.107607-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix version in zlib.pc
 when building statically
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

On Tue, 31 May 2022 21:10:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure with transmission:
> 
> checking for ZLIB... configure: error: Package requirements (zlib >= 1.2.3) were not met:
> 
> Package dependency requirement 'zlib >= 1.2.3' could not be satisfied.
> Package 'zlib' has version '', required version is '>= 1.2.3'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b3b882482f517726e5c780ba4c37818bd379df82
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-version-in-zlib.pc-when-building-.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch

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
