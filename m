From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Apr 2018 12:42:13 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <1ffe206e-4b1e-c233-a511-ba4c3a8cb5f0@armadeus.com>
References: <20180415120230.GA21958@scaer>
 <5ad41059af3a7_5cd73ffcbd32b2bc9895d@ultri4.mail>
 <20180416160124.GC2290@scaer> <20180416205614.GE2290@scaer>
 <1ffe206e-4b1e-c233-a511-ba4c3a8cb5f0@armadeus.com>
Message-ID: <20180417104213.GB8142@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2018-04-17 12:05 +0200, Julien Boibessot spake thusly:
> On 16/04/2018 22:56, Yann E. MORIN wrote:
> 
>  Ricardo, All,To all autobuilder runners: could you create a tarball of the failed
>  dtv-scan-tables git tree on yuour autobuilders, from each of your
>  instances, please?
> 
> I'm not sure to understand what you reallly need, could you please clarify ?

You are running an autobuilder. That autobuilder will run 'n' builds in
parallel, each in a directory instance-0, instance-1... In each of those
instances, there is a dl/ sub-dir.

In that dl/ sub-dir, there isyet another sub-dir per-package, of which
dtv-scan-tables/

Buildroot downloads dtv-scan-tables as a git clone, stored in the git/
directory of the aforementioned dtv-scan-tables/ directory.

I would need that you provide all thos git trees from all the instances
your autobuilder runs, i.e. something like:

    tar cJf dtv-scan-tables-git.tar.xz instance-*/dl/dtv-scan-tables/git/

And then send me dtv-scan-tables-git.tar.xz

Please! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
