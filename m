From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 11:13:01 +0200
Subject: [Buildroot] [PATCH] giflib: fix description about compatibility
 with libungif
In-Reply-To: <20150412090834.GI2279@tarshish>
References: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
 <20150412084723.GH2279@tarshish>
 <CAHkwnC8W0A+GTHiVuTo1D5ViNzbr8NjvZd-hO5+YGDAB+RhTHA@mail.gmail.com>
 <20150412090834.GI2279@tarshish>
Message-ID: <20150412091301.GB4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-04-12 12:08 +0300, Baruch Siach spake thusly:
> On Sun, Apr 12, 2015 at 10:57:40AM +0200, Fabio Porcedda wrote:
> > On Sun, Apr 12, 2015 at 10:47 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > > On Sun, Apr 12, 2015 at 10:43:05AM +0200, Fabio Porcedda wrote:
> > >> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> > >> ---
> > >>  package/giflib/Config.in | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/package/giflib/Config.in b/package/giflib/Config.in
> > >> index 70368dc..bb5741a 100644
> > >> --- a/package/giflib/Config.in
> > >> +++ b/package/giflib/Config.in
> > >> @@ -1,7 +1,7 @@
> > >>  config BR2_PACKAGE_GIFLIB
> > >>       bool "giflib"
> > >>       help
> > >> -       giflib is a library for reading and writing gif images. It is API and
> > >> +       giflib is a library for reading and writing gif images. It was API and
> > >>         ABI compatible with libungif which was in wide use while the LZW
> > >>         compression algorithm was patented.
> > >
> > > So giflib is not compatible to libungif anymore?
> > 
> > Just comparing the gif_lib.h header you can see that the definition of
> > some functions changes:
> > 
> > git diff --no-index libungif-4.1.4/lib/gif_lib.h giflib-5.1.1/lib/gif_lib.h
> > 
> >  GifFileType *EGifOpenFileName(const char *GifFileName,
> > -                              int GifTestExistance);
> > -GifFileType *EGifOpenFileHandle(int GifFileHandle);
> > -GifFileType *EGifOpen(void *userPtr, OutputFunc writeFunc);
> > -
> > +                              const bool GifTestExistence, int *Error);
> > +GifFileType *EGifOpenFileHandle(const int GifFileHandle, int *Error);
> > +GifFileType *EGifOpen(void *userPtr, OutputFunc writeFunc, int *Error);
> >  int EGifSpew(GifFileType * GifFile);
> 
> If this is the case I would use a more explicit language. Something like:
> 
> 	giflib used to be API and ABI compatible with libungif which ... Note that 
> 	recent gitlib versions are no longer compatible with libungif.

I would even go further, and remove any reference to libungif
altogether. So, just keep the first sentence:

    giflib is a library for reading and writing gif images.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
