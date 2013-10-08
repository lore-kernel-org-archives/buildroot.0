From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 20:58:19 +0200
Subject: [Buildroot] Two or three stages gcc build?
In-Reply-To: <20130919070255.17ce9a82@skate>
References: <20130705233831.12030038@skate>
 <9C6FE6D2-322A-41E7-8B82-C623B5C1F754@gmail.com>
 <20130906145821.4ce0ab13@skate>
 <EEBE54E3-BD6F-4BB5-88C4-CB3B51CC1FCC@gmail.com>
 <20130919070255.17ce9a82@skate>
Message-ID: <20131008205819.7f9bd5c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khem,

Any input on the below questions? :-)

Thanks!

Thomas

On Thu, 19 Sep 2013 07:02:55 +0200, Thomas Petazzoni wrote:
> Dear Khem Raj,
> 
> On Fri, 6 Sep 2013 09:59:34 -0700, Khem Raj wrote:
> 
> > > In the mean time, I've experimented a bit and actually implemented it.
> > > The patch hasn't been merged yet in Buildroot, but it has been posted:
> > > http://lists.busybox.net/pipermail/buildroot/2013-September/077344.html.
> > > 
> > > Don't hesitate to have a look and tell me what you think.
> > 
> > OK. The patch looks ok to me. one thing
> 
> After merging the patch, we got a report that it breaks SSP support,
> see [1]. After investigation, depending on the architecture, the
> __stack_chk_fail symbol maybe be part of the TLS (it's the case on x86,
> but on ARM, for example).
> 
> However, since we're now only doing gcc-initial -> uclibc -> gcc-final,
> and gcc-initial has no thread/TLS support, it breaks the build of
> uClibc when SSP support is enabled (in such a case, uClibc is built
> with -fstack-protector, which creates references to __stack_chk_fail,
> but this symbol isn't available because we don't have TLS support).
> 
> Have you already seen this problem? What solution do you suggest?
> 
> Thanks!
> 
> Thomas
> 
> [1]
> http://buildroot-busybox.2317881.n4.nabble.com/uClibc-fails-to-build-with-stack-smash-protection-td51478.html



-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
