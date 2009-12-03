From: Nicholas Kinar <n.kinar@usask.ca>
Date: Thu, 03 Dec 2009 08:54:12 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <87d42wtq7n.fsf@macbook.be.48ers.dk>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk> <4B15C71D.8020106@usask.ca>
	<4B168E68.1060003@usask.ca> <87tyw9te21.fsf@macbook.be.48ers.dk>
	<4B16EECC.4090909@usask.ca> <4B16F054.8070104@usask.ca>
	<87d42wtq7n.fsf@macbook.be.48ers.dk>
Message-ID: <4B17D114.2010103@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Nicholas" == Nicholas Kinar <n.kinar@usask.ca> writes:
>>>>>>             
>
>  Nicholas> Hello--
>  Nicholas> I've now added these entries to the Buildroot .config file:
>
>  Nicholas> BR2_ENABLE_LOCALE=no
>  Nicholas> BR2_BUILD_SUFFIX=apple-darwin9
>  Nicholas> BR2_EXTRA_GCC_CONFIG_OPTIONS="--host=i686-apple-darwin9
>  Nicholas> --build=i686-apple-darwin9"
>
> BR2_BUILD_SUFFIX should be enough (it's used to set --host / --build).
>
>  Nicholas> lsmod.c:28:24: error: asm/unistd.h: No such file or directory
>  Nicholas> insmod.c:29:24: error: asm/unistd.h: No such file or directory
>  Nicholas> make[1]: *** [lsmod.o] Error 1
>  Nicholas> make[1]: *** Waiting for unfinished jobs....
>  Nicholas> modprobe.c:35:17: error: elf.h: No such file or directory
>  Nicholas> modprobe.c:38:24: error: asm/unistd.h: No such file or directory
>
> That looks to me like a bug. It should look or headers in
> STAGING_DIR/usr/include and not on your host.
>
> I don't normally use module-init-tools, but I'll take a look.
>
>   
Thanks, Peter.   This is greatly appreciated.


Nicholas



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091203/9d2e0800/attachment.htm>
