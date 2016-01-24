From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Jan 2016 06:34:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptables: nfsynproxy not
 available on musl
In-Reply-To: <1453577396-6003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453577396-6003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160124043411.GB2916@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sat, Jan 23, 2016 at 08:29:56PM +0100, Bernd Kuhls wrote:
> utils/nfsynproxy.c needs several TCP_* constants which are not yet
> provided by musl, they were added Jan 17, 2016:
> http://git.musl-libc.org/cgit/musl/commit/?id=53f41fb568ae43034c9876cc9bd3961fd6d13671
> 
> Until we support a musl version containing the constants we disable
> the option for building nfsynproxy on musl.
> 
> Fixes
> http://autobuild.buildroot.net/results/8ee/8ee299d8697bf488ba94f60785e81f274b2128fd/
> http://autobuild.buildroot.net/results/f1a/f1ab3fe59d0dd7dd7b9a7bc6bc10a0019f0fa567/
> http://autobuild.buildroot.net/results/4f9/4f904a2913984201ad0bffb63664019c73e0eb77/
> http://autobuild.buildroot.net/results/65c/65c7d47fdc0f55fb8deb77e34063320e2af337ee/
> http://autobuild.buildroot.net/results/aaa/aaaa1fc92b6a885d223681f40c5df7a962ee1fce/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/iptables/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/iptables/Config.in b/package/iptables/Config.in
> index ae7a634..f5197b7 100644
> --- a/package/iptables/Config.in
> +++ b/package/iptables/Config.in
> @@ -9,6 +9,7 @@ if BR2_PACKAGE_IPTABLES
>  
>  config BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY
>  	bool "bpfc and nfsynproxy"
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

Please add a comment saying which musl version is expected to work for 
iptables.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
