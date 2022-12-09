Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B6BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 15:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 291F540FEB;
	Fri,  9 Dec 2022 15:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291F540FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSnnLTZ03W5E; Fri,  9 Dec 2022 15:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 595B940FC4;
	Fri,  9 Dec 2022 15:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 595B940FC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A252C1BF3DA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CEDE41B8C
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEDE41B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EOeoH5T4Hpt for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 15:32:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F9E41B60
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87F9E41B60
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 15:32:08 +0000 (UTC)
Received: from x230_1.trabucayre.com (nat-tf.ens2m.fr [194.167.45.244] (may be
 forged)) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 2B9FW5kv012511
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Dec 2022 16:32:06 +0100
Date: Fri, 9 Dec 2022 16:32:50 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221209163250.0a47324b@x230_1.trabucayre.com>
In-Reply-To: <20221209162708.30993bed@windsurf>
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
 <20221209162708.30993bed@windsurf>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: restrict gcc to >=
 9.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Dec 2022 16:27:08 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  9 Dec 2022 15:43:47 +0100
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Since commit 5a15095f65c655356989c91e52da1746cd96f41b gnuradio requires
> > gcc >= 9.3.0  
> 
> Is it really 9.3.0 that is required, or 9.x ?
> 
gnuradio ask for 9.3.0 but it's true one may wish to use gcc >= 9.0.0 but < 9.3.0.
I assume a BR2_TOOLCHAIN_HEADERS_AT_LEAST_9_3 must be added to strictly respect this
requirement?

> Because BR2_TOOLCHAIN_GCC_AT_LEAST_9 does not guarantee 9.3.0, it
> guarantees 9.x.
> 
> 
> > -comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
> > +comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library gcc >= 9"  
> 
>                                                                           ^^^^ missing comma
> 
> (No need to resend just for this)
'k
> 
> Thomas

Thanks
Gwen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
