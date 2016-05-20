From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 May 2016 07:39:08 +0300
Subject: [Buildroot] [PATCH v2] boot/uboot: fix missing host-openssl for
 i.MX28 target
In-Reply-To: <1463683818-3362-1-git-send-email-joerg.krause@embedded.rocks>
References: <1463683818-3362-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160520043908.GE2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Thu, May 19, 2016 at 08:50:18PM +0200, J?rg Krause wrote:
> Building an U-Boot image for the i.MX23 or i.MX28 target requires to run the
> bootloaders 'mxsimage' tool on the host. As mxsimage needs unconditionally
> OpenSSL, building U-Boot for those targets fails if it is not available on
> the host:
> 
> tools/mxsimage.c:18:25: fatal error: openssl/evp.h: No such file or directory
>   #include <openssl/evp.h>
> 
> Add the required dependency 'host-openssl' to all the different U-Boot image
> types used to build a bootloader image for an i.MX23/i.MX28 target.
> 
> Also pass HOST_CFLAGS and HOST_LDFLAGS to the U-Boot build process so the right
> -I/-L options will be used to find OpenSSL.
> 
> Ported from the Armadeus project:
> https://sourceforge.net/p/armadeus/mailman/message/33595402/
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> [J?rg: port from Armadeus to Buildroot project]
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> ---
> v2:
>  - reset authorship

Using the --reset-author option of 'git commit' sets the patch authorship to 
you. To set Julien as author do 

  git commit --amend --author='Julien Boibessot <julien.boibessot@armadeus.com>'

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
