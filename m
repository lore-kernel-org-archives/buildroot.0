From: Massimiliano Marretta <max@marretta.com>
Date: Fri, 08 Oct 2010 10:13:59 +0200
Subject: [Buildroot] Xterm: undefined reference to __longjmp_chk
In-Reply-To: <4CAE0F33.5000305@marretta.com>
References: <4CAE0F33.5000305@marretta.com>
Message-ID: <4CAED2C7.6010607@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  I resolved the problem by add to the makefile.in the CPPFLAGS 
-U_FORTIFY_SOURCE.
There is possibility to add this flag by xterm.mk or is necessary to 
create a patch ?


On 10/07/10 20:19, Massimiliano Marretta wrote:
>  Hi,
>
> I'm using the buildroot 2010.08 version with crosstool-ng toolchain. 
> The target is an x86 i686.
> I receive this error wit xterm compilation:
>
> charproc.o: In function `VTReset':
> charproc.c:(.text+0x2623): undefined reference to `__longjmp_chk'
> main.o: In function `hungtty':
> main.c:(.text+0x867): undefined reference to `__longjmp_chk'
> misc.o: In function `end_vt_mode':
> misc.c:(.text+0x3a3): undefined reference to `__longjmp_chk'
> misc.o: In function `end_tek_mode':
> misc.c:(.text+0x3c7): undefined reference to `__longjmp_chk'
> Tekproc.o: In function `Tinput':
> Tekproc.c:(.text+0x1336): undefined reference to `__longjmp_chk'
> collect2: ld returned 1 exit status
> make[1]: *** [xterm] Error 1
> make[1]: Leaving directory 
> `/srv/source/buildroot-2010.08/output/build/xterm-259'
> make: *** 
> [/srv/source/buildroot-2010.08/output/build/xterm-259/.stamp_built] 
> Error 2
>
>


-- 

Massimiliano Marretta
Via Zuccola 11
41015 Nonantola (Mo) - Italy
tel: +39 347 5340305
skype: mmarretta
/mailto:max at marretta.com/
/web:www.marretta.com/ <http://www.marretta.com>
