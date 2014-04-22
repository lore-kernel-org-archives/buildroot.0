From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Apr 2014 19:08:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-21
In-Reply-To: <20140422063008.8B9CA101006@stock.ovh.net>
References: <20140422063008.8B9CA101006@stock.ovh.net>
Message-ID: <20140422170841.GB3601@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-22 08:30 +0200, Thomas Petazzoni spake thusly:
> Build statistics for 2014-04-21
>    powerpc |               postgresql-9.3.3 | NOK | http://autobuild.buildroot.net/results/32fc178cc3875c32e9b722654676fc44eccde8f1/
>       mips |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/a7eb3af3274950af9f81d6591b52d5d79fd1a318/
>    powerpc |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/501d23481210bd6ed34745f42d86ee7a0591f734/
>     x86_64 |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/9ec69f92a48c1adc50bdb3096008243d842c27e6/
>       mips |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/980830e18626a00c74f4a23e01e1f234955cb473/
>     x86_64 |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/04fa1eb0d479fef1754e01a2b03747e49a4604e0/

All due to the same error:
    checking for zic... no
    configure: error:
    When cross-compiling, either use the option --with-system-tzdata to use
    existing time-zone data, or set the environment variable ZIC to a zic
    program to use during the build.

These should be fixed with:
    http://patchwork.ozlabs.org/patch/341386/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
