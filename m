From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 12:05:21 +0200
Subject: [Buildroot] [PATCH 0/20 v2 RFC] Introduce libudev (branch
 yem/libudev)
In-Reply-To: <20140614100107.20b3c3be@free-electrons.com>
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <20140614100107.20b3c3be@free-electrons.com>
Message-ID: <20140614100521.GA3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-14 10:01 +0200, Thomas Petazzoni spake thusly:
> On Sat, 14 Jun 2014 01:02:39 +0200, Yann E. MORIN wrote:
> 
> > Big fat warning: this is only an RFC for now!
> > 
> > This series introduces the possibility to just build and install libudev,
> > without requiring that the /dev management be handled by eudev or systemd.
> > 
> > A lot of packages that have a dependency on udev, in fact only require a
> > libudev, not anudev daemon. That's the case for e.g. libinput, libcec,
> > mesa3d...
> 
> To be honest, I am far from being a udev expert, but I have a question
> about the rationale behind a libudev-only configuration.

It is my understanding that libudev is not used to talk to a udev
daemon, but is used to present a view of sysfs, instead of leaving
all application reinvent their own walking of /sys, and libudev also
provides monitoring of devices:
    http://www.signal11.us/oss/udev/

Now, how libudev and a udev daemon play together, I have no idea. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
