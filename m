From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:19:46 +0200
Subject: [Buildroot] Suggestion to "support/scripts/apply-patches.sh: do
 not apply patches with renames"
In-Reply-To: <a6e13bf6-0cad-41d7-396e-0b9a31d225fd@gmail.com>
References: <CAALxPJ0qprnhxWtHGg7oeY=Ws4+w3Wt-_hdM1WvbL6B42jQO5g@mail.gmail.com>
 <87fsyopkcr.fsf@dell.be.48ers.dk> <20210515094010.GA2506@scaer>
 <a6e13bf6-0cad-41d7-396e-0b9a31d225fd@gmail.com>
Message-ID: <20210515111946.GB2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-15 12:57 +0200, Romain Naour spake thusly:
> Le 15/05/2021 ? 11:40, Yann E. MORIN a ?crit?:
> > On the Ubuntu side (as another data point), the odest LTS is Trusty,
> > 14.04, and it has patch 2.7.1.
> Based on the host gcc requirement on gcc 4.9 (released the 22 April 2014), we
> already don't support such old distro. Ubuntu LTS Trusty provide gcc 4.8.

Ah, I don't thinks so. We still only require gcc >= 4.8:

  - the manual still references gcc 4.8, even the nightly snapshots:
        http://nightly.buildroot.org/#requirement

        2.1. Mandatory packages
        ...
        * gcc (version 4.8 or any later)
        * g++ (version 4.8 or any later) 

  - support/dependencies/dependencies.sh still only checks for gcc >=
    4.8:
        if [ $COMPILER_MAJOR -lt 4 -o $COMPILER_MAJOR -eq 4 -a $COMPILER_MINOR -lt 8 ] ; then

The last time (that I remember of) when we bumped our host gcc
requirement, was with those commits, dated October 2020:

  * 5ee815ab6a docs/manual: bump our gcc/g++ requirements to 4.8
  * 55fc80260b packages: host gcc >= 4.8 is now guaranteed

I could not find a reference to requiring host gcc >= 4.9 in the commit
logs...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
