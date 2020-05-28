From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:54:38 +0200
Subject: [Buildroot] make graph-size on Ubuntu 20.04,
 buildroot 2020.05-rc2
In-Reply-To: <CADJjDh8P5ACNk4FA6sQAgpovvfp-2suWtXmV_ZLCXVreAC4v0A@mail.gmail.com>
References: <CADJjDh9gqQzv_owicJduiXkRJqCsgjRP6DjwnLPZK6A4Gd-YOA@mail.gmail.com>
 <20200528224500.595b5ffc@windsurf.home>
 <CADJjDh8P5ACNk4FA6sQAgpovvfp-2suWtXmV_ZLCXVreAC4v0A@mail.gmail.com>
Message-ID: <20200528225438.4ffbf1c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please use Reply-All when replying, to keep the mailing list in Cc,
thanks.

On Thu, 28 May 2020 16:49:11 -0400
Todd Sampson <sampsonats@gmail.com> wrote:

> dfr at cmake:~/m9k2/buildroot$ sudo apt install python3-matplotlib
> [sudo] password for dfr:
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> python3-matplotlib is already the newest version (3.1.2-1ubuntu4).
> 0 upgraded, 0 newly installed, 0 to remove and 84 not upgraded.
> dfr at cmake:~/m9k2/buildroot$ make graph-size
> *You need python-matplotlib to generate the size graph*
> make[1]: *** [Makefile:904: graph-size] Error 1
> make: *** [Makefile:84: _all] Error 2

Then this means that your /usr/bin/python is pointing to
/usr/bin/python2. The script being "make graph-size",
support/scripts/size-stats, simply uses "/usr/bin/env python", which it
assumes is your default interpreter, which should have matplotlib
installed.

Is is the standard Ubuntu 20.04 behavior to have python point to
python2, but no longer provide python-matplotlib. This looks odd. Have
you changed your /usr/bin/python perhaps ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
