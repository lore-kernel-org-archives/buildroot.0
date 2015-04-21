From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:22:46 +0200
Subject: [Buildroot] [PATCH 2/3] package/cache-calibrator: add hash
In-Reply-To: <87iocqt0wq.fsf@dell.be.48ers.dk>
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
 <1429583936-13335-2-git-send-email-fabio.porcedda@gmail.com>
 <87iocqt0wq.fsf@dell.be.48ers.dk>
Message-ID: <20150421172246.GB4262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-04-21 09:07 +0200, Peter Korsgaard spake thusly:
> >>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
> 
>  > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>  > ---
>  >  package/cache-calibrator/cache-calibrator.hash | 2 ++
>  >  1 file changed, 2 insertions(+)
>  >  create mode 100644 package/cache-calibrator/cache-calibrator.hash
> 
>  > diff --git a/package/cache-calibrator/cache-calibrator.hash b/package/cache-calibrator/cache-calibrator.hash
>  > new file mode 100644
>  > index 0000000..df61d17
>  > --- /dev/null
>  > +++ b/package/cache-calibrator/cache-calibrator.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally calculated
>  > +sha256 2018ed8fa733155d44ceb1c0066c5cf8df7771cdf7cfca0a07b8dd9bebd9c221 calibrator.c
> 
> This will cause issues when/if that file ever gets updated - But then
> atleast we know and can update the hash.

It also means that Buildroot 2015.05 will stop working at some point
when this file is updated. The problem is not much about Buildroot
master , which is easily fixable, but about our releases, that get
broken as soon as upstream changes that file.

I am not really happy with either solutions: either add a hash and break
releases in the future, or not add a hash file, and miss updates,
especially in the autobuilders (even though they do remove downloads
from time to time.

One case for the adding the hash, too, is that it will tell people that
their local copy in their local cache (e.g. my ~/src/ ) is out-of-date.

Still, I'm not convinced we want that hash...

Do we have other such packages (I think I read there was another
version-less package for now)?

Regards,
Yann E. MORIN.

> Committed, thanks.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
