From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Wed, 7 Jan 2015 07:05:59 +0000
Subject: [Buildroot] Newbie: building hdf5 for x86 32-bit --configure:
 error: C compiler cannot create executables
In-Reply-To: <20150107063046.GC2481@sapphire.tkos.co.il>
References: <9a6aa392add8416b984a427fd3d4d538@exch13-mail05.win.slac.stanford.edu>,
 <20150107063046.GC2481@sapphire.tkos.co.il>
Message-ID: <9F2BFD78-48D6-4E9F-81AB-18E01A1A430F@slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Sent from my iPhone

On Jan 6, 2015, at 10:30 PM, Baruch Siach <baruch at tkos.co.il<mailto:baruch@tkos.co.il>> wrote:

Hi Ernesto,

On Tue, Jan 06, 2015 at 08:39:42PM +0000, Williams Jr., Ernest L. wrote:
Another Newbie question.

I am now trying to build the hdf5 package for a 32-bit target.

I can't seem to track down this error:

checking for i686-buildroot-linux-uclibc-gcc... /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/ccache<http://slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/ccache> /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/i686-buildroot-linux-uclibc-gcc<http://slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/i686-buildroot-linux-uclibc-gcc>
checking whether the C compiler works... no
configure: error: in `/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14':
configure: error: C compiler cannot create executables
See `config.log' for more details

Use this clue. What do you see in config.log?

Location:
/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14/config.log

Yes, I found this in there:
uclibc/sysroot/usr/lib/crt1.o:<http://slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/host/linux-x86_64/i686-linux/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/crt1.o:>undefined reference to symbol '__uClibc_main'

I can't understand why this happening.  Must be something in my environment ?

Meanwhile, I logged into a different 64-bit build host; all is well
I'm back in business :)

However, I will come back to try and solve this mystery

Cheers
Ernesto


make: *** [/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14/.stamp_configured] Error 77

Thanks in advance for any guidance.

baruch

--
    http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
  - baruch at tkos.co.il<mailto:baruch@tkos.co.il> - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150107/a25d8a18/attachment.html>
