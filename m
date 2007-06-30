From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 30 Jun 2007 13:56:13 +0300
Subject: [Buildroot] buildroot uClibc build problems for powerpc
In-Reply-To: <468411CB.8040200@freescale.com>
References: <468411CB.8040200@freescale.com>
Message-ID: <20070630135613.27661bd0@newbox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Jun 2007 15:53:47 -0400
Paul Barrette wrote:

> 
> I get the following error:
> 
> make[1]: Entering directory 
> `/localdisk/pb/latest_buildroot/buildroot/toolchain_build_powerpc_nofpu/uClibc' 
> 
>  CC utils/readelf
>  STRIP -x -R .note -R .comment ../utils/readelf
>  CC utils/ldconfig
>  STRIP -x -R .note -R .comment ../utils/ldconfig
>  CC utils/ldd
>  STRIP -x -R .note -R .comment ../utils/ldd
>  CC utils/iconv
> ../libc/misc/wchar/wchar.c:132:2: warning: #warning 
> __CTYPE_HAS_UTF_8_LOCALES not set!
> ../libc/misc/wchar/wchar.c: In function '_wchar_utf8sntowcs':
> ../libc/misc/wchar/wchar.c:169: error: expected declaration specifiers 
> before 'attribute_hidden'
> ../libc/misc/wchar/wchar.c:172: error: expected '=', ',', ';', 'asm' or 
> '__attribute__' before 'attribute_hidden'
> ../libc/misc/wchar/wchar.c:1186: error: storage class specified for 
> parameter '_UC_iconv_t'

> 

Hi Paul, 

you may try this patch:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/3143

BR,
Ivan
