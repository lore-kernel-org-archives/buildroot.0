From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:55:25 +0100
Subject: [Buildroot] [PATCH 13/32] qt5base: add OpenSSL support
In-Reply-To: <1362687540-19440-14-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:18:41 +0100")
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362687540-19440-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9qax6lu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt5/qt5base/Config.in  |    8 ++++++++
 Thomas>  package/qt5/qt5base/qt5base.mk |    4 +++-
 Thomas>  2 files changed, 11 insertions(+), 1 deletion(-)

 Thomas> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
 Thomas> index 801ef6f..540c8b2 100644
 Thomas> --- a/package/qt5/qt5base/Config.in
 Thomas> +++ b/package/qt5/qt5base/Config.in
 Thomas> @@ -33,6 +33,14 @@ config BR2_PACKAGE_QT5BASE_NETWORK
 Thomas>  	help
 Thomas>  	  This options enables the Qt5Network library.
 
 Thomas> +config BR2_PACKAGE_QT5BASE_NETWORK_OPENSSL
 Thomas> +	bool "OpenSSL support"
 Thomas> +	select BR2_PACKAGE_OPENSSL
 Thomas> +	depends on BR2_PACKAGE_QT5BASE_NETWORK
 Thomas> +	help
 Thomas> +	  This option enables the OpenSSL support in the Qt5Network
 Thomas> +	  library.

I know we do similar for qt4, but why not just automatically enable ssl
support if openssl is enabled like elsewhere?

-- 
Bye, Peter Korsgaard
