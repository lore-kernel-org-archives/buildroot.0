From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 7 Jun 2019 23:52:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-06-05 (meson rpath problem)
In-Reply-To: <20190606211454.GA5153@x230>
References: <5cf8ac0a.1c69fb81.34b7d.30a7SMTPIN_ADDED_MISSING@mx.google.com>
 <20190606211454.GA5153@x230>
Message-ID: <CAPi7W81wCUmD9picZpprpRDD4Fbv7QUpcxZkCUc38AvQux2U5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr,

Le jeu. 6 juin 2019 ? 23:14, Petr Vorel <petr.vorel@gmail.com> a ?crit :
>
> Hi,
>
> > This is the list of Buildroot build failures that occured on
> > 2019-06-05, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
>
> > Results for the 'master' branch
> > ===============================
>
> > Build failures related to your packages:
>
> >         i586 |              iputils-s20190515 | http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981
>
> Errors are like
> visibility.c:(.text+0x1a): undefined reference to `gpg_strerror'
> look like rpath issue similar to [1]. But I have no clue how to fix it in meson,
> which iputils uses. There are requirements for it in upstream [2], lack of it
> leaded us [3] (and openembedded [4]) to workaround it. But that's obviously not
> enough for i586 build. Any tip / hint to fix it?
This is a "common" static build issue due to the fact that gcrypt does
not provide a pkgconfig file. To find gpg-error, a call to
cc.find_library must be added. I sent a patch a few minutes ago.
>
>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/patch/763789/
> [2] https://github.com/mesonbuild/meson/issues/2567
> [3] https://git.busybox.net/buildroot/tree/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
> [4] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/meson/meson/disable-rpath-handling.patch?h=master
Best Regards,

Fabrice
