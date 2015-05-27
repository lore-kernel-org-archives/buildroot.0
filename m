From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 27 May 2015 17:41:41 +0200
Subject: [Buildroot] scons and check
In-Reply-To: <5565DCA4.5040002@green-communications.fr>
References: <5565DCA4.5040002@green-communications.fr>
Message-ID: <CAHXCMMJEh45R-78biuCVpGF2QxLD5FYEEuw=tmkndzKuCJNmew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sylvain,

On Wed, May 27, 2015 at 5:03 PM, Sylvain Raybaud
<sylvain.raybaud@green-communications.fr> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi
>
> I'm trying to create a package for Galera, a library needed by mariadb
> galera cluster. It builds with scons. Galera depends on check so I
> created a package for this library too, which seems to build and
> install correctly.
>
> A few packages in buildroot already use scons (exfat, exfat-utils,
> benejson, gpsd). Their build commands look like this:
>
> FOO_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
> FOO_SCONS_OPTS = "prefix=/usr"
>
> define FOO_BUILD_CMDS
>         cd $(@D) && \
>          $(FOO_SCONS_ENV) \
>          CROSS=$(TARGET_CROSS) \
>          $(SCONS) $(FOO_SCONS_OPTS)
> endef
>
> So I wrote my .mk file the same way. However scons does not seem to
> find the Check library. Building galera fails with:
>
> Checking for C header file check.h... no
> Error: check header file not found or not usable
>
> and corresponding config.log shows a "check.h: file not found" error.

According to [1], you need to package check [2] in buildroot as well

>
> Now the disturbing thing is that it only happens when I build on a
> system on which check is not installed system-wise. If the build host
> has check installed, galera builds. Does this mean that scons uses
> host haeders instead of those provided by buildroot packages? Any idea
> how to make it behave properly?

It certainly means that galera will depend on host-check; I let you
check about the dependency on (target-) check.

[1] https://github.com/codership/galera/blob/3.x/README
[2] http://check.sourceforge.net/

Regards,

-- 
Samuel
