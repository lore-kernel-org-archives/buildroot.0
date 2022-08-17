Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E346C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 10:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C1783295;
	Wed, 17 Aug 2022 10:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7C1783295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRDLBL-Ou5TV; Wed, 17 Aug 2022 10:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DC883267;
	Wed, 17 Aug 2022 10:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DC883267
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD0F1BF377
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C20B41A02
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 10:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C20B41A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmcxlVqLR0o5 for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 10:45:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D39E3419FE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D39E3419FE
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 10:45:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70EFF1BF206;
 Wed, 17 Aug 2022 10:45:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOGXj-00C3Ri-HJ; Wed, 17 Aug 2022 12:44:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20210510195352.13205-1-ps.report@gmx.net>
 <20220725150025.12ee53e7@windsurf>
Date: Wed, 17 Aug 2022 12:44:59 +0200
In-Reply-To: <20220725150025.12ee53e7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 25 Jul 2022 15:00:25 +0200")
Message-ID: <87czcz9mj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC v1] package/rpi-userland: add GLint64,
 GLuint64 and GLsync typedefs to GLES2/gl2ext.h
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Peter,
 > On Mon, 10 May 2021 21:53:52 +0200
 > Peter Seiderer <ps.report@gmx.net> wrote:

 >> The problem is that gstreamer sees the original gl2ext.h file from
 >> rpi-userland (rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11/interface/khronos/include/GLES2/gl2ext.h)
 >> without the additional GLint64, GLuint64 and GLsync typedef definitions but
 >> checks for existance and if not found enables its own versions in gstgl_compat.h,
 >> incompatible with the later ones used from Qt (qopengles2ext.h).
 >> 
 >> Fix this by adding the same typedef definitions already to the
 >> rpi-userland header version.

 > Romain and I finally had a look at this. I was a bit confused by your
 > explanation, so after doing our investigation, I rewrote it this way:

 >     The problem is that rpi-userland doesn't define GLsync, and both
 >     GStreamer and Qt have their own definition of GLsync in this case, but
 >     they are not the same.
    
 >     We reported this issue to:
    
 >      * rpi-userland, to get the headers updated:
 >        https://github.com/raspberrypi/userland/issues/469#issuecomment-1193864294
    
 >      * gstreamer, to get their bogus definition of GLsync fixed:
 >        https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/973
    
 >     In the mean time, fix this by adding the missing definitions to
 >     rpi-userland, so that GStreamer and Qt don't try to provide their own.
    
 > As you can see, I also reported the issue back to rpi-userland (more
 > precisely pinged in an existing issue) and to GStreamer.

 > But for now, what you proposed is the most immediate fix, so I've
 > applied your patch to master with an updated commit log and patch
 > description.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
