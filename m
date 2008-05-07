From: Christian SCHWARZ <christian.schwarz@st.com>
Date: Wed, 07 May 2008 09:15:35 +0200
Subject: [Buildroot] link to busybox
In-Reply-To: <102389.57784.qm@web94112.mail.in2.yahoo.com>
References: <102389.57784.qm@web94112.mail.in2.yahoo.com>
Message-ID: <48215717.9090808@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tiju,

I believe root filesystems are not an exact science, thus I can only 
provide you with some generic stuff, which mostly works.
For me, a simple device layout like the following (using busybox or 
buildroot) works on several different embedded platforms:

mknod initrd b 1 250
mknod console c 5 1
mknod mem c 1 1
mknod null c 1 3
mknod ram1 b 1 1
mknod ttyAM0 c 204 16
mknod ram0 b 1 0
ln -s ram1 ram
ln -s ram0 ramdisk

In your case you'd probably replace ttyAM0 with ttySAC0..

> I am very new to this. Could you please tell me how to modify these files to my requirement or atleast the links from where I will get more information regarding this?
Even though this is the buildroot mailing list, I would recommend to 
first try a rootfs with only busybox, thus without buildroot. You can 
easily use the buildroot-generated cross-compiling toolchain with busybox..
  make CROSS_COMPILE=<xtoolchain-prefix> all install

The rc.S file is not required by busybox, it makes some smart assumptions.

hope this helps,
Christian
