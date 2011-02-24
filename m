From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 24 Feb 2011 11:06:29 +0100
Subject: [Buildroot] [git commit master 1/1] openssl: fix libdir issue
In-Reply-To: <20110223224020.1E00A8F626@busybox.osuosl.org>
References: <20110223224020.1E00A8F626@busybox.osuosl.org>
Message-ID: <AANLkTimOE0zRtpSX1WZiY=9i3G6rvL1rHm3qY=_TUfZm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/23 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> ---
> ?CHANGES ? ? ? ? ? ? ? ? ? ?| ? ?1 +
> ?package/openssl/openssl.mk | ? ?1 +
> ?2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/CHANGES b/CHANGES
> index 925ef5d..757754e 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -25,6 +25,7 @@
[snip]
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index bf924cb..7bf347a 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -47,6 +47,7 @@ define OPENSSL_CONFIGURE_CMDS


Please split actual code changes and CHANGES updates in two commits.
Keeping them together makes backporting with git cherry-pick hard and
can break future backporting as well.
