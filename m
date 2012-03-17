From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 16 Mar 2012 21:03:39 -0700
Subject: [Buildroot] Debugging /sbin/init startup issues
In-Reply-To: <4F629E52.2070608@yahoo.co.uk>
References: <201203031529.36487.arnout@mind.be>
 <1330788921-27127-1-git-send-email-arnout@mind.be>
 <4F5D5017.2080908@yahoo.co.uk> <4F629E52.2070608@yahoo.co.uk>
Message-ID: <CALo-6+j2qx4k6X1t8FLeyd=fXTkmx1GEPqV=c7_U6LSPiXv1OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Step 1: boot with a kernel command line that ends with the word 'single'
for single user-mode.

Step 2: Back up to a functional kernel image rootfs combination and review
the changes.

Step 3: ensure the string 'debug' is on the kernel command line.

Step 4: review the geometry layout of the flash passed to the kernel.

Basically, what this message is telling you is that the kernel does not
understand the root file system. The are incompatible, probably something
like cramfs when it should be jffs2, wrong mtd partition definition or the
like.

Charles
On Mar 15, 2012 5:49 PM, "bifferos" <bifferos@yahoo.co.uk> wrote:

> I have the following error in init:
>
> init[1]: segfault at 0 ip   (null) sp bf95bf40 error 4 in
> busybox[8048000+7c000]
> Kernel panic - not syncing: Attempted to kill init!
>
> How do I debug this?  Does it mean the busybox binary can't be executed?
>  Do I try to tackle this from kernel hacking or can I do it from inside
> busybox?
>
> thanks,
> Biff.
>
>
>
> ______________________________**_________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/**mailman/listinfo/buildroot<http://lists.busybox.net/mailman/listinfo/buildroot>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120316/fd5e4b00/attachment.html>
