From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 8 Dec 2019 11:04:16 -0800
Subject: [Buildroot] [PATCH v6 1/6] package/polkit: bump to version 0.116
In-Reply-To: <20191208160213.030635f6@windsurf.home>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191208160213.030635f6@windsurf.home>
Message-ID: <CAFSsvmqCnXXkjMtJiPOpHx0E8Xv4fHcOuNw3qSSn52i9F-6yPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Sun, Dec 8, 2019 at 7:02 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri,  6 Dec 2019 15:46:44 -0800
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Other changes:
> >   - Add spidermonkey as a dependency.
> >   - Add 0001-make-netgroup-support-optional.patch to allow building on musl.
> >   - Add a runtime dependency on dbus.
> >   - Add --disable-libelongind.
> >   - Add --disable-libsystemd-login.
> >   - Update dependencies for systemd pam support.
> >   - Update dependencies for udisks.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> > changes v1 -> v6:
> >   - Add depends on BR2_HOST_GCC_AT_LEAST_4_9 to the following:
> >     - package/polkit/Config.in
> >     - package/systemd/Config.in
> >     - package/udisks/Config.in
>
> To do the same as systemd, I changed the "depends on BR2_PACKAGE_DBUS"
> to a "select BR2_PACKAGE_DBUS", made a few minor tweaks, and applied to
> master. Thanks a lot for taking care of this difficult package!
>
> One direction that would be nice to look at is to enable spidermonkey
> and then polkit on uClibc. Regarding the fenv issue, perhaps we could
> have a boolean that says whether uClibc provides fenv support for the
> current architecture, and then treat this as an architecture dependency
> inside BR2_PACKAGE_SPIDERMONKEY_ARCH_SUPPORTS ? How many architectures
> have sufficient fenv support in uClibc for spidermonkey ?
>
Not many, Yann and I had a conversation about this earlier and it
doesn't seem worth it.

Perhaps instead we could put the same effort into a variable that
checks for uclibc fts support.
That way selinux can be enabled with uclibc:

For reference: https://patchwork.ozlabs.org/patch/787786/
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Adam
