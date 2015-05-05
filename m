From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 17:26:10 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87egmvoxqf.fsf@dell.be.48ers.dk>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <87egmvoxqf.fsf@dell.be.48ers.dk>
Message-ID: <20150505172610.5e76bcb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 05 May 2015 17:22:32 +0200, Peter Korsgaard wrote:

>  > Hello,
>  > Simon, Pascal, Gustavo, Vicente, Max, Samuel, Bernd, look below, there
>  > are some questions/tasks for you! :-)
> 
> It would probably have been good to add them in To: then ;)

They were in Cc, but this stupid mailing list removes people from the
Cc: list when they are subscribed. My initial e-mail headers were:

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: buildroot at uclibc.org
Cc: Simon Dawson <spdawson@gmail.com>, Pascal Huerst <pascal.huerst@gmail.com>, Gustavo Zacarias <gustavo@zacarias.com.ar>, Vicente Olivert Riera <Vincent.Riera@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>, Samuel Martin <s.martin49@gmail.com>, Bernd Kuhls <berndkuhls@hotmail.com>

If the mailing list configuration could be changed to not do this
stupid trimming of the Cc addresses, it would be great.

>  >> arm | at-3.1.13 | NOK |
>  >> http://autobuild.buildroot.net/results/6f25e80e8aedec91323ef9b67576b550d7abee60/
> 
>  > musl build problem. Yann has sent a patch to disable at on musl, but I
>  > would actually prefer to fix at.
> 
> J?rg mentioned that OE has a patch:
> 
> http://patchwork.openembedded.org/patch/91893/

So let's use it :-)

>  >> x86_64 | ipmiutil-2.9.5 | NOK |
>  >> http://autobuild.buildroot.net/results/cd2e617f8e2b00581ab5936029f85e62ed3259ba/
> 
>  > md2.o: In function `md2_sum':
>  > md2.c:(.text+0x18): undefined reference to `EVP_md2'
> 
>  > Gustavo, maybe? Has OpenSSL removed md2 support by default or something
>  > like that?
> 
> I believe it simply gets confused about something on the build host.

Yes, Gustavo has already submitted a patch.

>  >> powerpc |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/349922ebab920c82cf087080f96c12310d6e66bb/
> 
>  > All these issues are caused by
>  > http://git.buildroot.net/buildroot/commit/?id=7619aba496208102e098e24454371b9513ec2f90.
>  > I suggest to revert this patch.
> 
> I've reverted it now.

Great. We'll see which Qt related failures remain after that.

>  >> arm | vlc-2.2.1 | NOK |
>  >> http://autobuild.buildroot.net/results/3612b54b0bbc2a55ba6f0febb7be32595b523d96/
> 
>  >   CC       libgles2_plugin_la-gl.lo
>  > arm-none-linux-gnueabi-gcc: ERROR: unsafe header/library path used in
>  > cross-compilation: '/usr/include/directfb'
>  > make[6]: *** [libdirectfb_plugin_la-directfb.lo] Error 1
> 
>  > Bernd, can you have a look?
> 
> I believe it is fixed by:
> 
> http://git.buildroot.net/buildroot/commit/?id=ac95a7a27bf319a69db41

Excellent, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
