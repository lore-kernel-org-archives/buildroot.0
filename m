Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD1EA8544
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 19:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA87E60A48;
	Sun,  8 Mar 2026 19:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0qv5XaIFXc2; Sun,  8 Mar 2026 19:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79630608C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772999058;
	bh=az9iiR/+FR8h1x2KjzNr4QXccwR7/IQlQMS/sRJ5zfI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lmMbZSkFJ29nMNDsq38mxAK3bzFG1m81FtRAJy5VqecXt1RFU2pkKaI89bdYYK5eq
	 7YDEupD7TbrdpreDyKropXk2lT/eBTJkuX8Cz+yO0ekS0qEMkKptiPpgFnwL1A++YB
	 KhzPOnfejgDfcRXLoGxh1Rc4dOP9qjNsYuB3coHM4x3UjME6tUU+HHQRHg7PFUa7r3
	 PgiihVseaH8I3oLt6rHkzkiL5u+q+CiK4cNyMOrpLtWMh46jrpTMja94zZyHMM1K6x
	 mC2GJrMLfXZqhXiVxxpYbECEs++7V08XHceEytbZYh7EDurgcQQTeRNiya62RFsoJe
	 vMGcRBww9//jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79630608C5;
	Sun,  8 Mar 2026 19:44:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D53F119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EDD040055
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_8t1YNqrT-u for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 19:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D7C840028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D7C840028
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D7C840028
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:44:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D1FDB1A2D5E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 19:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9410E5FF9D;
 Sun,  8 Mar 2026 19:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4527710369794; Sun,  8 Mar 2026 20:44:10 +0100 (CET)
Date: Sun, 8 Mar 2026 20:44:10 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aa3RSS1ySofI-yAO@windsurf>
References: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260308103213.1117775-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772999053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=EN3zhIeQQUThz1Wcr2fc5yFwh3Eyv7btthqL1bZELzY=;
 b=eVAX7YIvhld2Qq6tARrCk3Cvc6XVrxKzwsccOp1DKrot3lloNF+dlCkrN7+QcB37kg+5xx
 PDiOAZ9sPC1dWPXI7sS45SLVY7/7iK5xFB3PXtG5EcqXEaBYde+IUnHN2LRWL0Ln32EEfx
 4s/SQ3DFAgHcHsG8bFzLyaccKWGJVhkkuBqr7zqgWBsRe1k1eeRzIlUybeEk7ldDrnccdA
 uOhnQQASoH0dZNlJHEldJv0kMEXUdimmmrYDFYqimB1XoOqVi73Iyt+L4VoYkux5IQMh1K
 ooHv8Gw3+bapMko84OzA7QaEcG65oyWoBS13McAxdYHVtZxe+hzIiXqzbVSeYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eVAX7YIv
Subject: Re: [Buildroot] [PATCH 1/2] package/which: fix build with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 08, 2026 at 04:02:12PM +0530, Shubham Chakraborty wrote:
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  package/which/0001-fix-getopt-prototype.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/which/0001-fix-getopt-prototype.patch
> 
> diff --git a/package/which/0001-fix-getopt-prototype.patch b/package/which/0001-fix-getopt-prototype.patch
> new file mode 100644
> index 0000000000..29401b0f53
> --- /dev/null
> +++ b/package/which/0001-fix-getopt-prototype.patch

Patches should have a description (with a title, followed by one or
several paragraphs with details), plus a Signed-off-by line.

Also, patches should preferably be formatted using "git format-patch".

> @@ -0,0 +1,11 @@
> +--- a/getopt.h
> ++++ b/getopt.h
> +@@ -102,7 +102,7 @@
> +    errors, only prototype getopt for the GNU C library.  */
> + extern int getopt(int argc, char *const *argv, const char *shortopts);
> + #else  /* not __GNU_LIBRARY__ */
> +-extern int getopt();
> ++extern int getopt(int argc, char *const *argv, const char *shortopts);

I really don't see how this can be musl related. Much more likely to
be gcc-version related.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
