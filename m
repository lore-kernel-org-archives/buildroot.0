From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 21:20:27 +0200
Subject: [Buildroot] [PATCH 3/5 v2] package/xorriso: fix to use the
 system xattr header
In-Reply-To: <20180630211629.411d671b@windsurf.home>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
 <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
 <20180630211629.411d671b@windsurf.home>
Message-ID: <20180630192027.GA23012@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-06-30 21:16 +0200, Thomas Petazzoni spake thusly:
> On Sat, 30 Jun 2018 16:21:25 +0200, Yann E. MORIN wrote:
> 
> > +# 0001-use-sys-xattr.h.patch
> > +XORRISO_DEPENDENCIES = host-pkgconf
> 
> Why do you need host-pkgconf ? For autoreconf to work fine ?

Yes. I'll update the commit log to mention that.

> If so, why
> isn't it also needed for host-xorriso ?

This is an oversight. I did not build host-xorriso alone, but after
building xorriso, so I missed that. I'll fix.

> > +XORRISO_AUTORECONF = YES
> > +HOST_XORRISO_AUTORECONF = YES
> 
> HOST_<pkg>_AUTORECONF gets derived from <pkg>_AUTORECONF, so
> HOST_XORRISO_AUTORECONF = YES doesn't seem to be very useful.

Yeah, I never remember which is inherited and which is not...

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
