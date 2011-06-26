From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jun 2011 12:17:54 +0200
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <20110626032236.GA17733@tarshish> (Baruch Siach's message of
 "Sun, 26 Jun 2011 06:22:37 +0300")
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
 <20110626032236.GA17733@tarshish>
Message-ID: <87mxh47v71.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> 1. I can see the generic device_table.txt and it includes a /dev/shm
 >> node. I can also see the /dev structure in output/target and it
 >> matches the generic device_table.txt. But, ... when I build the jffs2
 >> and load it on my MPC8323 target, what I see in /dev does not include
 >> /dev/shm. In fact it is significantly different. So, my first question
 >> is:
 >> 
 >> "What besides generic/device_table.txt can determine the contents of
 >> /dev on an MPC8323 target?"

 Baruch> Do you have devtmpfs mounted on /dev? If so, devtmpfs takes
 Baruch> over the content of /dev, and hides the device nodes and
 Baruch> directories from your device table.

If so, it would be better to use the 'Dynamic using devmtpfs only'
device table option to not waste jffs2 space on device nodes you are not
going to use anyway.

We might need to add a mkdir -p /dev/shm in inittab like we already do
for /dev/pts, as those are not device nodes and hence do not get created
by devtmpfs.

-- 
Bye, Peter Korsgaard
