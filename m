From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Thu, 17 Jan 2013 17:25:35 +1100
Subject: [Buildroot] New kernel source mode [Proposal]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A2F@vpane.excalyptech.com>
 <50F50A74.8000501@relinux.de>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A32@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's the patch I mentioned that will allow Linux to be built out of
tree, from an existing source directory.

 

This patch doesn't correct for the packages that may require direct
access to the source tree (and which assume it's found under LINUX_DIR)
but I can do that later if it's decided there's any merit to the patch
I'm proposing here.

 

I'm going to submit a separate suggestion for the generic out of tree
build system discussed by Thomas Petazzoni, but that is going to be
fairly compatible with what I have here so there's no reason both
suggestions can't be examined.

 

I appreciate your feedback.

 

Cheers,

Przemyslaw

 

From: Stephan Hoffmann [mailto:sho at relinux.de] 
Sent: Tuesday, 15 January 2013 18:51
To: Przemyslaw Wrzos
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] New kernel source mode [Proposal]

 

Am 15.01.2013 02:12, schrieb Przemyslaw Wrzos:

	Hi,

	 

	I'd like to get some feedback on a feature I'd like to
contribute to the buildroot project. I'm not quite sure what the process
is so I thought I'd start on the mailing list.

	 

	 

	PROPOSAL:  Allow a directory (containing the source tree) to be
used as the source for the kernel build. The source isn't copied to the
output directory but instead the kernel's outputmakfile wrapper facility
is used.

	 

Hello,

do you mean the kernel's out of tree build feature?




RATIONALE:  In my project, changes to the kernel are frequent enough
that it is ideal to be able to update the kernel source tree and then
build directly from it.


Isn't this almost the same as can be achieved using the "Source
Override" feature?

But the advantages of your proposal would be saving some time on each
build and some hard disk space. Especially when using huge kernel git
archives.



 

IMPLEMENTATION:  In addition to providing a new source for the linux
build process itself, some package makefiles will need to be updated as
they currently don't differentiate between the kernel source tree and
build tree.

 

 

I have this working already though I still need to update some of the
packages as mentioned above. I wanted to ask if there would be any
interest in rolling this into the buildroot project upstream.

If you send your patch set I'll give it a try, but I cannot judge the
impact of buildroot's overall structure.

Kind regards

Stephan



 

Thanks for your feedback.






_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130117/0d384e28/attachment.html>
