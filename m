From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 9 Oct 2013 15:21:47 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
References: <CAM+bi4vJbFEGdDKMjJxesqR8T=g=KQkgeZpaLNy=1L_FsDkrPA@mail.gmail.com>
 <1381320976-948-1-git-send-email-alvaro.gamez@hazent.com>
 <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
Message-ID: <CAM+bi4u_0_EKNGwJVfdpDQYjPVPCRCSNdvYUs_06mYuwRT-5oA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


2013/10/9 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> We have had a long discussion on two buildroot developer days about
> the format of the number in patch names. I thought we had decided to
> use a four-digit format to correspond to the patches generated with
> git. So this should be 0001, 0002, etc.
> However, this may be mis-remembered by me, so I'm including some of
> the people involved in that discussion to this mail...
>

Sorry, I didn't read that. Whatever has been decided is fine.



>
> > diff --git a/package/Config.in b/package/Config.in
> > index 9aa9d81..3c44f67 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -727,6 +727,7 @@ source "package/libjson/Config.in"
> >  source "package/libroxml/Config.in"
> >  source "package/libxml-parser-perl/Config.in"
> >  source "package/libxml2/Config.in"
> > +source "package/libxmlrpc/Config.in"
> >  source "package/libxmlpp/Config.in"
>
> This alphabetical order is not correct, libxmlrpc should come after
> libxmlpp.
>

Oops.


>
> > +LIBXMLRPC_SITE = "
> http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/1.25.26
> "
>
> Why are there quotes around the URL?
>



To be honest, I don't know. I guess I copied that from somewhere and the
quotes where already there.




> > +LIBXMLRPC_LICENSE = BSD-like, Expat, Python 1.5.2 License
> > +LIBXMLRPC_LICENSE_FILES = doc/COPYING
>
> Are these three licenses used on identifyable parts of libxmlrpc, such
> that you could be more specific, like
> BSD-like (partA), Expat (partB) etc.?
>
> Also, what exactly do you mean with BSD-like? Is it possible to map
> onto one of the standard strings specified in
>
> http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses
> ?
>
> And finally, if there are three licenses, I'd expect three license
> files, unless the file doc/COPYING accumulates the license texts of
> all three licenses. Can you confirm?
>

Yes, the file doc/COPYING contains the three license texts. It explains
which license applies to what:

You can read it here

http://sourceforge.net/p/xmlrpc-c/code/HEAD/tree/trunk/doc/COPYING

and I'll comment a little on everything:


> All the code written specifically for Xmlrpc-c, which is most
> of the code, and the aggregation, is licensed under the
> XML-RPC FOR C/C++ license shown below.

This license is, as I understand it, is basically just BSD-3c, I guess.


> The Expat Licence applies to the contents of the directory lib/expat,

This is kind of a BSD license where "everything" is allowed with only one
requisite
"The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software."


> the ABYSS Web Server License applies to the contents of the directory
> lib/abyss and parts of the file src/xmlrpc_abyss.c.

This is again BSD-3c license, I think


> The Python 1.5.2 license applies to parts of the file
> src/xmlrpc_base64.c.


I guess I could just type all that as

BSD-3c (xml-rpc main code, lib/expat and abyss web server), Python 1.5.2
license (xmlrpc_base64.c)

What do you think?


Regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/e8a95457/attachment.html>
