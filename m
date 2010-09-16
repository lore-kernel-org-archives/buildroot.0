From: Johnny Beardsmore <jny0@hotmail.com>
Date: Thu, 16 Sep 2010 07:01:12 +0000
Subject: [Buildroot] FW:  EXT2-fs error
In-Reply-To: <SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>, ,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>, ,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>, ,
	<20100913102031.03481d63@surf>, ,
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>, ,
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>, ,
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>, ,
	<20100915133124.604f8b74@surf>, ,
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>, ,
	<20100915190725.459aaca8@surf>,
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
Message-ID: <SNT119-W554C523F135D7507BD31F4827A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


 > I don't want to be/seem rude, but it seems you lack some really basic
> embedded Linux knowledge. May I suggest to order and read a book such
> as Building Embedded Linux Systems [1] ?
> 
> That would really help you understanding what is going on.
> 
> Also you are not explaining what you are trying to achieve *in the
> end*. It might be that generating an ext2 filesystem image is totally
> useless for what you're trying to do.

No offence taken.  Reading such a book several months ago would have been a very prudent move.  This is perhaps a bit late now, since in the next couple of weeks I hope to have finished this project.  Most of my previous embedded experience didn't involve an operating system (mostly c onto AVRs via AVRstudio).  I would like to thank everyone now for all the assistance I've recieved with this and the other problems I've encountered.

What I'm doing is using Buildroot to create an embedded OS for a small computing device (a pc-104).  I have some code which then runs on the device and acts as a data collection/analysis system.  Un-taring the rootfs.i486.tar.bz onto the flashdrive of the device using grub has worked for me (with the exception of the problem I'm experiencing), and the whole procedure has been built around this (most of this has been achieved by trial-and-error, and assistance from forums).  I'd really like to avoid changing things to use the ext2 image file if possible and continue using the .tar.bz file.  The problem is I keep loosing frequently accessed files, which is (I bilieve) due to me mounting a file system which hasn't been checked.  I get a warning about the fs on boot, and inode errors when I try to acces a file which has been struck.

I believe this is quite a simple problem to fix - I just can't figure this one out.  I believe I need (some how) to check the file system on either the build machine, and/or the target.  If it is done on the target I may need to do this periodically/on-boot (due to the high number of unclean shut-down the device is likely to experience).  Hopefully this is enough detail, but I'm pulling my hair out with this, so will willingly forward anything further which may assist.  Thanks again.
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100916/1358c0d9/attachment.html>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: ATT00001
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100916/1358c0d9/attachment.ksh>
