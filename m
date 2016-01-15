From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Jan 2016 13:56:07 +0000
Subject: [Buildroot] [PATCH] trousers: disable pie option on ARC
In-Reply-To: <20160115143357.422dab52@free-electrons.com>
References: <1452860508-27467-1-git-send-email-ltrimas@synopsys.com>
 <20160115143357.422dab52@free-electrons.com>
Message-ID: <1452866166.18381.50.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Lada,

On Fri, 2016-01-15 at 14:33 +0100, Thomas Petazzoni wrote:
> Dear Lada Trimasova,
> 
> On Fri, 15 Jan 2016 15:21:48 +0300, Lada Trimasova wrote:
> > ARC gcc understands "-pie" option and attempts to generate PIE
> > binaries as of today PIE is not really supported for user-space
> > applications. So we provide option which can make relro and pie usage
> > optional and disable PIE detection if building for ARC. Also AUTORECONF
> > option should be added because of modified configure.in and Makefile.am
> > files.
> > 
> > Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>

[snip]

> Now that I think of it, what would be even better than adding a new
> config option is to simply test if the compiler is capable of linking a
> simple PIE binary. If the compiler is PIE capable, then trousers would
> use PIE, otherwise not.

I'm afraid that won't work for ARC. That's because simple apps could be
built but as we've seen already more complicated apps will fail to build.
I.e. we need to have an ability to force disable PIE on ARC.

Still check for PIE makes perfect sense but in addition to it we'll
need a way to disable that check and force disable PIE.

-Alexey
