From: Fame Castle <famecastle@gmail.com>
Date: Wed, 11 Jul 2018 18:24:44 +0200
Subject: [Buildroot] Fwd:  Guide for installing Chromium using patch sets
In-Reply-To: <CAD0+TpAX_eSnF70YLRq6Kp44iySE4O18gxSu23bcjOHjDsSQWA@mail.gmail.com>
References: <CAD0+TpAc6473JO3H24CLwxUwc0WXZ5n8es1xJctnyhUEESrwWg@mail.gmail.com>
 <CAMWSM7iJjfVUY_Yw13u+gg73eShK5pwh5+1yawWRV+Z-qAhGTw@mail.gmail.com>
 <CAD0+TpAfAu0XKeEzwhACV8j0D-27fodEhFjgg9JcgePs-7Nxgg@mail.gmail.com>
 <CAMWSM7hLA6p+MqQW0MVrf8DZ6A5Ap8UqO_xPo8hW5QMvjirrDQ@mail.gmail.com>
 <CAD0+TpAX_eSnF70YLRq6Kp44iySE4O18gxSu23bcjOHjDsSQWA@mail.gmail.com>
Message-ID: <CAD0+TpC5N2DW8sfs38GAAy5=hbAf6uccHTGMxSt+AjPQmdUqbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ----------
From: Fame Castle <famecastle@gmail.com>
Date: 2018-07-11 18:22 GMT+02:00
Subject: Re: [Buildroot] Guide for installing Chromium using patch sets
To: Joseph Kogut <joseph.kogut@gmail.com>


I did a 'make chromium-dirclean all' and the problem reappeared. You can
find my buildroot config file at https://pastebin.com/zjZuDgB3 . The libnss
package is selected in buildroot. "chromium 67.0.3396.79" gets downloaded
successfully, all patches are applied correctly and the configuration fails
with the same error.

If you have no idea what the problem could be,I will do a complete
recompile. But for now, I just wait, since a full recompile takes a couple
of hours for me.

2018-07-11 18:11 GMT+02:00 Joseph Kogut <joseph.kogut@gmail.com>:

> Hi Fame,
>
> On Wed, Jul 11, 2018 at 8:37 AM Fame Castle <famecastle@gmail.com> wrote:
> >
> > Hello Joseph,
> >
> > I checked out your chromium-v6 branch from your repo and applied my
> buildroot configurations to it. It compiled fine without chromium being
> selected. But when I selected chromium (indeed, it was the use_sysroot
> problem that previously made my builds fail, which is now fixed in your
> repo), I encountered a new problem:
> >
> > > >>> chromium 67.0.3396.79 Configuring
> > > ...
> > > [412/412] LINK gn
> > > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> non-zero exit code.
> > >     pkgresult = exec_script(pkg_config_script, args, "value")
> > >                  ^----------
> > > Current dir: /home/buildroot/output/build/c
> hromium-67.0.3396.79/out/Release/
> > > Command: /home/buildroot/output/host/bin/python2 --
> /home/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py
> nss -v -lssl3
> > > Returned 1.
> > > stderr:
> > >
> > > Package nss was not found in the pkg-config search path.
> > > Perhaps you should add the directory containing `nss.pc'
> > > to the PKG_CONFIG_PATH environment variable
> > > No package 'nss' found
> > > Could not run pkg-config.
> > >
> > > See //third_party/nss/BUILD.gn:15:3: whence it was called.
> > >   pkg_config("system_nss_no_ssl_config") {
> > >   ^---------------------------------------
> > > See //crypto/BUILD.gn:221:25: which caused the file to be included.
> > >     public_configs += [ "//third_party/nss:system_nss_no_ssl_config" ]
> > >                         ^-------------------------------------------
> >
> > The compilation breaks at the same point as it previously did. But now
> the problem with cups-config is fixed and this error appeared.
>
> I removed nss from my host system and issued a 'make chromium-dirclean
> all', and I was unable to reproduce this issue. Could you try a clean
> build, and see if the issue persists?
>
> Also, could you upload your config to pastebin or github, and link to it?
>
> Thanks,
> Joseph
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180711/74238c03/attachment.html>
