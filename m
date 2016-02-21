From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 21 Feb 2016 18:33:00 +0100
Subject: [Buildroot] [PATCH] package/util-linux: remove patch for uClibc
 support
In-Reply-To: <20160221182009.4ad78b2f@free-electrons.com>
References: <1455920889-14777-1-git-send-email-romain.naour@gmail.com>
 <56C8F75B.7060701@mind.be> <20160221151047.70803045@free-electrons.com>
 <56C9E6FD.2070707@gmail.com> <20160221182009.4ad78b2f@free-electrons.com>
Message-ID: <56C9F4CC.7050102@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
Le 21/02/2016 18:20, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 21 Feb 2016 17:34:05 +0100, Romain Naour wrote:
> 
>>> Though it looks like this smartcols library also uses fork(), so it
>>> anyway cannot work properly.
>>>
>>> Romain, it seems like your patch is not completely correct, so I've
>>> marked it as Rejected.
>>
>> Ok no problem, I probably didn't selected the good util-linux option... my bad.
> 
> util-linux itself build fine. It's then if you try to link a program
> with libsmartcols.
> 
> But on the other hand, libsmartcols uses fork(), which cannot be used
> on no-MMU platforms... So the fact that libsmartcols uses mkostemp()
> is maybe not that relevant.

So let's disable libsmartcols for no-MMU platforms and remove the patch :)

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
