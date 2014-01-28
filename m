From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Jan 2014 21:07:25 +0200
Subject: [Buildroot] Configuring the gpsd package
In-Reply-To: <20140128183340.410169ce@skate>
References: <858B5C1843112849BC285F6BF91A22640EB1BADB@VF2WDEXMB1.verifone.com>
 <20140102080145.GL6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BB09@VF2WDEXMB1.verifone.com>
 <20140102084544.GN6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBA1@VF2WDEXMB1.verifone.com>
 <20140102100454.GS6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBD1@VF2WDEXMB1.verifone.com>
 <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
 <20140106155637.GA4503@tarshish> <20140128183340.410169ce@skate>
Message-ID: <20140128190725.GD5596@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Thomas,

On Tue, Jan 28, 2014 at 06:33:40PM +0100, Thomas Petazzoni wrote:
> On Mon, 6 Jan 2014 17:56:37 +0200, Baruch Siach wrote:
> > > Anyway, I was able to run the gpsd and use the it in spite of probably 
> > > not having the two dependencies. My questions are:
> > > 1. What is the purpose of the two dependencies?
> > 
> > As the comment above the MMU dependency says, the gpsd code uses fork(). This 
> > system call is not available on non-MMU systems. The same goes for threads 
> > support. The package uses the pthreads API, and doesn't build without it.
> > 
> > > 2. How come I was able to use the daemon anyway?
> > 
> > Apparently you are using an external toolchain. When using an external 
> > toolchain you need to explicitly tell Buildroot whether you toolchain includes 
> > threading supports.
> 
> Correct, but Buildroot checks the selection the user has made in
> menuconfig against the real configuration of the toolchain, and if they
> don't match, the Buildroot build doesn't even start. Therefore, there
> is normally no way to do an incorrect configuration here.

Interesting. Where is the code implementing this check? Does it detect 
threading support when the user has not indicated that the toolchain has it 
(as is apparently the case here)?

> > As to MMU, for some reason this is option is disabled on your 
> > configuration, although clearly your target has MMU enabled.
> 
> Where have you seen Gabi's .config ? I've gone through this thread
> again, and I haven't seen his .config.

The message at http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/73739 
may be interpreted as saying that MMU and HAS_THREADS are not enabled, though 
it is more likely that only HAS_THREADS is missing.

> That being said, Gabi uses a 3+ years old Buildroot, and refuses to
> share his changes, so I must say that the incentive to provide some
> free support in such a situation is fairly low.

Agreed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
