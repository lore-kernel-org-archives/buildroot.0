Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF821C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6B8606B6;
	Sun,  5 Dec 2021 10:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTTz0DD4Mrps; Sun,  5 Dec 2021 10:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B531E607D9;
	Sun,  5 Dec 2021 10:11:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182EC1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C0440112
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ge_E4BfrimgC for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:11:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE4B740105
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:11:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 01A761C000A;
 Sun,  5 Dec 2021 10:11:32 +0000 (UTC)
Date: Sun, 5 Dec 2021 11:11:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211205111132.3d314cb7@windsurf>
In-Reply-To: <20211124180509.20403-1-ps.report@gmx.net>
References: <20211124180509.20403-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next v1] package/rpi-userland: fix download
 hash
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Nov 2021 19:05:09 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Commit 'package/rpi-userland: bump version to bab9bf8'
> (76875989326d9122db272c1a0f49b92961c3f2af) forgot to adjust the
> download hash.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/49a27362e36bad6076a727877bccb6e28edb06bd
> 
>   ERROR: rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz has wrong sha256 hash:
>   ERROR: expected: e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8
>   ERROR: got     : 16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41
>   ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/rpi-userland/rpi-userland.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
