From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat, 21 Jan 2017 22:26:19 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling
 (again)
In-Reply-To: <1604742275.8026398.1485031975434.JavaMail.zimbra@datacom.ind.br>
References: <1484281849-25875-1-git-send-email-casantos@datacom.ind.br>
 <1484301833-16403-1-git-send-email-casantos@datacom.ind.br>
 <20170117164437.36272eed@free-electrons.com>
 <cc558229-46cf-ebf9-7df1-280cf8c7e18e@cartelsol.com>
 <52160250.7827358.1484854130829.JavaMail.zimbra@datacom.ind.br>
 <1101067464.7863096.1484907843988.JavaMail.zimbra@datacom.ind.br>
 <1604742275.8026398.1485031975434.JavaMail.zimbra@datacom.ind.br>
Message-ID: <463389962.8027894.1485044779415.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Marcus Hoffmann" <m.hoffmann@cartelsol.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: buildroot at busybox.net
> Sent: Saturday, January 21, 2017 6:52:55 PM
> Subject: Re: [Buildroot] [PATCH v2] util-linux: fix ncurses/wchar handling (again)
---8<---
> Hi,
> 
> Would a solution like this be considered too much hacky?
> 
> diff --git a/package/util-linux/util-linux.hash
> b/package/util-linux/util-linux.hash
> index 4f19851..46b58f0 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,2 +1,4 @@
> # From https://www.kernel.org/pub/linux/utils/util-linux/v2.29/sha256sums.asc
> sha256 2c59ea67cc7b564104f60532f6e0a95fe17a91acb870ba8fd7e986f273abf9e7
> util-linux-2.29.tar.xz
> +# Locally computed
> +sha256 d0c3ecc2d80106b65a005056baab4be78bf7184d25fae88aa358c65db54b578c
> ?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 51ece90..6140fe1 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,6 +8,7 @@ UTIL_LINUX_VERSION_MAJOR = 2.29
> UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
> UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
> UTIL_LINUX_SITE =
> $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
> +UTIL_LINUX_PATCH =
> http://git.kernel.org/cgit/utils/util-linux/util-linux.git/patch/?id=9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5
> 
> # For 0001-build-sys-prefer-pkg-config-for-ncurses.patch and
> # 0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
> 
> The only disadvantage seems to be the ugly file name. I looked ad the download
> support scripts and was unable to find a way to save with a more friendly name
> like ?util-linux-9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5.patch?.

Answering to my own question: cgit accepts a request like

    http://git.kernel.org/cgit/utils/util-linux/util-linux.git/patch/9ea8ded37b648bbd538cbf9c4d144b8b1a93c1b5.patch

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
