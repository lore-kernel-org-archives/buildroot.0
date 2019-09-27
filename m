From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 27 Sep 2019 07:48:20 -0700
Subject: [Buildroot] Failure upgrading 8/2017 to 8/2019
In-Reply-To: <CAJJ6jxu33wpoDmFU+F-ny-Ak8dMT3o9Z199yskk_dN5+67CdWw@mail.gmail.com>
References: <CAJJ6jxvMGKJoO=L6TSP9dc2Wyvg62GyKobn6nwemvUK-tC5RGw@mail.gmail.com>
 <CAJJ6jxu33wpoDmFU+F-ny-Ak8dMT3o9Z199yskk_dN5+67CdWw@mail.gmail.com>
Message-ID: <CAJJ6jxs4tmSLot79ujT9E_FmaCdNmw1ypPaseDqOXXV99p2Ujw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 25, 2019 at 10:33 AM Steve Calfee <stevecalfee@gmail.com> wrote:
>
> I am also getting lots of python build errors?
>
> PYTHONPATH="/home/calfee/nobu/br/dockstar/ds_9_2019/output/target/usr/lib/python2.7/sysconfigdata/"
> cd /home/calfee/nobu/br/dockstar/ds_9_2019/output/target &&
> /home/calfee/nobu/br/dockstar/ds_9_2019/output/host/bin/python2.7
> /home/calfee/nobu/br/dockstar/ds_9_2019/support/scripts/pycompile.py
> usr/lib/python2.7
> Compiling usr/lib/python2.7/site-packages/tornado/auth.py ...
>   File "usr/lib/python2.7/site-packages/tornado/auth.py", line 90
>     callback_uri: str = None,
>                 ^
> SyntaxError: invalid syntax
>
> Compiling usr/lib/python2.7/site-packages/tornado/autoreload.py ...
>   File "usr/lib/python2.7/site-packages/tornado/autoreload.py", line 118
>     def start(check_time: int = 500) -> None:
>                         ^
> SyntaxError: invalid syntax
<snip>

I reverted back to the python-tornado package that used to work and it
still does. When I get other things working I will try to find where
the breakage started. The python-tornado package has been bumped about
6 times since the last known building version. I think buildroot is
now building a host python2, but the schizophrenic python split
between python2 and python3 causes lots of confusion.

As another note, it seems to take a very long time to build the host
packages - can it be done externally (like building a toolchain), so
"make clean; make" doesn't take so long to build?

Steve
