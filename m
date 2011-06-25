From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jun 2011 16:40:45 -0700
Subject: [Buildroot] device_table & /dev/shm
In-Reply-To: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
References: <BANLkTi=j9SD2aLP73Cnp6iUWov99h9Npog@mail.gmail.com>
Message-ID: <4E0671FD.4030205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/2011 11:29 AM, Charles Krinke wrote:
> I have two issues I dont understand and am hoping for a few clues to
> help me navigate through the "Swamp of Confusion" to the "Ridge of
> Enlightment".
>
> 1. I can see the generic device_table.txt and it includes a /dev/shm
> node. I can also see the /dev structure in output/target and it
> matches the generic device_table.txt. But, ... when I build the jffs2
> and load it on my MPC8323 target, what I see in /dev does not include
> /dev/shm. In fact it is significantly different. So, my first question
> is:
>
> "What besides generic/device_table.txt can determine the contents of
> /dev on an MPC8323 target?"

I would check shm support in kernel is enabled or not
and /etc/mtab has /dev/shm entry or not.

>
> 2. I can see that named semaphores are not working. That is,
> sem_open() called from an application program fails with ENOSYS. In
> researching this, I can see that this depends on part on /dev/shm and
> linking with -lrt. It also appears that the default /etc/fstab does
> not use /dev/shm. My second question is:
>

I think its because of above problem.

> "What are the items that can go awry in an MPC8323 system that may
> cause named semaphores using the sem_open() call to fail?"
>

Depends if you are using applications that rely on shm_*
