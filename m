From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Apr 2015 06:13:48 +0300
Subject: [Buildroot] [PATCH 1/1] json-c: bump version to
 json-c-0.12-20140410
In-Reply-To: <552DA110.5050001@proximus.be>
References: <1429002618-22546-1-git-send-email-sagaert.johan@proximus.be>
 <20150414091501.GQ2279@tarshish> <552DA110.5050001@proximus.be>
Message-ID: <20150415031347.GA30380@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert Johan,

On Wed, Apr 15, 2015 at 01:21:52AM +0200, Johan Sagaert wrote:
> Baruch Siach schreef op 14/04/2015 om 11:15:
> >It seems this packages builds with -Werror, hence the need for this patch 
> >to avoid build breakage. A better solution, in my opinion, is to remove 
> >-Werror.
> 
> i tried
> diff --git a/Makefile.am.inc b/Makefile.am.inc
> index fec591b..61db1d2 100644
> --- a/Makefile.am.inc
> +++ b/Makefile.am.inc
> @@ -1,2 +1,2 @@
> -AM_CFLAGS = -Wall -Werror -Wno-error=deprecated-declarations -Wextra
> -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
> +AM_CFLAGS = -Wall -Wno-error=deprecated-declarations -Wextra
> -Wwrite-strings -Wno-unused-parameter -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
> 
> but this seems to yield this unexpected error.
> 
> >>> json-c json-c-0.12-20140410 Building
> PATH="/home/buildroot12git/output/host/bin:/home/buildroot12git/output/host/sbin:/home/buildroot12git/output/host/usr/bin:/home/buildroot12git/output/host/usr/sbin:/root/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/buildroot12git/output/build/host-cmake-3.0.2/bin"
> /usr/bin/make -j1  -C
> /home/buildroot12git/output/build/json-c-json-c-0.12-20140410/
> make[1]: Entering directory
> `/home/buildroot12git/output/build/json-c-json-c-0.12-20140410'
>  cd . && /bin/sh
> /home/buildroot12git/output/build/json-c-json-c-0.12-20140410/missing
> automake-1.14 --gnu Makefile
> /home/buildroot12git/output/build/json-c-json-c-0.12-20140410/missing: line
> 81: automake-1.14: command not found
> WARNING: 'automake-1.14' is missing on your system.
>          You should only need it if you modified 'Makefile.am' or
>          'configure.ac' or m4 files included by 'configure.ac'.
>          The 'automake' program is part of the GNU Automake package:
>          <http://www.gnu.org/software/automake>
>          It also requires GNU Autoconf, GNU m4 and Perl in order to run:
>          <http://www.gnu.org/software/autoconf>
>          <http://www.gnu.org/software/m4/>
>          <http://www.perl.org/>
> make[1]: *** [Makefile.in] Error 127
> make[1]: Leaving directory
> `/home/buildroot12git/output/build/json-c-json-c-0.12-20140410'
> make: ***
> [/home/buildroot12git/output/build/json-c-json-c-0.12-20140410/.stamp_built]
> Error 2
> return of make was 2
> 
> I don't see why.

Please try adding

	JSON_C_AUTORECONF = YES

to your .mk file.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
