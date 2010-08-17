From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Aug 2010 14:10:45 +0300
Subject: [Buildroot] ldconfig errors
In-Reply-To: <000501cb3def$b74a9eb0$25dfdc10$@pauljones.id.au>
References: <000501cb3def$b74a9eb0$25dfdc10$@pauljones.id.au>
Message-ID: <20100817111045.GC9631@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Tue, Aug 17, 2010 at 07:36:47PM +1000, Paul Jones wrote:
> I seem to have run into the ldconfig error while using a crosstool-ng
> external toolchain (uclibc based). I remember this being discussed a while
> back but can't seem to find a solution, short of using an internal
> toolchain.
> 
> This is the error:
> 
> if [ -x
> "/media/dev/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnue
> abi-ldconfig" ]; \
> 
>         then \
> 
>  
> /media/dev/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnuea
> bi-ldconfig -r /media/dev/buildroot-arm/output/target 2>/dev/null; \
> 
>         else \
> 
>                 /sbin/ldconfig -r /media/dev/buildroot-arm/output/target
> 2>/dev/null; \
> 
>         fi
> 
> make: *** [target-finalize] Error 1
> 
> I can't use the host version unless I run as root. This is on a Gentoo
> x86_64 host with ARM target.
> 
> Any suggestions?

See http://lists.busybox.net/pipermail/buildroot/2010-June/035443.html and 
http://lists.busybox.net/pipermail/buildroot/2010-August/036726.html.

I hope this helps.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
