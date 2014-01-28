From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 20:42:14 +0100
Subject: [Buildroot] Configuring the gpsd package
In-Reply-To: <20140128190725.GD5596@tarshish>
References: <858B5C1843112849BC285F6BF91A22640EB1BADB@VF2WDEXMB1.verifone.com>
 <20140102080145.GL6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BB09@VF2WDEXMB1.verifone.com>
 <20140102084544.GN6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBA1@VF2WDEXMB1.verifone.com>
 <20140102100454.GS6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBD1@VF2WDEXMB1.verifone.com>
 <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
 <20140106155637.GA4503@tarshish> <20140128183340.410169ce@skate>
 <20140128190725.GD5596@tarshish>
Message-ID: <20140128204214.72bfe227@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 28 Jan 2014 21:07:25 +0200, Baruch Siach wrote:

> > Correct, but Buildroot checks the selection the user has made in
> > menuconfig against the real configuration of the toolchain, and if they
> > don't match, the Buildroot build doesn't even start. Therefore, there
> > is normally no way to do an incorrect configuration here.
> 
> Interesting. Where is the code implementing this check? Does it detect 
> threading support when the user has not indicated that the toolchain has it 
> (as is apparently the case here)?

It is implemented at
http://git.buildroot.net/buildroot/tree/toolchain/helpers.mk#n246.

And yes, it does both the "positive" check and the "negative" check:

 * If the toolchain has thread support, but the user hasn't selected
   the thread support for his external toolchain, we error out.

 * If the toolchain does not have thread support, but the user has
   selected thread support, we error out.

> > > As to MMU, for some reason this is option is disabled on your 
> > > configuration, although clearly your target has MMU enabled.
> > 
> > Where have you seen Gabi's .config ? I've gone through this thread
> > again, and I haven't seen his .config.
> 
> The message at http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/73739 
> may be interpreted as saying that MMU and HAS_THREADS are not enabled, though 
> it is more likely that only HAS_THREADS is missing.

Ok. We clearly don't have enough informations to help Gabi,
unfortunately.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
