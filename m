From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 07:17:56 +0200
Subject: [Buildroot] How to just build one application?
References: <419079.4317.qm@web15806.mail.cnb.yahoo.com>
Message-ID: <015601c7d404$0e17b1a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> I've installed  arm linux gcc 4.1.1 toolchains and I want to build uclibc samba with buildroot package. 
>>> How can I skip building toolchains and just build samba package with the pre-installed toolchains ?
>> 
>> $ make samba
>> 
>> You can build any target that is defined in a *.mk file by passing it
>> directly to the make call.
>> 
>> Philippe
>
>I added "sambe" with make menuconfig and then issued "make samba". But the build script still build gcc tool chain first.  
> 

There is a menu configuration item:
    Toolchain type --->
        Toolchain type (External Toolchain)

Then you need to set the paths in the
    Toolchain Options --->


Best Regards
Ulf Samuelsson
