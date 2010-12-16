From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 16 Dec 2010 15:32:41 +0100
Subject: [Buildroot] udev 164 build fail  & uclibc patch
In-Reply-To: <mailman.930.1292491630.16180.buildroot@busybox.net>
Message-ID: <366CBDCF27F547E2B93DA02BBA2ACC9D@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I did a rebuild of uclibc and still have problems 

= in udev-watch.c:41  undefined  IN_CLOEXEC


And then there seems a linking problem with ata_id.c  undefined reference to
le16toh

So there seems to be more work to do to get udev 164 build.

Johan




Message: 5
Date: Thu, 16 Dec 2010 08:55:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at busybox.net
Subject: Re: [Buildroot] ERROR building udev 164
Message-ID: <20101216085559.62d5cb53@surf>
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Dec 2010 01:21:53 +0100
"Sagaert Johan" <sagaert.johan@skynet.be> wrote:

> I  used the patch from the mailinglist ,
>  
> When building it end with an error SOCK_CLOEXEC undeclared 
>  
> It seems this is something not available in uclibc.
>  
> Regards Johan
>  
> http://lists.busybox.net/pipermail/buildroot/2010-December/039348.html

This has been fixed in uClibc git, but is not yet available in any
release. Can you try to put the patch
http://git.buildroot.net/uClibc/commit/?id=83333e9c873e4eca6b2c945f7770b1f53
73b0427
in toolchain/uClibc/uClibc-0.9.31-add-sock-cloexec.patch, and retry ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com


------------------------------
