From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jan 2018 12:17:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-05
In-Reply-To: <20180106070039.EE62C207B4@mail.free-electrons.com>
References: <20180106070039.EE62C207B4@mail.free-electrons.com>
Message-ID: <20180106111711.GA9774@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-01-06 08:00 +0100, Thomas Petazzoni spake thusly:
> Build statistics for 2018-01-05
> Results for branch '2017.11.x'
> arm | libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/b1a0f392345fa34d6187e1ee297c8c874a9a148c |     

This one is weird (configure was OK):

    >>> libiscsi 1.18.0 BuildingD[23m
    PATH="/home/peko/autobuild/instance-2/output/host/bin:/home/peko/autobuild/instance-2/output/host/sbin:/home/peko/host/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/make -j6  -C /home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0/
    make[1]: Entering directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0'
    /usr/bin/make  all-recursive
    make[2]: Entering directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0'
    Making all in lib
    make[3]: Entering directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0/lib'
    make[3]: *** No rule to make target `all'.  Stop.
    make[3]: Leaving directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0/lib'
    make[2]: *** [all-recursive] Error 1
    make[2]: Leaving directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0'
    make[1]: *** [all] Error 2
    make[1]: Leaving directory `/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0'
    make: *** [/home/peko/autobuild/instance-2/output/build/libiscsi-1.18.0/.stamp_built] Error 2
    make: Leaving directory `/home/peko/autobuild/instance-2/buildroot'

It looks like there is no Makefile in that directory. Yes, so, what... :-/
I can't reproduce, neither on my machine, nor on the affected autobuilder.

Let's say this is a butterfly-effect (xkcd:378)...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
