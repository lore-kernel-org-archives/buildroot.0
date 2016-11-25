From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:14:30 +0100
Subject: [Buildroot] [PATCH 1/1] host-python3: Do not use the system
 OpenSSL.
In-Reply-To: <20161122131109.4459-1-nicolas.cavallari@green-communications.fr>
References: <515ff5e8-2077-f5e9-52eb-7e061b48203a@green-communications.fr>
 <20161122131109.4459-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20161125231430.5ccd16ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 14:11:09 +0100, Nicolas Cavallari wrote:
> host-python3 currently detect if there is an usable OpenSSL installation
> and conditionnaly compiles the 'ssl', '_ssl' and '_hashlib' modules.
> This may break compilation if the system's OpenSSL has been updated to
> 1.1.0 because of a bug in python, see https://bugs.python.org/issue26470
> for details.
> 
> Unlike Python 2.7, Python 3 unconditionnaly compiles fallbacks for
> common hash algorithm, so disabling OpenSSL will still leave Python 3
> with implementations of common hash algorithm.
> 
> This adds a patch to configure.ac patch to implement a --disable-openssl
> option.
> ---
>  .../0031-Add-an-option-to-disable-openssl.patch    | 23 ++++++++++++++++++++++
>  package/python3/python3.mk                         |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 package/python3/0031-Add-an-option-to-disable-openssl.patch

Applied to master, thanks. A useful improvement (for next) would be to
use --enable-ssl/--disable-ssl for the target variant of python3,
depending on the value of BR2_PACKAGE_PYTHON3_SSL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
