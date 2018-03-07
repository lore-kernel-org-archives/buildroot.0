From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Mar 2018 22:22:59 +0100
Subject: [Buildroot] [PATCH 1/2] spport/check-bin-arch: accept arbitrary
 ignore paths
In-Reply-To: <87a7vjobry.fsf@dell.be.48ers.dk>
References: <cover.1520454419.git.yann.morin.1998@free.fr>
 <8a08e5fbfab7e4d021565077544576ad495c8097.1520454419.git.yann.morin.1998@free.fr>
 <87a7vjobry.fsf@dell.be.48ers.dk>
Message-ID: <20180307212259.GC2578@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-03-07 21:45 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
>  > +* +LIBFOO_BIN_ARCH_EXCLUDE+ is a space-separated list of path (relative
> s/path/paths/
> > +  to the target directory) to ignore when checking that the package
>  > +  installs correctly cross-compiled binaries. You seldom need to set this
>  > +  variable, unless the package installs installs binary blobs in the
> s/installs installs/installs/

Typoes fixed.

>  > +  non-default locations: `/lib/firmware`, `/usr/lib/firmware`,
>  > +  `/lib/modules`, and `/usr/share`.
> 
> This sounds a bit confusing to me, E.G. like these are non default
> locations.
> 
> Perhaps we should instead write:
> 
> variable, unless the package installs binary blobs outside the default
> locations, which are `/lib/firmware`, `/usr/lib/firmware`,
> `/lib/modules` and '/usr/share`, as these locations are automatically
> excluded.

Indeed, it was not clear (except maybe just in my twisted head). I've
rephrased slightly differently from your suggestion, but if you don;t
like it, we can go with yours instead.

>  >  if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
>  > -	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
>  > +	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> [-i PATTERN ...]"
> 
> We don't really document this as a pattern (even if it gets passed to ~=
> in the end), so perhaps it would be clearer to say [ -i PATH ]?

ACK.

> Otherwise it looks good to me, thanks!

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
