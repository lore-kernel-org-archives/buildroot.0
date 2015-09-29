From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 17:31:35 +0200
Subject: [Buildroot] Disabling Automatic Source Fetching
In-Reply-To: <36A43B0E1E88D84791516F9D44BC4833281C84FD@corpmail01.corp.sensis.com>
References: <36A43B0E1E88D84791516F9D44BC4833281C84FD@corpmail01.corp.sensis.com>
Message-ID: <20150929173135.7a1fe550@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Sep 2015 14:40:37 +0000, Crast, Nicholas wrote:

> I've been hunting for awhile, but I cannot find anything about this.
> I want to disable Buildroot's automatic fetching of sources over the
> network. We would like to go download any source packages ourselves
> manually. Is there some sort of global configuration option to stop
> Buildroot from accessing the network?

The best way is to enable BR2_PRIMARY_SITE_ONLY=y. If you set this
option, Buildroot will only ever look for source code in two places:

 * In the local cache, indicated by BR2_DL_DIR, which defaults to the
   dl/ folder.

 * In the HTTP/FTP server indicated by BR2_PRIMARY_SITE, which is empty
   by default.

So basically, if you set BR2_PRIMARY_SITE_ONLY=y, and leave
BR2_PRIMARY_SITE empty, Buildroot will only look into the local cache
and not download anything from the network.

See also slide 99 and following in
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
