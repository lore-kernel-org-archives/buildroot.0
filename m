From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:24:24 +0200
Subject: [Buildroot] [PATCH 1/9] fix help text wrapping for configs e
In-Reply-To: <20170731191403.64ed5fae@windsurf.home>
References: <20170731135350.9018-1-aduskett@gmail.com>
 <20170731191403.64ed5fae@windsurf.home>
Message-ID: <20170731192424.74fe19a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 19:14:03 +0200, Thomas Petazzoni wrote:

> I've applied the series but:
> 
>  * There was a leftover PATCH 4/4 in the middle of the series. Please
>    try to be careful when sending series.
> 
>  * The subjects were not really formatted properly. They did not comply
>    with the principle of "<package>: <description>". I fixed this up.
> 
>  * It's generally quite annoying to get such patches now, when we're
>    about to close for -rc1. Do you really want to spend the
>    reviewer/maintainer time on reviewing/applying such patches, or
>    focus on more important things ? I know we need at some point to fix
>    all those warnings, but it's always annoying to receive such massive
>    patches :-/

And in addition, you did not even test your patches by running "make
menuconfig". They broke menuconfig:

package/libsysfs/Config.in:8: syntax error
package/libsysfs/Config.in:7: unknown option "http"
Makefile:876: recipe for target 'menuconfig' failed
make[1]: *** [menuconfig] Error 1

I already applied and pushed a follow-up fix for this.

But that can only strengthen my dislike for such patches...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
