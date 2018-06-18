From: xu min <xuminready@gmail.com>
Date: Mon, 18 Jun 2018 00:13:51 -0700
Subject: [Buildroot] [PATCH v2 2/3] shadowsocks-libev: Adding the
 pthreads dependency
In-Reply-To: <20180617154341.29dba5b2@windsurf>
References: <20180611181823.2722-1-xuminready@gmail.com>
 <20180611181823.2722-2-xuminready@gmail.com>
 <20180617154341.29dba5b2@windsurf>
Message-ID: <CAMpS7mStwO10U=EEpf_G0VWO_6xEVEk3n0N0ZD7jJdSD2GBqig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your help. I'll keep learning and improving my commit.

MinXu

On Sun, Jun 17, 2018 at 6:43 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, 11 Jun 2018 11:18:22 -0700, Min Xu wrote:
> > Signed-off-by: Min Xu <xuminready@gmail.com>
>
> Here again, the commit log was empty, which is not good. It should have
> explained *why* you did this change.
>
> > ---
> >  package/shadowsocks-libev/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/shadowsocks-libev/Config.in
> b/package/shadowsocks-libev/Config.in
> > index d02e5a9..82c88e9 100644
> > --- a/package/shadowsocks-libev/Config.in
> > +++ b/package/shadowsocks-libev/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_SHADOWSOCKS_LIBEV
> >       bool "shadowsocks-libev"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # require pthreads
> >       depends on BR2_USE_MMU # fork()
> >       select BR2_PACKAGE_C_ARES
> >       select BR2_PACKAGE_LIBEV
>
> When you add a dependency on a toolchain option, you need to add the
> corresponding Config.in comment:
>
> +comment "shadowsocks-libev needs a toolchain w/ threads"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> I've added that, extended the commit log and applied.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 

*Best Regards*

*XuMin's Ready?*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180618/9a8041f3/attachment.html>
