From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 8 Feb 2021 16:53:07 +0100
Subject: [Buildroot] [PATCH] package/connman: add upstream security
 fixes for CVE-2021-2667{5, 6}
In-Reply-To: <20210208093921.3216-1-peter@korsgaard.com>
References: <20210208093921.3216-1-peter@korsgaard.com>
Message-ID: <CAEyMn7aqMeyjFmJcymQfDkhy6t4YJmeSPXYLAqj+KMdCfJ55yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Am Mo., 8. Feb. 2021 um 10:39 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>
> Fixes the following security issues:
>
> - CVE-2021-26675: Remote (adjacent network) code execution flaw
> - CVE-2021-26676: Remote stack information leak
>
> For details, see the advisory:
> https://www.openwall.com/lists/oss-security/2021/02/08/2
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ding-invalid-data-in-dhcp_get_option.patch | 226 ++++++++++++++++++
>  ...ing-stack-data-via-unitiialized-vari.patch |  27 +++
>  ...gth-checks-to-prevent-buffer-overflo.patch |  56 +++++
>  3 files changed, 309 insertions(+)
>  create mode 100644 package/connman/0001-gdhcp-Avoid-reading-invalid-data-in-dhcp_get_option.patch
>  create mode 100644 package/connman/0002-gdhcp-Avoid-leaking-stack-data-via-unitiialized-vari.patch
>  create mode 100644 package/connman/0003-dnsproxy-Add-length-checks-to-prevent-buffer-overflo.patch

A new version [1] was released today that has these patches
integrated. Maybe we should bump to that.

[1] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=47bd7ab21bfbe115ca4a10b9b96bdbfeb6c35bff

-- 
Heiko
