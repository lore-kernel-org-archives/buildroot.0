From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 11:10:44 +0200
Subject: [Buildroot] [PATCH] giflib: fix description about compatibility
 with libungif
In-Reply-To: <20150412084723.GH2279@tarshish>
References: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
 <20150412084723.GH2279@tarshish>
Message-ID: <20150412091044.GA4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-04-12 11:47 +0300, Baruch Siach spake thusly:
> On Sun, Apr 12, 2015 at 10:43:05AM +0200, Fabio Porcedda wrote:
> > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> > ---
> >  package/giflib/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/giflib/Config.in b/package/giflib/Config.in
> > index 70368dc..bb5741a 100644
> > --- a/package/giflib/Config.in
> > +++ b/package/giflib/Config.in
> > @@ -1,7 +1,7 @@
> >  config BR2_PACKAGE_GIFLIB
> >  	bool "giflib"
> >  	help
> > -	  giflib is a library for reading and writing gif images. It is API and
> > +	  giflib is a library for reading and writing gif images. It was API and
> >  	  ABI compatible with libungif which was in wide use while the LZW
> >  	  compression algorithm was patented.
> 
> So giflib is not compatible to libungif anymore?

No it is no longer comatible. It was, until version 5.0 introduced
changes for thread-safety. Quoting their website:

    The 5.x versions change the API slightly in a way that isn't
    compatible with older shared libraries.

and:

    [...] the signatures of the file-opener functions were changed in
    5.0 in  order to make the library fully reentrant and thread-safe

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
