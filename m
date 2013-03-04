From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Mar 2013 22:57:42 +0100
Subject: [Buildroot] [PATCH 2/2 V5] nodejs: new package
In-Reply-To: <20130304221946.6c6d62cd@skate>
References: <1362102967-10236-1-git-send-email-daniel.price@gmail.com>
 <20130304221946.6c6d62cd@skate>
Message-ID: <201303042257.42979.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel, Thomas, Luca, All,

On Monday 04 March 2013 Thomas Petazzoni wrote:
> On Thu, 28 Feb 2013 17:56:07 -0800, Daniel Price wrote:
[--SNIP--]
> > diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> > new file mode 100644
> > index 0000000..b30fcd4
> > --- /dev/null
> > +++ b/package/nodejs/nodejs.mk
> > @@ -0,0 +1,109 @@
> > +#############################################################
> > +#
> > +# nodejs
> > +#
> > +#############################################################
> > +
> > +NODEJS_VERSION = 0.8.21
> > +NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
> > +NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> > +NODEJS_DEPENDENCIES = host-python host-nodejs \
> > +    $(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> > +HOST_NODEJS_DEPENDENCIES = host-python
> > +NODEJS_LICENSE = MIT
> 
> Please add:
> 
> NODEJS_LICENSE_FILES = LICENSE
> 
> That said, as the LICENSE file explains, nodejs source code includes
> some code from various other projects, under other licenses. Maybe the
> licensing experts should tell us what value NODEJS_LICENSE should have
> here. Yann? Luca? See
> https://github.com/joyent/node/blob/master/LICENSE if you don't want to
> download the whole nodejs source code.

First: I am not an authoritative licensing expert.

What I would state would be something like:

NODEJS_LICENSE = MIT (core code); non-copyleft BSD-like (bundled libraries)

In any case, I'd leave it to the user (or his/her legal department) to sort
out the exact licensing terms by looking at the LICENSE file, which as Thomas
mentionned, shall be referenced by the NODEJS_LICENSE_FILES variable.

IIRC, the licensing infrastrucutre in Buildroot is not meant to be
authoritative, and should be regarded by the user only as a guide.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
