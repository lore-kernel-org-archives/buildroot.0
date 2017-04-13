From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Apr 2017 20:14:56 -0300
Subject: [Buildroot] [PATCH v3] atest: new package
In-Reply-To: <20170413224848.393b11be@free-electrons.com>
References: <1491759842-27293-1-git-send-email-festevam@gmail.com>
 <20170413224848.393b11be@free-electrons.com>
Message-ID: <CAOMZO5Ch5+VOHYuO8W4r3wZSBsXSzLSuXvvNsNyC2Fn--nWc5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Apr 13, 2017 at 5:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> A Config.in comment was missing here to show the glibc/musl+thread
> dependency, so I've added that.

I see you added:

+comment "atest needs a glibc or musl toolchain w/ threads"
+ depends on !BR2_bfin
+ depends on BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS

,but this should be:

depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS

Would you like me to send a follow-up patch to fix the comment?
