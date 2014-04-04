From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 4 Apr 2014 17:35:32 +0200
Subject: [Buildroot] [PATCH] network-manager: Don't build Qt example
	programs
In-Reply-To: <1396624973-58181-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1396624973-58181-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAGm1_kvAuADo09UdVsCTcSNyJiXExiyMCmJt5ODgXRBvmKTbmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 4, 2014 at 5:22 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> The purpose of "--enable-qt" option is not to build NetworkManager with
> Qt support. It's name can be a bit confusing. The real purpose of this
> option is to build Qt example programs, so we disable it as we also
> disable the tests and documentation in the target.
>
> Fixes:
>    http://autobuild.buildroot.net/results/3b6/3b6a40c1683d0859a934e4d79e2048e97b193e94/
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/network-manager/network-manager.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 24bae63..1953888 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -24,6 +24,7 @@ NETWORK_MANAGER_CONF_ENV = \
>  NETWORK_MANAGER_CONF_OPT = \
>                 --mandir=$(STAGING_DIR)/usr/man/ \
>                 --disable-tests \
> +               --disable-qt \
>                 --disable-more-warnings \
>                 --without-docs \
>                 --disable-gtk-doc \

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
