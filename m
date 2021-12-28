Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51ECC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BFB40586;
	Tue, 28 Dec 2021 20:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OiBsodMEPHaO; Tue, 28 Dec 2021 20:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B9304023F;
	Tue, 28 Dec 2021 20:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 995C11BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 881F1605A4
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugHnn6M73NQW for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:41:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 597B560B09
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:41:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4A060240007;
 Tue, 28 Dec 2021 20:41:04 +0000 (UTC)
Date: Tue, 28 Dec 2021 21:41:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211228214103.44d7c00f@windsurf>
In-Reply-To: <20211228142824.4046660-1-fontaine.fabrice@gmail.com>
References: <20211228142824.4046660-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigc: needs C++17
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Dec 2021 15:28:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> C++17 is mandatory since bump to version 3.0.7 in commit
> d676c0e494ff75f00402f8bbd4afa90d27cea89b and
> https://github.com/libsigcplusplus/libsigcplusplus/commit/617276cf47db463159263c359f7db09fcb6aaa9e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6753fc9dce030a7d8be9afd202a5e27bc09a0041
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/atkmm/Config.in                    | 6 +++---
>  package/cairomm/Config.in                  | 6 +++---
>  package/glibmm/Config.in                   | 6 +++---
>  package/gstreamer1/gstreamer1-mm/Config.in | 6 +++---
>  package/gtkmm3/Config.in                   | 6 +++---
>  package/libsigc/Config.in                  | 6 +++---
>  package/libsigrok/Config.in                | 6 +++---
>  package/libxmlpp/Config.in                 | 6 +++---
>  package/pangomm/Config.in                  | 6 +++---
>  package/pulseview/Config.in                | 6 +++---
>  10 files changed, 30 insertions(+), 30 deletions(-)

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
