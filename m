From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Jan 2010 08:59:53 +0200
Subject: [Buildroot] Issue for the integration of Codesourcery external
 toolchains
In-Reply-To: <20100104162422.5b7e7bf6@surf>
References: <20100104162422.5b7e7bf6@surf>
Message-ID: <20100106065952.GA12127@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for you work on this. My comment below.

On Mon, Jan 04, 2010 at 04:24:22PM +0100, Thomas Petazzoni wrote:

[snip]

> Possible solutions
> ==================
> 
>  * Build a more normal sysroot in $(STAGING_DIR) by combining the
>    contents of armv4t and the header files. But this would require
>    telling gcc that the libraries aren't in armv4t anymore. This is
>    probably possible using a custom spec file, but is quite
>    complicated.

How about generating symlinks in the staging directory:

armv4t/usr/include -> ../../usr/include
thumb2/usr/include -> ../../usr/include

and then using the output of -print-sysroot for each target?

> 
>  * Reconsider the solution of copying the sysroot, and try harder with
>    the more traditionnal -L/-I solutions.
> 
>  * Another solution ?
> 
> Thanks for reading such a long mail, and thanks in advance for your
> ideas!

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
