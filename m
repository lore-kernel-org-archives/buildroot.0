From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 22:57:44 +0200
Subject: [Buildroot] [PATCH 1/4] package/Makefile.in: Do not use
 CPPFLAGS for hardening options
In-Reply-To: <d7ea7773c97c50f67188c891b06a057576de7bee.camel@spectralink.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <CANQCQpbaywbogjHpXaiQkBsS1Sas2R7tJiP2yW8mfxHrqq2_oQ@mail.gmail.com>
 <d7ea7773c97c50f67188c891b06a057576de7bee.camel@spectralink.com>
Message-ID: <20180425225744.016e6040@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Wed, 25 Apr 2018 13:08:18 +0000, S?rensen, Stefan wrote:
> On Wed, 2018-04-25 at 07:50 -0500, Matthew Weber wrote:
> 
> > Thanks for sending this series.  When we added the initial support we
> > debated on doing a few things differently at some point with how this
> > is implemented.  First, Buildroot uses a toolchain wrapper where it
> > could inject these flags vs appending like the current design does.  
> 
> Personally I prefer that flags are appended - when injecting them
> through the wrapper, they are invisible in the build logs. 

The problem with appended flags is that you are never sure they will be
passed. Indeed, some packages ignore the CFLAGS/LDFLAGS passed on the
command line. Having such flags in the wrapper ensures they are
*always* passed.

In addition, having such flags passed in the wrapper ensures that they
are passed even if you build something with the Buildroot toolchain, but
outside of Buildroot itself.

As part of the latest Buildroot hackathon, Arnout (added in Cc) and I
reviewed the usage of our flags, we concluded that hardening flags
should be passed through the wrapper. I have some notes about our
discussion, but haven't cleaned them up yet so they haven't been posted
so far.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
