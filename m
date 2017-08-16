From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 22:53:24 +0200
Subject: [Buildroot] Analysis of build results for 2017-08-14
In-Reply-To: <865c6d16-fd88-294e-2fea-62cf312fbacb@mind.be>
References: <20170815063102.ED3612091A@mail.free-electrons.com>
 <20170815142032.329e8103@windsurf>
 <865c6d16-fd88-294e-2fea-62cf312fbacb@mind.be>
Message-ID: <20170816225324.331fec56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Aug 2017 22:35:05 +0200, Arnout Vandecappelle wrote:

> >>          arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/0a3a2485c187a000482c178f1e9c64dd716a858f |       
> > 
> > /home/buildroot/autobuild/run/instance-2/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(libgstreamer_1.0_la-gstinfo.o): In function `generate_unwind_trace':
> > /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2687: undefined reference to `_ULarm_init_local'
> > /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2694: undefined reference to `_ULarm_step'
> > /home/buildroot/autobuild/run/instance-2/output/build/gstreamer1-1.12.2/gst/gstinfo.c:2717: undefined reference to `_ULarm_get_proc_name'
> > 
> > No idea. It's happening in a static linking configuration. Not sure
> > what is supposed to provide those symbols.  
> 
>  They are from libunwind.

OK, so we need to look at what's going on here.

> > Gustavo is listed in the DEVELOPERS file for this package, but I don't
> > think he is going to be active in fixing this. Anyone else to look into
> > that ?  
> 
>  Perhaps we should remove Gustavo from DEVELOPERS entirely?

Yes, perhaps we should do that. Not sure if it's too early to do that
or not.

> >>       x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/8f0342b7b88df979a59fdab574b2489628d7ffa5 | ORPH  
> > 
> > Not sure what's happening here:
> > 
> > linking shared-library libruby.so.2.4.1
> > libruby.so.2.4.1: final close failed: Invalid operation
> > collect2: error: ld returned 1 exit status
> > 
> > Anyone to look into this ?  
> 
>  Perhaps an instance of https://sourceware.org/bugzilla/show_bug.cgi?id=20006 ?
> Not sure if that patch has been applied to the sourcery toolchain - it should
> be, since the binutils 2.26 fix was committed in April 2016 and the toolchain is
> from November, but it's hard to be sure.

If you look at http://autobuild.buildroot.net/?reason=ruby-2.4.1, this
issue only appeared two times: in July 2017 and August 2017. This
Sourcery toolchain has been around for much longer, and was last bumped
in December 2016.

So if it was just the Sourcery toolchain being unable to build
ruby-2.4.1, I think we would have a lot more failures than that. So it
might be a toolchain issue, but that occurs under very specific
conditions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
