From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 26 Feb 2017 12:19:48 +0100
Subject: [Buildroot] [PATCH] build: add EXTRALIBS to link with
In-Reply-To: <1488107722-15022-1-git-send-email-yann.morin.1998@free.fr>
References: <1488107722-15022-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170226111948.GH12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
Yann E. MORIN wrote,

> When doing a uClibc static build, the build fails to link:
>     http://autobuild.buildroot.org/results/503/50314716a9f72e8bb238e52e9dc342c68f7e0b8b/build-end.log
> 
> The cause is due to:
>   - xfsprogs links dome programs with util-linux' libblkid
>   - util-linux' libblkid is linked to util-linux' libuuid
>   - util-linux' libuuid uses i18n functions when locales are enabled
>   - uClibc does not provide i18n functions

One minor issue. uClibc-ng provides i18n functions when
UCLIBC_HAS_LIBINTL is set. That was added recently, but is available
in the uClibc-ng release used in buildroot.
A better testing of this would be cool. It was imported from
gettext-tiny project from Sabotage linux distribution.

best regards 
 Waldemar
