From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Fri, 18 Sep 2020 09:57:30 +0800
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: disable the e2scrub
 stuff
In-Reply-To: <20200917213935.67fc4894@windsurf.hq.k.grp>
References: <1600333425.32426.1.camel@aliyun.com>
 <20200917213935.67fc4894@windsurf.hq.k.grp>
Message-ID: <1600394250.18560.2.camel@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?, 2020-09-17 at 21:39 +0200, Thomas Petazzoni wrote:
> On Thu, 17 Sep 2020 17:03:45 +0800
> Tian Yuanhao via buildroot <buildroot@busybox.net> wrote:
>?
> > 
> > diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> > index eb82a55..cf6579d 100644
> > --- a/package/e2fsprogs/e2fsprogs.mk
> > +++ b/package/e2fsprogs/e2fsprogs.mk
> > @@ -52,7 +52,10 @@ E2FSPROGS_CONF_OPTS = \
> > ?	--disable-e2initrd-helper \
> > ?	--disable-testio-debug \
> > ?	--disable-rpath \
> > -	--enable-symlink-install
> > +	--enable-symlink-install \
> > +	--with-crond-dir=no \
> > +	--with-systemd-unit-dir=no \
> > +	--with-udev-rules-dir=no
> I'm not sure this is really a good solution. Indeed, we probably do
> want to install udev rules or systemd services.
> 
> Thomas

'--with-crond-dir=no --with-systemd-unit-dir=no --with-udev-rules-dir=no'
is approximately equal to '--disable-scrub' which does not exist.

Android [1], Yocto [2] and PTXdist [3] do not install e2scrub. Therefore,
I thought Buildroot should boldly use those options.

[1]: https://android.googlesource.com/platform/external/e2fsprogs/+/refs/heads/master/Android.bp
[2]: http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb
[3]: https://git.pengutronix.de/cgit/ptxdist/tree/rules/e2fsprogs.make
