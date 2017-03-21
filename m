From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 22:51:42 +0100
Subject: [Buildroot] [PATCH] irssi: add patch to fix static linking
In-Reply-To: <20170321034553.5357-1-rprebello@gmail.com>
References: <20170321034553.5357-1-rprebello@gmail.com>
Message-ID: <20170321225142.2558efe9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 00:45:53 -0300, Rodrigo Rebello wrote:
> An upstream change which removed the option to build Irssi without SSL
> support (v1.0.0 and later) also eliminated the use of PKG_CHECK_MODULES
> to find the OpenSSL library, relying only on a test with AC_CHECK_LIB
> for that purpose.
> 
> This unfortunately broke static linking since the flag to link with
> zlib, used by OpenSSL, is missed completely.
> 
> The newly added patch therefore adds PKG_CHECK_MODULES back into the
> configure script.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e8b51f65525246d1205a26859d418393aaebf48c/
>   http://autobuild.buildroot.net/results/35d952b3b36e295723bf8ed1badb4c9439201822/
>   http://autobuild.buildroot.net/results/ea8af1458edf3ce0e2b1c444d2ae29ac1e5d2fbf/
>   [...]
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  ...-to-using-pkg-config-to-check-for-OpenSSL.patch | 77 ++++++++++++++++++++++
>  package/irssi/irssi.mk                             |  3 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
