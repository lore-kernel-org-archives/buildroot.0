From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 13:36:58 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gettext: Fix GETTEXTIZE is
 not defined in case of full gettext
In-Reply-To: <20190408203132.7740-1-vadim4j@gmail.com>
References: <20190408203132.7740-1-vadim4j@gmail.com>
Message-ID: <20190410133658.59b68415@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon,  8 Apr 2019 23:31:32 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> After introducing gettext-tiny in:
> 
> 	5367a1b253 package/gettext-tiny: new package
> 
> GETTEXTIZE variable is conditionally defined separately by gettext-gnu
> or gettext-tiny package depending on which of them is enabled. But it
> causes the issue when BR2_TOOLCHAIN_HAS_FULL_GETTEXT=y, because in that
> case BR2_PACKAGE_GETTEXT is not selected by BR2_SYSTEM_ENABLE_NLS config
> and GETTEXTIZE is not defined, which causes build fail for packages
> which uses gettextizing (e.g. host-flex).
> 
> Fix issue by defining GETTEXTIZE unconditionally in
> package/gettext/gettext.mk. It is not needed to define it in each
> gettext-*.mk because the difference is only in passing 'data_dir'
> parameter which points to ${PREFIX}/share/gettext-tiny (in case of
> gettext-tiny provider), but simple linking:
> 
> 	${PREFIX}/share/gettext -> ${PREFIX}/share/gettext-tiny
> 
> solves this issue.
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
> v3:
>     Make commit message more descriptive and cleaner, also fix 'data_dir'
>     explanation which was not updated in v2.

Applied to master after reworking the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
