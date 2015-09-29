From: Crast, Nicholas <Nicholas.Crast@saabsensis.com>
Date: Tue, 29 Sep 2015 15:53:09 +0000
Subject: [Buildroot] Disabling Automatic Source Fetching
In-Reply-To: <20150929173135.7a1fe550@free-electrons.com>
References: <36A43B0E1E88D84791516F9D44BC4833281C84FD@corpmail01.corp.sensis.com>
 <20150929173135.7a1fe550@free-electrons.com>
Message-ID: <36A43B0E1E88D84791516F9D44BC4833281C8548@corpmail01.corp.sensis.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perfect. 

Thanks Thomas!

-Nick

----------------------------------------
Nick Crast
Software Engineer
Saab Sensis Corporation
Phone: 315-445-5703
Email: Nicholas.Crast at saabsensis.com

-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Tuesday, September 29, 2015 11:38 AM
To: Crast, Nicholas
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Disabling Automatic Source Fetching

Hello,

On Tue, 29 Sep 2015 14:40:37 +0000, Crast, Nicholas wrote:

> I've been hunting for awhile, but I cannot find anything about this.
> I want to disable Buildroot's automatic fetching of sources over the 
> network. We would like to go download any source packages ourselves 
> manually. Is there some sort of global configuration option to stop 
> Buildroot from accessing the network?

The best way is to enable BR2_PRIMARY_SITE_ONLY=y. If you set this option, Buildroot will only ever look for source code in two places:

 * In the local cache, indicated by BR2_DL_DIR, which defaults to the
   dl/ folder.

 * In the HTTP/FTP server indicated by BR2_PRIMARY_SITE, which is empty
   by default.

So basically, if you set BR2_PRIMARY_SITE_ONLY=y, and leave BR2_PRIMARY_SITE empty, Buildroot will only look into the local cache and not download anything from the network.

See also slide 99 and following in
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
