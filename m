From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 16 Sep 2010 19:47:01 +0200
Subject: [Buildroot] /etc/ld.so.conf and /etc/ld.so.conf.d in buildroot
 target skeleton
In-Reply-To: <AANLkTim=o6+2+jBXk0NAOv7md5TkK_V1tW9bcmsWfBER@mail.gmail.com>
References: <AANLkTimEShvTw0M4Yt4dGE3BbxbX4q4RQ5tfbc-BJ7rb@mail.gmail.com>
	<AANLkTi=LRi8OJTNY-3_q0_c=qcO4yv-sQoaJr=w=F=sf@mail.gmail.com>
	<AANLkTim=o6+2+jBXk0NAOv7md5TkK_V1tW9bcmsWfBER@mail.gmail.com>
Message-ID: <1284659221.12897.414.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well buildroot does support external toolchains, including a glibc one.

Regards,

--
Lionel Landwerlin

Le jeudi 16 septembre 2010 ? 19:30 +0200, Thomas De Schampheleire a
?crit :
> Hi,
> 
> On Thu, Sep 16, 2010 at 1:41 PM, Lionel Landwerlin
> <llandwerlin@gmail.com> wrote:
> > Yeah, having a an ld.so.conf which includes every files within
> > /etc/ld.so.conf.d/*.conf would be great !
> 
> Unfortunately, it seems that uClibc ldconfig does not support
> 'include' statements in ld.so.conf.
> 
> Based on this observation, I'd say that directory ld.so.conf.d is only
> relevant in case of glibc, is that correct? Why then is it in the
> skeleton?
> 
> Thanks,
> Thomas
> 
> >
> > Regards,
> >
> > --
> > Lionel Landwerlin
> >
> > On Thu, Sep 16, 2010 at 1:28 PM, Thomas De Schampheleire
> > <patrickdepinguin+buildroot@gmail.com> wrote:
> >> Hello,
> >>
> >> In the buildroot target skeleton exists a directory ld.so.conf.d, but
> >> no file ld.so.conf.
> >> The ld.so.conf.d directory is not parsed, unless you include the files
> >> there from ld.so.conf, like so:
> >>
> >> include /etc/ld.so.conf.d/*.conf
> >>
> >> I am wondering why this is the case. Shouldn't there be a skeleton
> >> /etc/ld.so.conf file?
> >> If not, how is /etc/ld.so.conf.d supposed to be used?
> >>
> >
