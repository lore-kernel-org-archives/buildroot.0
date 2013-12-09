From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:41:50 +0100
Subject: [Buildroot] [PATCH 34/38] python-pyasn: new package
In-Reply-To: <1386540907-7242-35-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-35-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LXQm6NRqofsB-C4KNjSVLK5YYD8LQfRDMCUAmepWqnrWg@mail.gmail.com>
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
>  package/Config.in                    |  1 +
>  package/python-pyasn/Config.in       | 13 +++++++++++++
>  package/python-pyasn/python-pyasn.mk | 19 +++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 package/python-pyasn/Config.in
>  create mode 100644 package/python-pyasn/python-pyasn.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 269ac5a..2081a8d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -399,6 +399,7 @@ source "package/python-msgpack/Config.in"
>  source "package/python-netifaces/Config.in"
>  source "package/python-nfc/Config.in"
>  source "package/python-protobuf/Config.in"
> +source "package/python-pyasn/Config.in"
>  source "package/python-pygame/Config.in"
>  source "package/python-pyparsing/Config.in"
>  source "package/python-pyro/Config.in"
> diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
> new file mode 100644
> index 0000000..828c699
> --- /dev/null
> +++ b/package/python-pyasn/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_PYASN
> +       bool "python-pyasn"
> +       depends on BR2_PACKAGE_PYTHON
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       help
> +         PyASN is a Python extension module that enables you to
> +         perform very fast IP address to Autonomous System Number
> +         lookups.
> +
> +         https://code.google.com/p/pyasn/
> +
> +comment "python-pyasn needs toolchain w/ C++"

needs a toolchain
