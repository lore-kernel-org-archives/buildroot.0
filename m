From: Rod Nussbaumer <bomr@triumf.ca>
Date: Thu, 29 Apr 2010 07:20:12 -0700
Subject: [Buildroot] Use case: initrd + NFS
Message-ID: <4BD9959C.5000905@triumf.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all. First post here. Thanks for the great tool.

Someone mentioned use-cases, and I thought I would jump in with what I 
was hoping to be able to build, but so far it looks like I will have to 
work outside the the box. I'm wondering if anyone is working on or sees 
a need for the configuration I would like to achieve.
I am targeting diskless, headless CPUs that boot entirely from a network 
server using PXE.
In my world, it would be ideal to have a system that includes a minimal 
initrd filesystem, plus a more substantial filesystem which would be 
suitable for exporting via NFS. In this scenario, the target would boot, 
and the init process would connect to the NFS server to mount the rest 
of the filesystem which would contain applications and the majority of 
the tools that the target host would use.
Using such a scheme would allow a lot of 'offline' upgrades to be added 
without requiring the target to be rebooted; simply replace the content 
of the filesystem on the NFS server to upgrade the target. Also, part of 
my intent is to get a system that boots as quickly as possible, and the 
minimal initrd seems to aid in accomplishing this.
I am still quite green with the use of buildroot, and not sure how much 
effort is required to add this kind of capability. If someone can assure 
me that it isn't a giant project, I may try to undertake it. Of course 
any pointers about how to accomplish it would be gratefully accepted, 
and the result of my effort would be available to roll back into the 
buildroot tool, if it was wanted. Or, perhaps I've simply overlooked an 
existing  configuration option that would produce such a system.
Thanks for listening.

    ---   rod.
