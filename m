From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 22:23:54 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-09
In-Reply-To: <20160811200026.GA5812@free.fr>
References: <20160810063029.6F291102D04@stock.ovh.net>
 <20160810161455.142a6a19@free-electrons.com>
 <74004942B5DA03468B2B76399A14BF2E8CAA963D@XSJ-PSEXMBX01.xlnx.xilinx.com>
 <20160811200026.GA5812@free.fr>
Message-ID: <20160811222354.754b418d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Aug 2016 22:00:26 +0200, Yann E. MORIN wrote:

> If Xen can be told what python to use, then that's easy (e.g.:
> --with-python=python2 or whatever else...)

Please try to find a solution like this: environment variable,
configuration option, etc. If it doesn't exist, please add it.

> However, if you can't tell Xen what python to use, then this is a bit
> more involved.
> 
> See how it was solved for example for qt5webkit:
> 
>     package/qt5webkit: needs host-python
> 
>     The Qt5Webkit build system hard-codes calls to 'python', but only really
>     supports python2.
> 
>     We fix that similarly as we did in nodejs, by adding a python->python2
>     symlink early in the PATH when configuring/building Qt5Webkit, and
>     adding host-python in the dependency list.
> 
>     [--SNIP--]
> 
> This is commit ac16793eaaabfced0312420759e3a66cdaa1ea8e and you can get
> some inspiration from it.

I really *hate* this solution, and I will actively discourage anyone to
use it.

> Thomas, we now have a few packages that need this hack. Should we try to
> move those hacks into the pkg infra (obviously not for 2016.08)?

As far as I know there are only two such packages today, so clearly not
enough to move those hacks to the pkg infra.

Plus moving this to the pkg infra is making the usage of this hack
easier, which is exactly the opposite of what I want. The more painful
it can be to use this hack, the better, as it will encourage people to
find real solutions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
