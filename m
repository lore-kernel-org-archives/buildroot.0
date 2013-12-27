From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:43:03 +0100
Subject: [Buildroot] [PATCHv2] c-ares: new package
In-Reply-To: <1388100234-32766-1-git-send-email-gustavo@zacarias.com.ar>
References: <1388100234-32766-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131227094303.7138a2e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 26 Dec 2013 20:23:54 -0300, Gustavo Zacarias wrote:
> Add c-ares library from bug #6482.
> Most of the credit goes to Gennady Proskurin <gpq@mail.ru>
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                       |  1 +
>  package/c-ares/Config.in                                |  6 ++++++
>  ...-ares-01-use_check_build_instead_of_check_user.patch | 17 +++++++++++++++++
>  package/c-ares/c-ares.mk                                | 16 ++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/c-ares/Config.in
>  create mode 100644 package/c-ares/c-ares-01-use_check_build_instead_of_check_user.patch
>  create mode 100644 package/c-ares/c-ares.mk

Applied, thanks.

> +# Rebuild configure to avoid _XC_CHECK_VAR_CFLAGS
> +C_ARES_AUTORECONF = YES

I've just fixed the comment here, because the patch avoids the usage of
XC_CHECK_USER_FLAGS, not _XC_CHECK_VAR_CFLAGS. I believe that's what
you wanted to say.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
