From: William Wagner <will_wagner@carallon.com>
Date: Thu, 29 Apr 2010 16:18:48 +0100
Subject: [Buildroot] Use case: initrd + NFS
In-Reply-To: <4BD9959C.5000905@triumf.ca>
References: <4BD9959C.5000905@triumf.ca>
Message-ID: <4BD9A358.7070901@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/2010 15:20, Rod Nussbaumer wrote:
> Hi all. First post here. Thanks for the great tool.
>
> Someone mentioned use-cases, and I thought I would jump in with what I 
> was hoping to be able to build, but so far it looks like I will have 
> to work outside the the box. I'm wondering if anyone is working on or 
> sees a need for the configuration I would like to achieve.
> I am targeting diskless, headless CPUs that boot entirely from a 
> network server using PXE.
> In my world, it would be ideal to have a system that includes a 
> minimal initrd filesystem, plus a more substantial filesystem which 
> would be suitable for exporting via NFS. In this scenario, the target 
> would boot, and the init process would connect to the NFS server to 
> mount the rest of the filesystem which would contain applications and 
> the majority of the tools that the target host would use.
> Using such a scheme would allow a lot of 'offline' upgrades to be 
> added without requiring the target to be rebooted; simply replace the 
> content of the filesystem on the NFS server to upgrade the target. 
> Also, part of my intent is to get a system that boots as quickly as 
> possible, and the minimal initrd seems to aid in accomplishing this.
> I am still quite green with the use of buildroot, and not sure how 
> much effort is required to add this kind of capability. If someone can 
> assure me that it isn't a giant project, I may try to undertake it. Of 
> course any pointers about how to accomplish it would be gratefully 
> accepted, and the result of my effort would be available to roll back 
> into the buildroot tool, if it was wanted. Or, perhaps I've simply 
> overlooked an existing  configuration option that would produce such a 
> system.
> Thanks for listening.

This sounds similar to a problem that is on my todo list. I want to 
build a system with a minimal initramfs and then split the rest of the 
filesystem into a jffs2 image. I don't believe this functionality 
exists, although there is something in there for getting an initramfs 
built by busy box. If you have any ideas on how to proceed I'd be happy 
to offer feedback.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
