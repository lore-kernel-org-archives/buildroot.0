From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 15:10:09 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
In-Reply-To: <CAAXf6LVtbsFWBLooB2tN8OzjuR3VK7=QKLf0LdNHDpHz+zRtmg@mail.gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <20150315143448.72b386dc@free-electrons.com>
 <CAAXf6LVtbsFWBLooB2tN8OzjuR3VK7=QKLf0LdNHDpHz+zRtmg@mail.gmail.com>
Message-ID: <20150315151009.2c61d5a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 15 Mar 2015 14:51:38 +0100, Thomas De Schampheleire wrote:

> To understand better, some questions:
> - you saw this situation once, with Python 2.6, but have been able to
> successfully stop autobuild run with Ctrl-C with Python 2.6 on other
> occasions?

I just tried again, and same behavior. Here are the processes that
remain:

22897 pts/2    S      0:00 timeout 14400 make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-0/dl BR2_JLEVEL=4
22898 pts/2    S      0:15  \_ make O=/ssd1/thomas/autobuild/instance-0/output -C instance-0/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-0/dl BR2_JLEVEL=4
15337 pts/2    S      0:00      \_ /usr/bin/make -j4 -C /ssd1/thomas/autobuild/instance-0/output/build/host-nodejs-0.10.36 PATH=/ssd1/thomas/autobuild/instance-0/output/host/bin:/ssd1/th
[...]
25240 pts/2    S      0:00 timeout 14400 make O=/ssd1/thomas/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-3/dl BR2_JLEVEL=4
25242 pts/2    S      0:14  \_ make O=/ssd1/thomas/autobuild/instance-3/output -C instance-3/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-3/dl BR2_JLEVEL=4
25512 pts/2    S      0:00      \_ /usr/bin/make -j4 -C /ssd1/thomas/autobuild/instance-3/output/build/samba4-4.2.0 DESTDIR=/ssd1/thomas/autobuild/instance-3/output/host/usr/i686-buildro
[...]
 2853 pts/2    S      0:00 timeout 14400 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
 2854 pts/2    S      0:08  \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
25772 pts/2    S      0:00      \_ /bin/bash -c cd /ssd1/thomas/autobuild/instance-2/output/build/host-heimdal-1.5.3/ &&  PATH="/ssd1/thomas/autobuild/instance-2/output/host/bin:/ssd1/th
[...]
 7028 pts/2    S      0:00 timeout 14400 make O=/ssd1/thomas/autobuild/instance-1/output -C instance-1/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-1/dl BR2_JLEVEL=4
 7029 pts/2    S      0:06  \_ make O=/ssd1/thomas/autobuild/instance-1/output -C instance-1/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-1/dl BR2_JLEVEL=4
19878 pts/2    S      0:00      \_ /bin/bash -c (cd /ssd1/thomas/autobuild/instance-1/output/build/host-cmake-3.1.3; LDFLAGS="-L/ssd1/thomas/autobuild/instance-1/output/host/lib -L/ssd1/

> - did you happen to use Python 2.7 with these patches on a certain
> machine? Did you see issues?

No, I have been testing them only on gcc75 for now, which uses Python 2.6.

I'm planning on deploying them on the Free Electrons build server as
well, but it also has Python 2.6.

> In my testing I have been using Python 2.7.
> It could be that there is something different in Python 2.6, not sure.
> I would need to look into this deeper, unless Andr? who seems to be
> much more knowledgeable about Python has an idea?

That would be nice :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
