From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2016 19:43:58 +0300
Subject: [Buildroot] Buildroot now requires IPv6?
In-Reply-To: <nm0hoh$8ce$1@ger.gmane.org>
References: <nm0hoh$8ce$1@ger.gmane.org>
Message-ID: <20160711164358.GT3870@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Mon, Jul 11, 2016 at 04:33:22PM +0000, Grant Edwards wrote:
> The products for which I use buildroot do not have IPv6 support
> (that's in the product requirements).  However, it appears that more
> recent versions of Buildroot now force you to use a toolchain with
> IPv6 support in the C library even if no applications uses IPv6 and
> the kernel doesn't support IPV6.
> 
> Do I understand this correctly?

That's correct. The CHANGES entry for 2015.05-rc1 reads:

  Toolchains: IPv6 and Largefile support now enforced for
  uClibc. Corresponding Kconfig symbols removed.

Only uClibc is mentioned here because other C libraries already enable IPv6 
unconditionally.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
