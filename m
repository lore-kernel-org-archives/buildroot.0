From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 17:42:15 +0200
Subject: [Buildroot] [PATCH 0/6] host-python2 hard dependency
In-Reply-To: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140405174215.20b771eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed,  5 Mar 2014 23:04:39 +0100, Samuel Martin wrote:

> Samuel Martin (6):
>   python: rework python symlinks installation
>   python3: rework python symlinks installation
>   pkg-python: support host-python dependency different from the python
>     in the target
>   scons: force host-python dependency to be python2
>   python-m2crypto: requires host-python2
>   crda: override python interperter

I've applied your patch series, after making a number of changes,
according to Yann's review. The main change was the renaming of the
variable from <pkg>_FORCE_HOST_PYTHON to <pkg>_NEEDS_HOST_PYTHON.
You'll find all the details in the commit logs of the different commits.

I've also added a separate commit to fix an unrelated issue I stumbled
upon while testing your patch series.

With your patch series, I've been able to test the following
configurations:

 * Build a system with python2 as the target interpreter, with all
   python external modules enabled, the crda package (which needs the
   host python2 interpreter) as well as gpsd and exfat (which need
   host-scons, which in turns needs the host python2 interpreter)

 * Build a system with python3 as the target interpreter, with all
   python external modules enabled, the crda package (which needs the
   host python2 interpreter) as well as gpsd and exfat (which need
   host-scons, which in turns needs the host python2 interpreter)

Both builds went fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
