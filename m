From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Mar 2014 23:11:30 +0100
Subject: [Buildroot] rsync fails to build
In-Reply-To: <20140329180038.7acf5143@skate>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
 <20140329143057.6e6aa65a@skate> <9E4B04B54DB642238FDE42DB9E40DE73@JohanW7>
 <20140329180038.7acf5143@skate>
Message-ID: <5CA29710B49644AAA294F0FD9984A1D8@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear Thomas

The pasted text is here :
http://code.bulix.org/i9z88z-85936?raw

Using gcc 4.8.x  did not solve it.

Regards Johan

-----Oorspronkelijk bericht-----
Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Thomas Petazzoni
Verzonden: zaterdag 29 maart 2014 18:01
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] rsync fails to build

Dear Sagaert Johan,

On Sat, 29 Mar 2014 17:39:20 +0100, Sagaert Johan wrote:

> It contains some suspected lines :
> (I am using gcc 4.6.x)
> 
> checking attr/xattr.h usability... yes checking attr/xattr.h 
> presence... no
> configure.sh: WARNING: attr/xattr.h: accepted by the compiler, rejected by the preprocessor!
> configure.sh: WARNING: attr/xattr.h: proceeding with the compiler's 
> result checking for attr/xattr.h... Yes
> 
> My older (working)build does not have these warnings, but the attr package is selected due to the udev selection and udev extras.
> 
> (Did you build with the packages attr and acl disabled ?)

I had acl and attr disabled, but I tried again with them enabled, and it still works.

> I will do a build using gcc 4.8.x to see if this warning still exists.

I don't think it's going to change anything. Can you do a complete "make clean all" cycle to verify that the error still exists? If
it does, can you please post on http://code.bulix.org the contents of rsync config.log file, as well as the complete build output of
the rsync package, from its extraction step?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
