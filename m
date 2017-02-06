From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Feb 2017 20:13:17 +0200
Subject: [Buildroot] Odd comment in openntpd/Config.in
In-Reply-To: <o7aan0$qvb$1@blaine.gmane.org>
References: <o7aan0$qvb$1@blaine.gmane.org>
Message-ID: <20170206181317.i3gc4336rm7u2lkd@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Mon, Feb 06, 2017 at 05:10:56PM +0000, Grant Edwards wrote:
> In https://git.busybox.net/buildroot/tree/package/openntpd/Config.in:
> 
> config BR2_PACKAGE_OPENNTPD
>        bool "openntpd"
>        depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>        [...]
> 
> comment "openntpd needs a toolchain w/ NPTL"
>         [...]
>         depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
> Is the "!" in the comment is a typo?

We want to show the comment only when the toolchain has no NPTL support. So 
the "!" makes perfect sense to me.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
