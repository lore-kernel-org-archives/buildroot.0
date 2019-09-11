From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 09:44:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <CANQCQpaFSpB6vVdboxF8_wCUgrtTpQ5LRyJ-rwKtWob3Mhe3Rg@mail.gmail.com>
References: <20190910023753.51911-1-matthew.weber@rockwellcollins.com>
 <20190910023753.51911-2-matthew.weber@rockwellcollins.com>
 <20190910095734.2075f70a@windsurf>
 <CANQCQpaFSpB6vVdboxF8_wCUgrtTpQ5LRyJ-rwKtWob3Mhe3Rg@mail.gmail.com>
Message-ID: <20190911094419.5c1c1d7c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Sep 2019 12:55:34 -0500
Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

> >>> rng-tools 6.7 Configuring
> >>> rng-tools 6.7 Autoreconfiguring  
> configure.ac:52: installing './compile'
> configure.ac:23: installing './config.guess'
> configure.ac:23: installing './config.sub'
> configure.ac:24: installing './install-sh'
> configure.ac:24: installing './missing'
> Makefile.am: installing './INSTALL'
> Makefile.am: error: required file './README' not found

This will be fixed by adjusting the AM_INIT_AUTOMAKE call in
configure.ac to pass the "foreign" argument. See
https://autotools.io/automake/options.html. This can easily be patched,
and if it's the only issue, will allow to use <pkg>_AUTORECONF = YES.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
