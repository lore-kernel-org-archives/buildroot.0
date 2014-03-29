From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 23:52:37 +0100
Subject: [Buildroot] http:// and git:// repositories not in sync
Message-ID: <20140329225237.GN3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

While looking at the dtv-scan-tables repository, we noticed that we did
get a different set of commits with the http:// or the git:// schemes to
access the repository:

    $ git clone git://linuxtv.org/dtv-scan-tables.git dtv.git
    [...]
    $ cd dtv.git
    $ git log --oneline |head
    cfc2975 Updated scan table for au-Sydney_North_Shore
    29b0b57 UK Update for COM 7, BBC B, and Local Muxes
    177b522 DTV scantables for FI
    7809ca1 Update es-Alfabia
    69a1ac5 Initial tuning data for ca-AB-Calgary
    1850cf8 Initial scan table for au-Melbourne-Selby
    52a7b0a update scan file for ro-DigiTV
    75f3b39 Initial Tuning Data for Uganda
    7d31336 Never include ~ files
    1d6f9b5 Initial scan files for PT

    $ git clone http://linuxtv.org/git/dtv-scan-tables.git dtv.http
    [...]
    $ cd dtv.http
    $ git log --oneline |head
    7809ca1 Update es-Alfabia
    69a1ac5 Initial tuning data for ca-AB-Calgary
    1850cf8 Initial scan table for au-Melbourne-Selby
    52a7b0a update scan file for ro-DigiTV
    75f3b39 Initial Tuning Data for Uganda
    7d31336 Never include ~ files
    1d6f9b5 Initial scan files for PT
    f61d5ec Merge pull request #6 from silid/master
    6213a2f Table /usr/share/dvb/dvb-t/cz-All outdated
    832df4f Removal of excess white space

As you can see, the http:// scheme gets us three fewer changesets than
the git:// scheme.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
