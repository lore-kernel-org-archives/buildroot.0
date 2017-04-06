From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Apr 2017 18:29:16 +0300
Subject: [Buildroot] [PATCHv4] fmt: new package
In-Reply-To: <1491488822-17750-1-git-send-email-semenak94@mail.ru>
References: <1491488822-17750-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170406152916.2zucoyggg6clwe55@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Semyon,

On Thu, Apr 06, 2017 at 05:27:02PM +0300, Semyon Kolganov wrote:
> +config BR2_PACKAGE_FMT
> +	bool "fmt"
> +	help
> +	  fmt is an open-source formatting library for C++. It can be used
> +	  as a safe alternative to printf or as a fast alternative to
> +	  IOStreams.
> +
> +comment "fmt needs a toolchain w/ C++"
> +	depends on BR2_INSTALL_LIBSTDCPP

This should be the dependency of BR2_PACKAGE_FMT, not of the comment. The 
comment should depend on !BR2_INSTALL_LIBSTDCPP, that is, the comment shows 
when the toolchain has no C++ support.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
