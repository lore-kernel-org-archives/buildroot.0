From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 1 May 2008 09:16:46 -0700
Subject: [Buildroot] What is the best way to deactivate XML Parser
	(expat) for ARM build?
In-Reply-To: <4819E7FF.5000902@gmail.com>
References: <326f33790805010751v24facd35o4207041c297da12c@mail.gmail.com>
	<4819E7FF.5000902@gmail.com>
Message-ID: <326f33790805010916n321c394ej93bf891b65c34986@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert,

Thank you very much for that information! I was almost about to try to do a
build for at91sam9260 or a previous version just to be certain. I did make
expat, then after that finished I went ahead and proceeded with the build by
typing make. I got past the error above about libexpat, but I ended up
getting to an error saying:

Checking for XML::Parser...configure: error: XML::Parser perl module is
required for intltool.

Was this supposed to be resolved with make expat as well? Or does this
require a different package to be passed into make? Thanks again.

On Thu, May 1, 2008 at 8:55 AM, Robert Nelson <robert.nelson.work@gmail.com>
wrote:

> -- added CC to Buildroot List
>
> Hi Arun,
>
> I've recently run into this too...  for some reason the expat dependency
> isn't properly built with the default at91sam9263_defconfig.  Until this
> gets fixed upstream, I've been issuing an "make expat" after the error first
> occurs, this moves the generated libexpat into the correct directory.. After
> which the build process will continue till the next error. (checking for
> GLIB - version >= 2.2.0... no)
>
> Robert Nelson
> FAE - Digi-Key
>
> Arun Reddy wrote:
>
> > I have been stuck for quite a few days on a problem dealing with the
> > build process failing because it cannot find the XML Parser library
> > libexpat. I was wondering is this even necessary for the build to complete?
> > Can I deactivate it? It seems my problem is very unique and no other people
> > have encountered it when doing an ARM build, so how did you guys deactivate
> > the XML Parser?
> >
> > Thank you.
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080501/d3527129/attachment.htm 
