From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:45:28 +0100
Subject: [Buildroot] [PATCH 38/38] python-pysnmp-mibs: new package
In-Reply-To: <1386540907-7242-39-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-39-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LWNY=9LqbbZB6-fMe3nPPn+yEk2rTG60Lhy2yOqPPpw1A@mail.gmail.com>
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
>  package/Config.in                                |  1 +
>  package/python-pysnmp-mibs/Config.in             | 13 +++++++++++++
>  package/python-pysnmp-mibs/python-pysnmp-mibs.mk | 16 ++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/python-pysnmp-mibs/Config.in
>  create mode 100644 package/python-pysnmp-mibs/python-pysnmp-mibs.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 2e3b289..4dc417f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -406,6 +406,7 @@ source "package/python-pyparsing/Config.in"
>  source "package/python-pyro/Config.in"
>  source "package/python-pysnmp/Config.in"
>  source "package/python-pysnmp-apps/Config.in"
> +source "package/python-pysnmp-mibs/Config.in"
>  source "package/python-pyusb/Config.in"
>  source "package/python-pyzmq/Config.in"
>  source "package/python-serial/Config.in"
> diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
> new file mode 100644
> index 0000000..0512502
> --- /dev/null
> +++ b/package/python-pysnmp-mibs/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
> +       bool "python-pysnmp-mibs"
> +       depends on BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON_PYSNMP
> +       depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
> +       help
> +         PySNMP MIBs is a set of IETF & IANA MIBs pre-compiled and
> +         packaged to simplify their use with the PySNMP library.
> +
> +         http://pysnmp.sf.net
> +
> +comment "python-pysnmp-libs needs toolchain w/ C++"

needs a toolchain
