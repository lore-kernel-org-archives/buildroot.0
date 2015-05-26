From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 May 2015 13:30:35 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/mtd: add patch to fix host
 build error with gcc 5.1
In-Reply-To: <1432635941-25395-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432635941-25395-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150526103035.GS2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Tue, May 26, 2015 at 12:25:41PM +0200, J?rg Krause wrote:
> diff --git a/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch b/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
> new file mode 100644
> index 0000000..1fb9372
> --- /dev/null
> +++ b/package/mtd/0005-mkfs.ubifs-Fix-build-with-gcc-5.1.patch
> @@ -0,0 +1,72 @@
> +From patchwork Sat May  2 12:38:06 2015
> +Content-Type: text/plain; charset="utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: mkfs.ubifs: Fix build with gcc 5.1
> +From: Bernhard Walle <bernhard@bwalle.de>
> +X-Patchwork-Id: 467254
> +Message-Id: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
> +To: linux-mtd at lists.infradead.org
> +Cc: Bernhard Walle <bernhard@bwalle.de>
> +Date: Sat,  2 May 2015 14:38:06 +0200
> +
> +In gcc 5.1, the default C standard which is used to compile a C file,
> +has changed from gnu89 to gnu11. This changed the meaning of 'extern
> +inline'. See https://gcc.gnu.org/gcc-5/porting_to.html.
> +
> +In mkfs.ubifs, this leads to multiple definitions of
> +hashtable_iterator_key and -hashtable_iterator_value. I think the most
> +pragmatic way to fix the issue is to replace 'extern inline' with
> +'static inline' here.
> +
> +Signed-off-by: Bernhard Walle <bernhard@bwalle.de>

Please add your sign-off here. Also please add a link to 
https://patchwork.ozlabs.org/patch/467254/ to the patch description as well.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
