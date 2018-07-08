From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 14:38:11 +0200
Subject: [Buildroot] [PATCH 21/50 v2] package/busybox: invert dependency
 with nmap
In-Reply-To: <62372b6e-9150-55e0-18df-353e00731d75@mind.be>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <fba5b7de12815934cfa42099d998d5bbdd6ddb80.1531043163.git.yann.morin.1998@free.fr>
 <62372b6e-9150-55e0-18df-353e00731d75@mind.be>
Message-ID: <20180708123811.GA7163@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-07-08 13:12 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-18 11:45, Yann E. MORIN wrote:
> > We only need that dependency whan nmap's ncat is enabled.
> > 
> > For consistency, we add a dependency on nmap, not a suboption of it,
> > to have a dependency list in busybox that is only about packages, and
> > directly associates the upper-case package variable to the lower-case
> > package name, e.g. NMAP <-> nmap.
> 
>  I have extended this commit message a little bit to make it explicit that we
> get a spurious dependency, but that that's a small price to pay.

You added:

    Thus, if BR2_PACKAGE_NMAP_NCAT is selected, we have a redundant
    dependency. But that doesn't hurt and it really simplifies things.

But that's is the opposite: the dependency *is* usefull when nmap's ncat
is enabled. So did you meant to write instead:

    Thus, if BR2_PACKAGE_NMAP_NCAT is disabled, we have a useless
    dependency. [...]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
