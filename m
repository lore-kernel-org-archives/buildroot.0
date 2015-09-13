From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 23:23:32 +0200
Subject: [Buildroot] using buildroot to statically build uclibc
In-Reply-To: <CAEjFr-YUow8iFvMhv-DK3y390P3HunZD4nMUUpREMzk-2NtgWA@mail.gmail.com>
References: <CAEjFr-Zk4HTs7NPYOtheUzGbHVtZmmAb5daRR_MrW4yS22daGA@mail.gmail.com>
 <55F4314D.80606@mind.be>
 <CAEjFr-YUow8iFvMhv-DK3y390P3HunZD4nMUUpREMzk-2NtgWA@mail.gmail.com>
Message-ID: <20150913232332.54418192@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Sep 2015 19:53:15 +0300, Doha Ehab wrote:
> So in order to use the generated uclibc to cross compile mpich (and link
> everything statically) I have to extract the rootfs.tar and use it to
> statically build the mpich is that correct ?

No: Buildroot does not generate a development environment for the
target (i.e we don't build a compiler).

Instead, you should create a Buildroot package for mpich, so that it
gets cross-compiled as part of the Buildroot build. See the Buildroot
manual for all the details about adding a new package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
