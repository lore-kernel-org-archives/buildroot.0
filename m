From: =?UTF-8?Q?St=C3=A9phane_Veyret?= <sveyret@gmail.com>
Date: Thu, 25 Jun 2020 19:30:25 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: do not rename startup
 files
In-Reply-To: <20200625192003.59506a9c@gmx.net>
References: <20200624115009.15561-1-sveyret@gmail.com>
 <20200624165405.GA20645@scaer> <20200625182319.4cec8d94@gmx.net>
 <CAFs+hh6EffMsZFsMQAXF-Lk-cRmbjtHqii2zDogRrJAMUjw9iw@mail.gmail.com>
 <20200625192003.59506a9c@gmx.net>
Message-ID: <CAFs+hh6XDH80-Sk9DG95ez7vEF4XJR=DrqAgjzZK7xcm42SrzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Le jeu. 25 juin 2020 ? 18:23, Peter Seiderer <ps.report@gmx.net> a ?crit :
> > > > I think we should instead force the name of the startup files in the
> > > > config.txt (in package/rpi-firmware/config.txt):
> > > >
> > > >     start_file=start.elf
> > > >     fixup_file=fixup.dat
> > >
> > > Or one step further, copy the start/fixup file verbatim and only change the
> > > start_file/fixup_file entry in config.txt (with the advantage to make it
> > > transparent which files are installed/in-use)...
> >
> > If the file name is already the appropriate one (this is the first
> > version of my patch), using start_file and fixup_file is useless. And
> > I don't feel it is a good idea to set start_file and fixup_file if the
> > files already have expected names, because using these options is
> > discouraged: https://www.raspberrypi.org/documentation/configuration/config-txt/boot.md.
>
> The options are not discouraged, but 'advanced options' and should be handled with care ;-)
>
> The advantage of the explicit start_file/fixup_file entries is that it is clear/determined
> which files are used (instead of relaying on the RPi 'magic' depending on the combination
> of other options)....

OK, I understand. Yann, do you agree? Shall I create a v3 patch?

-- 
Bien cordialement, / Plej kore,

St?phane Veyret
