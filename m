From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 21:46:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build failure on
 power7 and older
In-Reply-To: <20191223213610.142006-1-fontaine.fabrice@gmail.com>
References: <20191223213610.142006-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226214657.63247cac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 23 Dec 2019 22:36:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3ab73995b8393592c0b147670d8ff7f8ebc8c79c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ix-build-failure-on-power7-and-older.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch

Despite your recent PowerPC fixes for libffi, we still have failures:

http://autobuild.buildroot.net/?reason=libffi-3.3

../src/powerpc/ffi_linux64.c: In function 'ffi_prep_args64':
../src/powerpc/ffi_linux64.c:550:34: error: assignment to expression with array type
                 *vec_base.f128++ = **p_argv.f128;
                                  ^

Do you have any idea ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
