From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Wed, 30 Jul 2008 09:30:35 +0200
Subject: [Buildroot] Bash failing
In-Reply-To: <20080730012304.GA7254@cloud.net.au>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>	<488D8691.6070904@cetrtapot.si>	<8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>	<488DC095.7000303@cetrtapot.si>	<8bf7d05b0807280833x7cace636xa2b41176d306b6be@mail.gmail.com>	<488EC7EF.4090203@cetrtapot.si>	<8bf7d05b0807290449t58e05508yc8fe48edf12400a2@mail.gmail.com>	<488F09C3.2090205@cetrtapot.si>	<8bf7d05b0807291420n407ca0fn3fc4e01d43545ab7@mail.gmail.com>
	<20080730012304.GA7254@cloud.net.au>
Message-ID: <4890189B.3000502@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Tue, Jul 29, 2008 at 10:20:18PM +0100, Jonathan and Caroline Moore wrote:
>> Still no joy and it is all rather frustrating. Aren't these things
>> meant to "work out of the box"? Are you able to send me the .config
>> you have managed to get working and tell me the buildroot snapshot you
>> used please?

Config is attached.
Buildroot snapshot is r22940.

> 
>> /opt/crosstool/gcc-4.1.0-glibc-2.3.2/arm-unknown-linux-gnu/lib/gcc/arm-unknown-linux-gnu/4.1.0/../../../../arm-unknown-linux-gnu/bin/ld:
>> cannot find -lcurses
> 
>  $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
> -       $(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
> +       $(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" CFLAGS="-I$(STAGING_DIR)/usr/include" -C $(BASH_DIR)
> 
> You probably also need an LDFLAGS="-L$(STAGING_DIR)/usr/lib" then.
> 

Yes, apparently the LDFLAGS need to be fixed too.

> As to working "out of the box", you'd probably have more luck if you
> used the compiler that came out of the same box!
> 

I agree with Hamish on this one.

As you can see buildroot can make its own toolchain and the possibility 
to use external toolchain is not that much in use - meaning there are still
packages that might fail when compiled with external toolchain as we must 
take into account compiler provided headers and libs.

It is almost impossible to make all toolchain/package/architecture combinations
work out of the box. Some combinations work without a glitch (wide usage), 
while others need minor fixes, as in your case, to make things going on :)

> 
>> make[3]: *** [info-recursive] Error 1
> 
> That's weird since no error was printed before that. Can you debug it?

He probably ran the make twice.. Remove the binutils-* folders in toolchain 
build_dir and rerun make.

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
Url: http://busybox.net/lists/buildroot/attachments/20080730/501d5a2c/attachment.txt 
