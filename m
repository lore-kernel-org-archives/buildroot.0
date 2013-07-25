From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 25 Jul 2013 10:25:38 +0200
Subject: [Buildroot] Strange error when set root password in buildroot
In-Reply-To: <20130725024203.GC391@zuhnb712.ap.bm.net>
References: <20130725024203.GC391@zuhnb712.ap.bm.net>
Message-ID: <CAAXf6LU==DtcLaPEiXopt6+32KH=0c4Ws7S7hjw=A183aNjP3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jul 25, 2013 at 4:42 AM, Woody Wu <narkewoody@gmail.com> wrote:
> Hi,
>
> Today I just set the root password in buildroot. Then I got strange
> error when building:
>
> /usr/bin/sed -i -e 's,^root:[^:]*:,root:usage: mkpasswd [args] [user]   where arguments are:     -l #      (length of password, default = 9)     -d #      (min # of digits, default = 2)     -c #      (min # of lowercase chars, default = 2)     -C #      (min # of uppercase chars, default = 2)     -s #      (min # of special chars, default = 1)     -v        (verbose, show passwd interaction)     -p prog   (program to set password, default = passwd):,' /home/woody/src/buildroot-2013.05/output/target/etc/shadow
> /usr/bin/sed: -e expression #1, char 109: unknown option to `s'
> make: *** [target-root-passwd] Error 1
>
> What's the problem? Thanks.

It seems that the mkpasswd on your system is not the same type as
buildroot expects.
Buildroot runs mkpasswd with '-m <method>', which does not seem to be
present on your mkpasswd.

What Linux system is this?
What is the output of:
which mkpasswd
and
mkpasswd -V

(I think the latter will not work in your case anyway, in my case it's:

$ mkpasswd -V
mkpasswd 5.0.19

Copyright (C) 2001-2008 Marco d'Itri
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



Thanks,
Thomas
