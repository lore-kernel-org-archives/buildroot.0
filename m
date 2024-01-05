Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F663C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D127400FE;
	Fri,  5 Jan 2024 12:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D127400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inA6FwHIOHMA; Fri,  5 Jan 2024 12:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A1A8401ED;
	Fri,  5 Jan 2024 12:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A1A8401ED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30F941BF385
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBAF5401ED
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAF5401ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-OEfIGExPUg for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:45:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2505E400FE
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2505E400FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B42420008;
 Fri,  5 Jan 2024 12:45:37 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:45:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105134536.0a1c165a@windsurf>
In-Reply-To: <20240105110201.491781-1-fontaine.fabrice@gmail.com>
References: <20240105110201.491781-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09JK3n3XsHa3w8BKg8Ia8xhmVXpDy4cpFYQ6HZP6pkA=;
 b=eZKR7IXHeJhBytSerXSlkfv9YnG9Uohe4Y4pK5dnycJpypk6YE7VaMnyhvL4yK7ez6lw4Y
 pBquwl9nbBJ90mJkuQHbLbM9hMDAxcuVx6yyaz3elz12BG4NJ86JrDZg2wAm5UixJNVRWb
 uR0T37epM8I7lmpxHOC67dhXsuSpt6czIM8Bo6aCJL4IzGo4D8pAE19zgCXws9T5bVGkNg
 SS/23e4hMrI0Qvrj7L0jO7OLYMa86TyC6AVPagKoEPR7S94dtlTuHjKag/g1xagyyFq6XK
 qr5ysAOhXASHPFmWkG0MIIsGAo69LTgGGQGL31/Tq5Bu7yy5XBX/x39c64SmpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eZKR7IXH
Subject: Re: [Buildroot] [PATCH 1/1] package/lsof: fix build without wchar
 or locale
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

On Fri,  5 Jan 2024 12:02:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without wchar or locale raised since
> bump to version 4.99.3 in commit
> 1edafc4b483e82b045d3a0cc9cbbd000d6183ac7 and
> https://github.com/lsof-org/lsof/commit/898fe0eceec98ca71198de7d9c18e7ce6144ee13:
> 
> In file included from common.h:42,
>                  from misc.c:31:
> ../machine.h:415:26: fatal error: wctype.h: No such file or directory
>   415 | #    define WIDECHARINCL <wctype.h>
>       |                          ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aa98b10e8eff5cc4fd03b4a64224cdfb6a0324a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lsof/lsof.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
