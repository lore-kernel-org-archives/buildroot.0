From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 9 Feb 2015 17:43:14 +0100
Subject: [Buildroot] [0/21] Add missing indirect dependencies
In-Reply-To: <87zj8p5uwy.fsf@dell.be.48ers.dk>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
 <87zj8p5uwy.fsf@dell.be.48ers.dk>
Message-ID: <20150209164314.GB2079@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Feb 07, 2015 at 09:27:41PM +0100, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  >  With the fix for randconfig that I made in
>  > http://patchwork.ozlabs.org/patch/432554/ it is now possible to run
>  > 'make randconfig' and get usable results. So I ran the following loop
>  > to detect missing indirect dependencies:
> 
>  > while true; do make randconfig 2>&1 | grep warning; done
> 
>  > If there is a missing indirect dependency, this will output a line like:
> 
>  > warning: (BR2_PACKAGE_UTIL_LINUX_SETPRIV) selects BR2_PACKAGE_LIBCAP_NG which has unmet direct dependencies (!BR2_avr32)
> 
> Committed with the minor issues pointed out by Jerzy Grzegorek fixed,
> thanks.
> 
> 
> >  It would be good to include such a test in a jenkins job to detect this
>  > type of error earlier.
> 
> Indeed. Maxime, is that something you can setup?

Unfortunately, Jenkins has been down for quite some time now, and I
still haven't got the time to fix it.

What would be the test to setup?

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150209/78ad1276/attachment.asc>
