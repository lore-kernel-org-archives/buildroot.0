Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA071C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0F260AF5;
	Sat,  8 Jan 2022 18:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh_eip75131j; Sat,  8 Jan 2022 18:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0002360AA9;
	Sat,  8 Jan 2022 18:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 211951BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB9C4011F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4mUFyd6mQsd for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:12:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E86E7400E3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:12:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 196351BF205;
 Sat,  8 Jan 2022 18:12:02 +0000 (UTC)
Date: Sat, 8 Jan 2022 19:12:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20220108191202.374d45ae@windsurf>
In-Reply-To: <20200306071440.30433-7-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-7-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 6/7] package/qt5: generalize the condition
 on which EGLFS KMS gets supported
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  6 Mar 2020 08:14:39 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> BR2_PACKAGE_HAS_LIBEGL indicates that the virtual libegl packet is
> enabled. This packet may be provided by mesa3d (this is actually what
> happens when selecting BR2_PACKAGE_MESA3D_OPENGL_EGL) but
> other providers may exist.
> 
> Generalize the condition on which EGLFS KMS support is added to Qt5 to
> allow rockchip-mali-bifrost (and potentially other) to use the KMS
> back-end.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is no longer needed since commit
469829d9c55b7f5461e29f3f6436417836504410. All that conditional logic to
determine which Qt libraries and plugins to install is gone, as we now
use the Qt "make install" logic.

So I'll mark this patch as Superseded.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
