From: Lane Brooks <lane@brooks.nu>
Date: Thu, 27 Dec 2007 09:35:41 -0700
Subject: [Buildroot] x11r7 modules not installing
In-Reply-To: <477238FD.1080103@promwad.com>
References: <47720172.3010200@brooks.nu> <477238FD.1080103@promwad.com>
Message-ID: <4773D45D.40208@brooks.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan Kuten wrote:
> Lane Brooks wrote:
>> I am new to buildroot, but so far it is great.
>>
>> I am trying to build x11r7, but modules do not seem to get installed 
>> correctly.  It seems the build script is calling 'make install-exec', 
>> which does not install the modules onto the target.  Am I doing 
>> something wrong?  Anyone know why my x11 modules are not getting installed?
>>
>> Thanks,
>> Lane Brooks
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
> 
> Hi,
> 
> This is because X11 support is still experimental - you need to do manual work.
> Patches are welcome.
> 
> 
> Regards,
> Ivan
> 

I changed Makefile.autotools.in to call 'install' instead of 
'install-exec', and now the X11r7 modules are installing correctly (see 
patch).  I am not sure if this introduces other issues with other 
packages or what the differences between install-exec and install are. 
Can anyone explain it?

Lane

-------------- next part --------------
A non-text attachment was scrubbed...
Name: x11r7install.patch
Type: text/x-patch
Size: 627 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071227/cdce5c66/attachment.bin 
