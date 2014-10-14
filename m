From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 14 Oct 2014 10:24:05 +0200
Subject: [Buildroot] [PATCH 1/2] skeleton: ld.so.conf include
	ld.so.conf.d/*.conf
In-Reply-To: <20141014080340.GD3730@free.fr>
References: <1413186949-7006-1-git-send-email-jezz@sysmic.org>
 <20141014080340.GD3730@free.fr>
Message-ID: <2570696.SfvJUbX8Gd@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 October 2014 10:03:41 Yann E. MORIN wrote:
> J?r?me, All,
> 
> On 2014-10-13 09:55 +0200, J?r?me Pouiller spake thusly:
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  system/skeleton/etc/ld.so.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 100644 system/skeleton/etc/ld.so.conf
> > 
> > diff --git a/system/skeleton/etc/ld.so.conf
> > b/system/skeleton/etc/ld.so.conf new file mode 100644
> > index 0000000..83327c0
> > --- /dev/null
> > +++ b/system/skeleton/etc/ld.so.conf
> > @@ -0,0 +1 @@
> > +include /etc/ld.so.conf.d/*.conf
> 
> Are you sure this works with uClibc? Looking at the code of ldconfig
> from uClibc seems to imply it does not support including files.
I admit I have not tested with uclibc. 

hmm... Suddenly, it is more complex to implement. I see two options:
  * Provide /etc/ld.so.conf during toolchain build depending of libc.
  * Add extra library paths directly in /etc/ld.so.conf instead of adding a 
file in /etc/ld.so.conf.d. However, modifying files during install step is 
error prone.

Any preference?


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
