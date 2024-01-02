Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489FEC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E83F9409F1;
	Tue,  2 Jan 2024 20:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83F9409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZHev_elr94d; Tue,  2 Jan 2024 20:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C068A40A5C;
	Tue,  2 Jan 2024 20:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C068A40A5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90E401BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680F540948
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680F540948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44EF7-G8RQc5 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:33:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00AE040A5D
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00AE040A5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ED2520004;
 Tue,  2 Jan 2024 20:33:28 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:33:27 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102213327.1cee0244@windsurf>
In-Reply-To: <20240102110031.737953-1-fontaine.fabrice@gmail.com>
References: <20240102110031.737953-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704227608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jg87urGiUjYtl+LgeQd1nxwtASL9I5cX3yoKqhxmWys=;
 b=Ma4ZfEM29Z2MgmwVFnGl9mxJepI9xobqHA8uDqE9C7b4btxwo+tr0eZTOwWx7hAGEtBof+
 3P3LgINuHoY0/F40K4FH4uoWIGPm3yLnO0mDfp6bp5z4nw0P6ImtATm67TUhS/7UlKp4VO
 xtOxwo+3J80tIFQXK6pE1vrPeypAK0zF3kTvLqehUU92fLY2apSHVHDvXskw3fQczLL28L
 oyJ9XBZ3WPqTKbwjRyGotLQZ93piBKmnvzwr2fXxUjtEHVaqn/KZhR0bwJiRd4DWxnthbt
 aALk27/BGpD+PHu92omq4ccZtdm9aaJY1ME3Q7ito3yzBu8nKu0a8YIC3TbTvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ma4ZfEM2
Subject: Re: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.14
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

On Tue,  2 Jan 2024 12:00:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following libsoup3 build failure raised since
> commit 9cbffdf9be622c8ddad3b28106851b3101b3d201:
> 
> FAILED: libsoup/libsoup-3.0.vapi
> /home/buildroot/autobuild/instance-1/output-1/host/bin/vapigen --quiet --library=libsoup-3.0 --directory=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup --pkg=gio-2.0 --metadatadir=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup/Soup-3.0.gir /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup/Soup-3.0-custom.vala
> Soup-3.0.gir:6877.95-6877.95: error: The type name `GLib.TlsProtocolVersion' could not be found
> 
> https://gitlab.gnome.org/GNOME/vala/-/blob/0.56.14/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/732fcd20c2998e7d7b6b8f61871ad104f8d243df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vala/vala.hash | 4 ++--
>  package/vala/vala.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
