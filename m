From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 15:15:31 +0100
Subject: [Buildroot] [PATCH v5] package/i2c-tools: bump to version 4.0
In-Reply-To: <CA+_SqVYuSiM3_ZixwaMaowY1yaa525+Fj_Hpqup_Qk58ZpMMkQ@mail.gmail.com>
References: <1513257825-9289-1-git-send-email-angelo@amarulasolutions.com>
 <20171215092151.4a43e74c@windsurf.png.is.keysight.com>
 <CA+_SqVYuSiM3_ZixwaMaowY1yaa525+Fj_Hpqup_Qk58ZpMMkQ@mail.gmail.com>
Message-ID: <20171215151531.1b5a0015@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Dec 2017 10:02:27 +0100, Angelo Compagnucci wrote:

> > After 5 or 6 rebuilds of the i2c-tools package this happened.
> >
> > Without your patch,  
> 
> You mean before bumping to version 4?

Yes, without your patch, i.e with the current version of i2c-tools in
Buildroot.

> > for i in $(seq 1 100) ; do echo "=== $i ===" ; rm -rf output/build/i2c-tools* ; make i2c-tools || break ; done
> >
> > With your patch applied, I've never been able to reach more than 5 or 6
> > iterations of the loop.
> >
> > Could you rework this, and test 100 iterations of building the i2c-tools package ?  
> 
> I built it now 3 times with my 8core machine with various -j settings,
> unfortunately I cannot reproduce:
> 
> === 100 ===
> umask 0022 && make -C /home/angelo/DEV/BUILDROOT/buildroot
> O=/home/angelo/DEV/BUILDROOT/br_qemu_arm/. i2c-tools

So you built it 3 times, or 3 times my loop of 100 builds ?

> ls build/i2c-tools-4.0/
> CHANGES  COPYING.LGPL  eeprom    include  Makefile  README  tools
> COPYING  eeprog        eepromer  lib      py-smbus  stub    version.h
> 
> Could you give me more details?

Well, I don't have more details to provide: I just build i2c-tools, and
it fails randomly.

Perhaps I should apply and see what the autobuilders have to say, i.e
if they agree with you (it builds) or with me (it fails randomly).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
