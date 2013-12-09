From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:44:33 +0100
Subject: [Buildroot] [PATCH 36/38] python-pysnmp: new package
In-Reply-To: <1386540907-7242-37-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-37-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LX=Ng0S+E8jHFnUu34ECr2GNKCb5JkfxenHtuP4_v_nMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2013 at 11:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Ryan Barnett <ryanbarnett3@gmail.com>
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-pysnmp/Config.in        | 14 ++++++++++++++
>  package/python-pysnmp/python-pysnmp.mk | 17 +++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/python-pysnmp/Config.in
>  create mode 100644 package/python-pysnmp/python-pysnmp.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 426f55e..601054f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -404,6 +404,7 @@ source "package/python-pycrypto/Config.in"
>  source "package/python-pygame/Config.in"
>  source "package/python-pyparsing/Config.in"
>  source "package/python-pyro/Config.in"
> +source "package/python-pysnmp/Config.in"
>  source "package/python-pyusb/Config.in"
>  source "package/python-pyzmq/Config.in"
>  source "package/python-serial/Config.in"
> diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
> new file mode 100644
> index 0000000..e81df3d
> --- /dev/null
> +++ b/package/python-pysnmp/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_PYTHON_PYSNMP
> +       bool "python-pysnmp"
> +       depends on BR2_PACKAGE_PYTHON
> +       depends on BR2_INSTALL_LIBSTDCPP # pyasn
> +       select BR2_PACKAGE_PYTHON_PYASN
> +       select BR2_PACKAGE_PYTHON_PYCRYPTO
> +       help
> +         PySNMP is a cross-platform, pure-Python SNMP engine
> +         implementation.
> +
> +         http://pysnmp.sf.net
> +
> +comment "python-pysnmp needs toolchain w/ C++"

needs a toolchain
