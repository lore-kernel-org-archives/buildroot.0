From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 11 Jul 2018 09:11:55 -0700
Subject: [Buildroot] Guide for installing Chromium using patch sets
In-Reply-To: <CAD0+TpAfAu0XKeEzwhACV8j0D-27fodEhFjgg9JcgePs-7Nxgg@mail.gmail.com>
References: <CAD0+TpAc6473JO3H24CLwxUwc0WXZ5n8es1xJctnyhUEESrwWg@mail.gmail.com>
 <CAMWSM7iJjfVUY_Yw13u+gg73eShK5pwh5+1yawWRV+Z-qAhGTw@mail.gmail.com>
 <CAD0+TpAfAu0XKeEzwhACV8j0D-27fodEhFjgg9JcgePs-7Nxgg@mail.gmail.com>
Message-ID: <CAMWSM7hLA6p+MqQW0MVrf8DZ6A5Ap8UqO_xPo8hW5QMvjirrDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fame,

On Wed, Jul 11, 2018 at 8:37 AM Fame Castle <famecastle@gmail.com> wrote:
>
> Hello Joseph,
>
> I checked out your chromium-v6 branch from your repo and applied my buildroot configurations to it. It compiled fine without chromium being selected. But when I selected chromium (indeed, it was the use_sysroot problem that previously made my builds fail, which is now fixed in your repo), I encountered a new problem:
>
> > >>> chromium 67.0.3396.79 Configuring
> > ...
> > [412/412] LINK gn
> > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned non-zero exit code.
> >     pkgresult = exec_script(pkg_config_script, args, "value")
> >                  ^----------
> > Current dir: /home/buildroot/output/build/chromium-67.0.3396.79/out/Release/
> > Command: /home/buildroot/output/host/bin/python2 -- /home/buildroot/output/build/chromium-67.0.3396.79/build/config/linux/pkg-config.py nss -v -lssl3
> > Returned 1.
> > stderr:
> >
> > Package nss was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `nss.pc'
> > to the PKG_CONFIG_PATH environment variable
> > No package 'nss' found
> > Could not run pkg-config.
> >
> > See //third_party/nss/BUILD.gn:15:3: whence it was called.
> >   pkg_config("system_nss_no_ssl_config") {
> >   ^---------------------------------------
> > See //crypto/BUILD.gn:221:25: which caused the file to be included.
> >     public_configs += [ "//third_party/nss:system_nss_no_ssl_config" ]
> >                         ^-------------------------------------------
>
> The compilation breaks at the same point as it previously did. But now the problem with cups-config is fixed and this error appeared.

I removed nss from my host system and issued a 'make chromium-dirclean
all', and I was unable to reproduce this issue. Could you try a clean
build, and see if the issue persists?

Also, could you upload your config to pastebin or github, and link to it?

Thanks,
Joseph
