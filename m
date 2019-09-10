From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Sep 2019 12:55:34 -0500
Subject: [Buildroot] [PATCH 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190910095734.2075f70a@windsurf>
References: <20190910023753.51911-1-matthew.weber@rockwellcollins.com>
 <20190910023753.51911-2-matthew.weber@rockwellcollins.com>
 <20190910095734.2075f70a@windsurf>
Message-ID: <CANQCQpaFSpB6vVdboxF8_wCUgrtTpQ5LRyJ-rwKtWob3Mhe3Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Tue, Sep 10, 2019 at 2:57 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon,  9 Sep 2019 21:37:53 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > +# configure is missing but pkg seems to not be compatible with our autoreconf
> > +# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
>
> Then you need host-automake and host-autoconf in the dependencies, and
> potentially host-libtool (if libtool is used).
>
> But how does it fail exactly ? Perhaps it can be fixed instead ?
>

>>> rng-tools 6.7 Configuring
>>> rng-tools 6.7 Autoreconfiguring
configure.ac:52: installing './compile'
configure.ac:23: installing './config.guess'
configure.ac:23: installing './config.sub'
configure.ac:24: installing './install-sh'
configure.ac:24: installing './missing'
Makefile.am: installing './INSTALL'
Makefile.am: error: required file './README' not found
Makefile.am: installing './depcomp'
parallel-tests: installing './test-driver'
autoreconf: /home/foobar/tmp.SL6zsYai7c-buildroot/output/host/bin/automake
failed with exit status: 1
package/pkg-generic.mk:228: recipe for target
'/accts/mlweber1/tmp.SL6zsYai7c-buildroot/output/build/rng-tools-6.7/.stamp_configured'
failed
make[1]: *** [/home/foobar/tmp.SL6zsYai7c-buildroot/output/build/rng-tools-6.7/.stamp_configured]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2
