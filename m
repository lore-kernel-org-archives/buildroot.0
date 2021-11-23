Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516A9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA81C4041A;
	Tue, 23 Nov 2021 16:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IU98oPd3jFyy; Tue, 23 Nov 2021 16:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B75784027F;
	Tue, 23 Nov 2021 16:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1031BF487
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 16:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 081E04027F
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 16:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inZVqm0ivfDB for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 16:50:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5D1540140
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 16:50:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j3so2349531wrp.1
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 08:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n0FgaSXMYwYya4b9OBgGNMPdRRIwLQ5fEEefIg44sw0=;
 b=Dh4RKNOYH3HsZieA2oyuO/6H1GOahR5PKxHUF01nelQKI23Rtm5KKkMLrxz91tdPNG
 hK2DrbV1R7QUCBHaaYyVNYJBZcKMqc7RSLaqFXrAUStIwrcpGHE8rhOdjIeBIFhYKI1+
 zopHEUDufkxr/rg0m4SsjBBJ7BpHTBDiESgofSQ6L+mzDW2flrBhLtuXUBAPkB2cWVfO
 xasGOh19zxzJc5XZyTlIyNWk/ZKLE4rW78kbp25CjH2c+ArfJyrOEAQ+K8GH/GkB1Zld
 shPE2fgEYTHT1AoZCWcmHPpTlASudyrTsnm/qXjHTTbo/qEYUhB3E94fCvlrd10XbmJp
 dC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0FgaSXMYwYya4b9OBgGNMPdRRIwLQ5fEEefIg44sw0=;
 b=IkZNM+qnrE1OVjNccu7CLZyd3vL5r/fFEp6UZ5HLhurs/Jrw4gKlWbpXDOxiCQwJdr
 mryAnNUuNAI2qGqhmeolJZdHF6sll4s8RGOp4iXIfvOIIo5XB7eKoYpv5QboDIwDtbfq
 7/VvlIKcXXGbsiW/JnAntNYZk4ZFP5cYQtBej2M6HBdsmnGIO4hdnz/Rhb6NsDMXlvp7
 egNER/gtypXdVrMYp1DA3ET5tiWqffl5H2H7vlqIhOt73vjKCFzF48ymxrA3NLObyZrS
 asUFbPcttb5kz1h38+uDn1z9lKbcLywMIMg+vNuWxLszUcDor3fF+CXYwXs2RyFflLnI
 MYSg==
X-Gm-Message-State: AOAM5330xFEAsVHK/V2shJx2O4lsm/Sw3qeyIC4KLWy5BMlU1hIbggLJ
 dsb2Q0V3Lu9pK//+dyH975A=
X-Google-Smtp-Source: ABdhPJyLp5h/mvkUojAQUdKxKPtSp9htofDpEOSaiF5hg8gH6u8p9u97QMs0TUGUeAl7tzHyOAxdbA==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr8872232wrn.183.1637686210074; 
 Tue, 23 Nov 2021 08:50:10 -0800 (PST)
Received: from camb691.localdomain (bilbo.ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id 38sm12993875wrc.1.2021.11.23.08.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 08:50:09 -0800 (PST)
Date: Tue, 23 Nov 2021 16:49:55 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211123164955.2f1fcee0@camb691.localdomain>
In-Reply-To: <25af82b3-1678-9812-e9fc-1527d48ad090@mind.be>
References: <20211123121530.3714511f@camb691.localdomain>
 <25af82b3-1678-9812-e9fc-1527d48ad090@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH] pkg-stats: Ignore make output without
 '=' character
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
Cc: luca@lucaceresoli.net, thomas.de_schampheleire@nokia.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Nov 2021 16:31:44 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 23/11/2021 13:15, Cyril Bur wrote:
> > It is possible that some users of buildroot have put it in a
> > repository and call into it from another Makefile such as:
> > .DEFAULT:
> > 	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)
> > 
> > This technique works well except that Make tells us that it changes
> > into the buildroot directory:
> > make[1]: Entering directory 'buildroot'  
> 
>   A better fix for this particular issue is for pkg-stats to call
> make with the --no-print-directory option.
> 

Excellent point, why did I discount that idea again? Probably because I
was doing 3 things at once.

I'll send that version.

Thanks,

Cyril

>   Regards,
>   Arnout
> 
> > 
> > Because this line doesn't have an equals within it, python raises a
> > ValueError exception within pkg-stats.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> > I have no idea if this technique fits in the buildroot philosophy
> > or if buildroot even wants to accommodate this but it sure would be
> > nice for me.
> > 
> >   support/scripts/pkg-stats | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index 3992c8312a..814e6f8855 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -388,7 +388,10 @@ def package_init_make_info():
> >   
> >       for item in variable_list:
> >           # Get variable name and value
> > -        pkgvar, value = item.split("=", maxsplit=1)
> > +        try:
> > +            pkgvar, value = item.split("=", maxsplit=1)
> > +        except ValueError e:
> > +            continue
> >   
> >           # Strip the suffix according to the variable
> >           if pkgvar.endswith("_LICENSE"):
> >   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
