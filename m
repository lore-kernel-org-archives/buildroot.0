From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 23:26:25 +0200
Subject: [Buildroot] [PATCH 009/121] package/gstreamer: add hash file
In-Reply-To: <8760t53rsd.fsf@dell.be.48ers.dk>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <26ab2309f8d9c962e70b2f080f362aa03f64f8b1.1466334225.git.yann.morin.1998@free.fr>
 <8760t53rsd.fsf@dell.be.48ers.dk>
Message-ID: <20160619212625.GC3673@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-06-19 21:25 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/gstreamer/gstreamer/gstreamer.hash | 4 ++--
>  >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
>  > diff --git a/package/gstreamer/gstreamer/gstreamer.hash b/package/gstreamer/gstreamer/gstreamer.hash
>  > index e652eae..2feb6be 100644
>  > --- a/package/gstreamer/gstreamer/gstreamer.hash
>  > +++ b/package/gstreamer/gstreamer/gstreamer.hash
>  > @@ -1,2 +1,2 @@
>  > -# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz.md5
>  > -md5	15389c73e091b1dda915279c388b9cb2	gstreamer-0.10.36.tar.xz
>  > +# localy computed
>  > +sha256  9151aa108c177054387885763fa0e433e76780f7c5655c70a5390f2a6c6871da  gstreamer-0.10.36.tar.xz
> 
> I don't think it makes sense to remove the upstream hash even if it is a
> weak md5sum,

Indeed no.

> so I've instead just added the locally calculated sha256 to
> it.

Well, I know what hapenned. I did a supposedly-smart find to look for
packages without a .hash file, but gstreamer.mw exists in two locations:

    package/gstreamer/gstreamer.mk
    package/gstreamer/gstreamer/gstreamer.mk

And of course, only the second is a package and already has a .hash.

However, the first matches those two conditions:

  - it is in a directory named after the same as the basename of the .mk

  - there is no corresponding .hash

And thus it decided to add a hash for it. And somewhere later, the
script found the correct location of the package, thus overwriting the
existing hash...

Sorry for the mishap; thanks for fixing it! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
