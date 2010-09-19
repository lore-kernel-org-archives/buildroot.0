From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 19 Sep 2010 13:19:30 +0200
Subject: [Buildroot] /etc/ld.so.conf and /etc/ld.so.conf.d in buildroot
 target skeleton
In-Reply-To: <AANLkTi=0_3BUjZ-gww3Kz99Y1dfvBcoNebrWX_fwE+u2@mail.gmail.com>
References: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
	<AANLkTi=LRi8OJTNY-3_q0_c=qcO4yv-sQoaJr=w=F=sf@mail.gmail.com>
	<AANLkTim=o6+2+jBXk0NAOv7md5TkK_V1tW9bcmsWfBER@mail.gmail.com>
	<1284659221.12897.414.camel@coalu.atr>
	<AANLkTi=0_3BUjZ-gww3Kz99Y1dfvBcoNebrWX_fwE+u2@mail.gmail.com>
Message-ID: <1284895170.12897.546.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed...

Maybe the might be created after the skeleton copy. If we're using a
uclibc toolchain, then create a single ld.so.conf file, otherwise create
an ld.so.conf.d directory and with a ld.so.conf file including *.conf
files from ld.so.conf.d.

What do think ?

Regards,

--
Lionel Landwerlin

Le dimanche 19 septembre 2010 ? 12:44 +0200, Thomas De Schampheleire a
?crit :
> On Thu, Sep 16, 2010 at 7:47 PM, Lionel Landwerlin
> <llandwerlin@gmail.com> wrote:
> > Well buildroot does support external toolchains, including a glibc one.
> 
> Agreed, but since this is not the default, why is there an
> ld.so.conf.d directory in the default skeleton? In my opinion, this is
> confusing.
> Having an empty ld.so.conf file would be clearer to buildroot users.
> 
> Best regards,
> Thomas
> 
> >
> > Regards,
> >
> > --
> > Lionel Landwerlin
> >
> > Le jeudi 16 septembre 2010 ? 19:30 +0200, Thomas De Schampheleire a
> > ?crit :
> >> Hi,
> >>
> >> On Thu, Sep 16, 2010 at 1:41 PM, Lionel Landwerlin
> >> <llandwerlin@gmail.com> wrote:
> >> > Yeah, having a an ld.so.conf which includes every files within
> >> > /etc/ld.so.conf.d/*.conf would be great !
> >>
> >> Unfortunately, it seems that uClibc ldconfig does not support
> >> 'include' statements in ld.so.conf.
> >>
> >> Based on this observation, I'd say that directory ld.so.conf.d is only
> >> relevant in case of glibc, is that correct? Why then is it in the
> >> skeleton?
> >>
> >> Thanks,
> >> Thomas
> >>
> >> >
> >> > Regards,
> >> >
> >> > --
> >> > Lionel Landwerlin
> >> >
> >> > On Thu, Sep 16, 2010 at 1:28 PM, Thomas De Schampheleire
> >> > <patrickdepinguin+buildroot@gmail.com> wrote:
> >> >> Hello,
> >> >>
> >> >> In the buildroot target skeleton exists a directory ld.so.conf.d, but
> >> >> no file ld.so.conf.
> >> >> The ld.so.conf.d directory is not parsed, unless you include the files
> >> >> there from ld.so.conf, like so:
> >> >>
> >> >> include /etc/ld.so.conf.d/*.conf
> >> >>
> >> >> I am wondering why this is the case. Shouldn't there be a skeleton
> >> >> /etc/ld.so.conf file?
> >> >> If not, how is /etc/ld.so.conf.d supposed to be used?
> >> >>
> >> >
> >
> >
> >
