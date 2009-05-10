From: daniele_dll <d.albano@gmail.com>
Date: Sun, 10 May 2009 22:16:23 +0200
Subject: [Buildroot] Problem compiling microperl package for a virtex ii
	pro xc2vp30 (using a ppc405 no fpu)
In-Reply-To: <159a01660905101314k4c2cf892n70c1ed4792ae3025@mail.gmail.com>
References: <159a01660905091618t2b347c53mc361a9091b981c9b@mail.gmail.com>
	<159a01660905100318u525d6f86p4e97780ac434dcde@mail.gmail.com>
	<159a01660905101314k4c2cf892n70c1ed4792ae3025@mail.gmail.com>
Message-ID: <159a01660905101316l8075a0eh7f9ab432a509abb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i forgot to post the link where i founded the patch

http://osdir.com/ml/linux.lfs.hardened/2008-07/msg00017.html

2009/5/10 daniele_dll <d.albano@gmail.com>:
> In the end, i fixed all errors i got
>
> I got last problems with util-linux. Here there is a patch founded
> googling around and adapted to work with util linux 2.13 pre7
>
> http://bugs.gentoo.org/221939
> http://article.gmane.org/gmane.linux.utilities.util-linux-ng/1463
>
> --- a/text-utils/more.c
> +++ b/text-utils/more.c
> @@ -53,8 +53,7 @@
> ?#include <sys/stat.h>
> ?#include <sys/file.h>
> ?#include <sys/wait.h>
> -#include <a.out.h>
> ?#include <locale.h>
> ?#include "xstrncpy.h"
> ?#include "nls.h"
> ?#include "widechar.h"
> @@ -546,9 +545,9 @@ magic(f, fs)
>
> ? ? ? ?if (fread(twobytes, 2, 1, f) == 1) {
> ? ? ? ? ? ? ? ?switch(twobytes[0] + (twobytes[1]<<8)) {
> - ? ? ? ? ? ? ? case OMAGIC: ? ?/* 0407 */
> - ? ? ? ? ? ? ? case NMAGIC: ? ?/* 0410 */
> - ? ? ? ? ? ? ? case ZMAGIC: ? ?/* 0413 */
> + ? ? ? ? ? ? ? case 0407: ? ? ?/* a.out obj */
> + ? ? ? ? ? ? ? case 0410: ? ? ?/* a.out exec */
> + ? ? ? ? ? ? ? case 0413: ? ? ?/* a.out demand exec */
> ? ? ? ? ? ? ? ?case 0405:
> ? ? ? ? ? ? ? ?case 0411:
> ? ? ? ? ? ? ? ?case 0177545:
