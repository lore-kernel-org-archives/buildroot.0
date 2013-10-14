From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Oct 2013 21:41:39 +0200
Subject: [Buildroot] [PATCH] snmppp: new package
In-Reply-To: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381758435-13669-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LU9vZRc1B1MeO717yutvHHeZVv7hrYAC22XDrwY8JzPxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, Oct 14, 2013 at 3:47 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in        |  1 +
>  package/snmppp/Config.in | 12 ++++++++++++
>  package/snmppp/snmppp.mk | 16 ++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/snmppp/Config.in
>  create mode 100644 package/snmppp/snmppp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index df53587..16cb36d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -638,6 +638,7 @@ source "package/omniorb/Config.in"
>  source "package/openpgm/Config.in"
>  source "package/ortp/Config.in"
>  source "package/slirp/Config.in"
> +source "package/snmppp/Config.in"
>  source "package/usbredir/Config.in"
>  source "package/wvstreams/Config.in"
>  source "package/zeromq/Config.in"
> diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
> new file mode 100644
> index 0000000..9757814
> --- /dev/null
> +++ b/package/snmppp/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_SNMPPP
> +       bool "snmp++"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       select BR2_PACKAGE_OPENSSL
> +       help
> +         SNMP++v3.x is a C++ API which supports SNMP v1, v2c, and v3.
> +
> +         http://www.agentpp.com/snmp_pp3_x/snmp_pp3_x.html
> +
> +comment "snmp++ requires a toolchain with threads and C++ support enabled"
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

This should now be:
snmp++ needs a toolchain w/ threads, C++

See: http://patchwork.ozlabs.org/patch/283094/
(waiting to be merged, but discussed with Peter)

Best regards,
Thomas
