From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Thu, 22 Jan 2009 20:12:17 +0100
Subject: [Buildroot]     busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local><87d4egudlg.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local><8763k8uacw.fsf@macbook.be.48ers.dk><1232559369.11888.20.camel@elrond.atmel.com><5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local><877i4no5n7.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local><87zlhjml3m.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
	<87sknbmjj4.fsf@macbook.be.48ers.dk>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Robin> I configured buildroot to use an external toolchain and tried
 Robin> using the toolchain built with the working configuration
 Robin> (r24822) to build the current version of the root file system
 Robin> (r24966). Here the login actually works!

Seems I've been searching a dead end. I compared the configurations and 
found that I had Target ABI set to EABI, but Ulf has used OABI in 
at91sam9263ek_defconfig. When selecting OABI the login works for all 
versions I have tried, including r24966 from today.

I know I have selected EABI in buildroot sucessfully in the past and my kernel 
is built to support both. Now I have no idea when this thing broke - probably 
months ago.

What ABI is recommended for Buildroot? I though that if selectable you should 
always choose EABI since it's newer?

Best regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090122/c7ea09db/attachment.htm 
