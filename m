From: bifferos <bifferos@yahoo.co.uk>
Date: Sat, 17 Mar 2012 14:10:04 +0000
Subject: [Buildroot] Debugging /sbin/init startup issues
In-Reply-To: <CALo-6+j2qx4k6X1t8FLeyd=fXTkmx1GEPqV=c7_U6LSPiXv1OA@mail.gmail.com>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
 <4F5D5017.2080908@yahoo.co.uk> <4F629E52.2070608@yahoo.co.uk>
 <CALo-6+j2qx4k6X1t8FLeyd=fXTkmx1GEPqV=c7_U6LSPiXv1OA@mail.gmail.com>
Message-ID: <4F649B3C.4060005@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2012 04:03 AM, Charles Krinke wrote:
>
> Step 1: boot with a kernel command line that ends with the word 
> 'single' for single user-mode.
>
Doesn't help, same error.
>
> Step 2: Back up to a functional kernel image rootfs combination and 
> review the changes.
>
My 'working' version isn't from buildroot so I can't do that.
>
> Step 3: ensure the string 'debug' is on the kernel command line.
>
No change.
>
> Step 4: review the geometry layout of the flash passed to the kernel.
>
It's an initrd appended to the kernel, so flash not involved.
>
> Basically, what this message is telling you is that the kernel does 
> not understand the root file system. The are incompatible, probably 
> something like cramfs when it should be jffs2, wrong mtd partition 
> definition or the like.
>
The kernel does understand some kind of file system, enough to follow 
the symlink from init to busybox, and come up with the name 'busybox'.  
Something then executes enough of busbox to get a segfault and report 
it.  The question is, what could be screwing up the fs or the busybox 
binary so badly?

Biff.
