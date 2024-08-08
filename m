Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D63DC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF95280B50;
	Thu,  8 Aug 2024 21:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peM2GBkt3q31; Thu,  8 Aug 2024 21:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80FC80C01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80FC80C01;
	Thu,  8 Aug 2024 21:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5FF1BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B23940E85
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMELonhVYcGe for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 21:29:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E7B440BFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7B440BFE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E7B440BFE
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 21:29:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 969C01C0003;
 Thu,  8 Aug 2024 21:29:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1scAhf-008dHP-36;
 Thu, 08 Aug 2024 23:29:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240519091604.2195932-1-thomas@devoogdt.com>
 <20240713000832.79ccfa53@windsurf>
Date: Thu, 08 Aug 2024 23:29:47 +0200
In-Reply-To: <20240713000832.79ccfa53@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 13 Jul 2024 00:08:32 +0200")
Message-ID: <878qx6n1o4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4] package/webkitgtk: bump to 2.44.2
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun, 19 May 2024 11:16:04 +0200
 > Thomas Devoogdt <thomas@devoogdt.com> wrote:

 >> A lot has been changed in 2.44.0, please consult the announcement [1], what's new [2],
 >> and the security advisory [3] for more details.
 >> 
 >> Specific to this bump:
 >> 
 >> - Libegl is now mandatory [4] and the USE_OPENGL_OR_ES flag has been dropped.
 >> While at it, also explicitly add the libepoxy dependency which is now selected
 >> by libgtk3.
 >> 
 >> - The WPE renderer has been dropped [2], so drop the wpebackend-fdo dependency.
 >> 
 >> - JPEG2000 has been dropped [2], so drop the OpenJPEG dependency.
 >> 
 >> - GTK4 is now the default, so turn it off, since buildroot has no GTK4 support
 >> yet [2].
 >> 
 >> - USE_LIBBACKTRACE has been added [5], so select it properly.
 >> 
 >> - Support for ENABLE_WEB_CODECS has been added, which will now be enabled
 >> together with audio and video support.
 >> 
 >> - ENABLE_WEBASSEMBLY is forbidden when ENABLE_C_LOOP [6], so disable it when
 >> compiling for MIPS r6, ARMv5, and ARMv6.
 >> 
 >> In the meantime, a follow-up 2.44.1 and 2.44.2 release has been announced [7][8],
 >> which contains a bunch of patches that were accepted upstream. Including build
 >> fixes for 32-bit devices, and disabling video.
 >> 
 >> [1]: https://webkitgtk.org/2024/03/16/webkitgtk2.44.0-released.html
 >> [2]: https://webkitgtk.org/2024/03/27/webkigit-2.44.html
 >> [3]: https://webkitgtk.org/security/WSA-2024-0002.html
 >> [4]: https://commits.webkit.org/271345@main
 >> [5]: https://commits.webkit.org/268579@main
 >> [6]: https://commits.webkit.org/271347@main
 >> [7]: https://webkitgtk.org/2024/04/09/webkitgtk2.44.1-released.html
 >> [8]: https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
 >> 
 >> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 >> ---
 >> v2: update patches with the upstream reference
 >> v3: bump to 2.44.1 and drop the upstreamed patches
 >> v4: bump to 2.44.2 and move xlib_libxshmfence to a separate patch series
 >> ---
 >> ...velInterpreter.cpp-339-21-error-t6-w.patch | 39 ---------------
 >> package/webkitgtk/Config.in                   |  4 +-
 >> package/webkitgtk/webkitgtk.hash              |  6 +--
 >> package/webkitgtk/webkitgtk.mk                | 50 ++++++++-----------
 >> 4 files changed, 26 insertions(+), 73 deletions(-)
 >> delete mode 100644 package/webkitgtk/0001-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
