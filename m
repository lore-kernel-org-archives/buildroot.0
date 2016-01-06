From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jan 2016 15:54:44 +0100
Subject: [Buildroot] [PATCH] libnss: add build workaround for older gcc
 versions
In-Reply-To: <1452089934-10364-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452089934-10364-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160106155444.34e63384@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jan 2016 11:18:54 -0300, Gustavo Zacarias wrote:
> nss uses some #pragma directives that require newish (>= 4.6) versions
> of gcc, so disable Werror when building with older versions to avoid the
> build from breaking unfairly.
> However make this a gcc >= 4.8 conditional since the kludge is called so
> (NSS_NO_GCC48) and other bits might depend upon it.

Here you say the kludge is called NSS_NO_GCC48, but...

> +# #pragma usage needs gcc >= 4.8
> +# See https://bugzilla.mozilla.org/show_bug.cgi?id=1226179
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),)
> +LIBNSS_BUILD_VARS += NSS_ENABLE_WERROR=0
> +endif

here you use NSS_ENABLE_WERROR.

Is it me misunderstanding your commit message?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
