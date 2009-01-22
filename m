From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Thu, 22 Jan 2009 16:22:11 +0100
Subject: [Buildroot]    busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local><87d4egudlg.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local><8763k8uacw.fsf@macbook.be.48ers.dk><1232559369.11888.20.camel@elrond.atmel.com><5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local><877i4no5n7.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
	<87zlhjml3m.fsf@macbook.be.48ers.dk>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I configured buildroot to use an external toolchain and tried using the 
toolchain built with the working configuration (r24822) to build the 
current version of the root file system (r24966). Here the login actually 
works!

Using an newer toolchain, but still external (r24936) still gives the
same login problem. Also building todays buildroot with todays toolchain 
gives the same problem. Seems the problem lies within the toolchain.
Ulf: you said something about that you maybe updated the uClibc 
configuration. Can you explain this?

 Peter> Could you do little binary search between those 2 revisions to
 Peter> close in on the problem commit (E.G. try 24872, if that works
 Peter> then 897, else 847 and so on)?

 Robin> Well, I could do that, but the build time is quite long for a
 Robin> complete buildroot.  I could try with external toolchain, but
 Robin> if the problem comes from uClibc it won't show.

Peter> You don't have to trace it completely down to a single commit, but if
Peter> you could do it 1 or 2 times it would make it a lot easier to track
Peter> down.

If I have to rebuild the toolchain each time it will take time, but I will
make some more experiments.

Regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090122/3e98a680/attachment-0001.htm 
