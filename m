Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EEFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D44F410AF;
	Thu, 30 Dec 2021 22:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Skx2kVSqg-Qd; Thu, 30 Dec 2021 22:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D41410A9;
	Thu, 30 Dec 2021 22:49:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1D11BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C9DC60C24
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:49:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LyIb9QEpqUJ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:49:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2351600B6
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:49:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1B7FE100004;
 Thu, 30 Dec 2021 22:49:52 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:49:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211230234951.321fa33c@windsurf>
In-Reply-To: <20211230223606.3076350-1-fontaine.fabrice@gmail.com>
References: <20211230223606.3076350-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to
 version 4.3.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 30 Dec 2021 23:36:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - heap buffer overflow in tcpreplay fast_edit_packet
> - heap buffer overflow in tcpreplay get_next_packet
> - CVE-2020-24266 heap buffer overflow in tcpprep get_l2len
> - CVE-2020-24265 heap buffer overflow in tcpprep
> - Drop patch (already in version) and so autoreconf
> - Update hash of license file (http -> https with
>   https://github.com/appneta/tcpreplay/commit/ad8a18005347b3cef84a9b478d56de96d1ad254f)
> 
> https://github.com/appneta/tcpreplay/releases/tag/v4.3.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-configure-ac-fix-without-libdnet.patch | 76 -------------------
>  package/tcpreplay/tcpreplay.hash              |  6 +-
>  package/tcpreplay/tcpreplay.mk                |  4 +-
>  3 files changed, 4 insertions(+), 82 deletions(-)
>  delete mode 100644 package/tcpreplay/0001-configure-ac-fix-without-libdnet.patch

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
