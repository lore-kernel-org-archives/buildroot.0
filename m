From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 8 Mar 2020 00:23:05 -0300
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
In-Reply-To: <CAJ4jsafO8WJT-v9v2kY+QYaDDg+1By_xDMtmLzm_-+DEReORDw@mail.gmail.com>
References: <20191208145140.33E3E8899E@busybox.osuosl.org>
 <CAJ4jsacmmUF8eKM9Xs+5vVseg8VrHw-K1APU-O=6DGdyvDJvTg@mail.gmail.com>
 <20200210093339.1782bd4d@windsurf>
 <CAJ4jsafO8WJT-v9v2kY+QYaDDg+1By_xDMtmLzm_-+DEReORDw@mail.gmail.com>
Message-ID: <CAJ4jsads0fXM0+CG+JM2W6hM4=rCpxqVeNVZHGmWm+De837vXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 10:29 AM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 5:33 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Carlos,
> >
> > On Sun, 9 Feb 2020 21:00:31 -0300
> > Carlos Santos <unixmania@gmail.com> wrote:
> >
> > > > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > >
> > > Argh, the mozjs (spidermonkey) dependency increases the size of the
> > > target system by 45 MiB!
> >
> > Yes, the mozjs dependency is unfortunate, and trust me, we would very
> > much have liked polkit to use a different JS engine, or no JS at all.
> > We have been postponing this polkit bump for years due to this. But
> > this is upstream polkit's decision, and at some point, we have no
> > choice but to follow what they did.
> >
> > If you look at the polkit archive, many years ago there was a patch
> > series posted to use the ducktape JS engine instead of mozjs. It would
> > be very nice to revive this work and hopefully bring it upstream.
> > Indeed, ducktape is 2 orders of magnitude smaller than mozjs I believe.
> >
> > > $ file build/buildroot-fs/ext2/target/usr/{bin/js60,lib/libmozjs-60.so}
> > > build/buildroot-fs/ext2/target/usr/bin/js60:           ELF 64-bit LSB
> > > executable, x86-64, version 1 (GNU/Linux), dynamically linked,
> > > interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 4.14.0,
> > > BuildID[sha1]=93295e8e66ae075577bc76110d7a81fc3f9b6359, stripped
> > > build/buildroot-fs/ext2/target/usr/lib/libmozjs-60.so: ELF 64-bit LSB
> > > shared object, x86-64, version 1 (GNU/Linux), dynamically linked,
> > > BuildID[sha1]=2cda65c78b09727e5ee4ac481f8847ca07953cc9, stripped
> > >
> > > $ du -hc build/buildroot-fs/ext2/target/usr/{bin/js60,lib/libmozjs-60.so}
> > > 23M    build/buildroot-fs/ext2/target/usr/bin/js60
> >
> > Is this binary dynamically linked against libmozjs, or statically
> > linked against it? The fact that it has the same size as libmozjs makes
> > me think it might be statically linked against it.
> >
> > > 23M    build/buildroot-fs/ext2/target/usr/lib/libmozjs-60.so
> >
> > Best regards,
> >
> > Thomas
>
> I'd just add --disable-js-shell to SPIDERMONKEY_CONF_OPTS, since the
> JS shell is not required.

Done: https://patchwork.ozlabs.org/patch/1250972/

-- 
Carlos Santos <unixmania@gmail.com>
