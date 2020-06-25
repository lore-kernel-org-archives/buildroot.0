From: =?UTF-8?Q?St=C3=A9phane_Veyret?= <sveyret@gmail.com>
Date: Thu, 25 Jun 2020 18:38:02 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: do not rename startup
 files
In-Reply-To: <20200625182319.4cec8d94@gmx.net>
References: <20200624115009.15561-1-sveyret@gmail.com>
 <20200624165405.GA20645@scaer> <20200625182319.4cec8d94@gmx.net>
Message-ID: <CAFs+hh6EffMsZFsMQAXF-Lk-cRmbjtHqii2zDogRrJAMUjw9iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le jeu. 25 juin 2020 ? 18:23, Peter Seiderer <ps.report@gmx.net> a ?crit :
> > I think we should instead force the name of the startup files in the
> > config.txt (in package/rpi-firmware/config.txt):
> >
> >     start_file=start.elf
> >     fixup_file=fixup.dat
>
> Or one step further, copy the start/fixup file verbatim and only change the
> start_file/fixup_file entry in config.txt (with the advantage to make it
> transparent which files are installed/in-use)...

If the file name is already the appropriate one (this is the first
version of my patch), using start_file and fixup_file is useless. And
I don't feel it is a good idea to set start_file and fixup_file if the
files already have expected names, because using these options is
discouraged: https://www.raspberrypi.org/documentation/configuration/config-txt/boot.md.
