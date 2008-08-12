From: Steffen Schulz <pepe_ml@gmx.net>
Date: Tue, 12 Aug 2008 17:41:03 +0200
Subject: [Buildroot] New package util-linux-ng
In-Reply-To: <20080812074455.GA2451@mx.loc>
References: <20080810050649.GA26515@cbg.dyndns.org>
	<20080811170157.GA20864@cbg.dyndns.org>
	<20080812074455.GA2451@mx.loc>
Message-ID: <20080812154103.GA20961@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 080812 at 10:00, Bernhard Fischer wrote:
> On Mon, Aug 11, 2008 at 07:01:57PM +0200, Steffen Schulz wrote:
> >On 080810 at 07:27, Steffen Schulz wrote:
> >> - util-linux still wants to compile even though it was not selected and
> >>   removed from Config.in
> >> - with util-linux-ng.mk, the are no errors, the package is simply ignored
> >
> >Maybe I should have phrased that more like a question. I have a similar
> >problem now with a strongSwan package I need in buildroot.
> >
> >I created a .mk that uses makefile.autotools.in. I select the new
> >packet in menuconfig and type make, but the package is simply ignored.
> 
> Make sure to run 'make oldconfig' or menuconfig so the package shows up
> in .config ?

I did a menuconfig and selected the packages. And indeed .config says:

BR2_PACKAGE_strongSwan=y
BR2_PACKAGE_UTIL-LINUX-NG=y


But they are still ignored when typing 'make'. No directories in
/build_i686/ and no errors.


Most notably, when I replace the .mk files with equivalents that don't
use Makefile.autotools.in, both packages are processed. So I guess I
miss some magic in my .mk files?


/steffen
