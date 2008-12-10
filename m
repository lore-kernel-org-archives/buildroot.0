From: Chris Browning <chris@rurallink.co.nz>
Date: Thu, 11 Dec 2008 10:48:14 +1300
Subject: [Buildroot] Init fails to start on Soekris net5501
Message-ID: <200812111048.14537.chris@rurallink.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am not sure if this is the right forum or not, but I have run out of ideas.

Sometimes (about 50-70%) of the time, the boot process stops after the Kernel 
posts "Freeing unused kernel memory: 3348k freed". It will then just sit 
there forever. I do believe that this is where init is spawned and userspace 
is started.

The kernel is defiantly still alive and using magic sys keys, I can ask it 
what the hell it thinks is going on.

A show Regs shows that the kernel is executing init (pid 1). A show tasks 
however does not list init. That suggests to me that perhaps something is 
going wrong spawning init?

The fact that it some times works and sometimes doesn't when makes it feel 
like a race condition somewhere.


The same image (very slightly different kernel) runs happly on a Soekris 
net4526, and a mips build works on several different mips boards.

The net5501 is by far the fastest device.

I am using busy box, so this is busybox init (busybox-1.6.1), and Ulibc 
(0.9.29) with linux 2.6.21.5.

I have made init as verbose as I know how, and the next line when init after 
the kernel freeing memory when it works is the init started message.

Any ideas of where to look further to get to the bottom of this problem would 
be appreciated.



Cheers,


Chris
