From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 22:35:59 +0200
Subject: [Buildroot] [PATCH v1] qt5imageformats: fix AArch64 compile
In-Reply-To: <1469477992-27484-1-git-send-email-ps.report@gmx.net>
References: <1469477992-27484-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160725223559.6bbba979@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 22:19:52 +0200, Peter Seiderer wrote:

> +-equals(QT_ARCH, arm) {
> ++equals(QT_ARCH, arm)|equals(QT_ARCH, arm64) {
> +     SOURCES_FOR_NEON += \
> +         $$PWD/libwebp/src/dsp/dec_neon.c \
> +         $$PWD/libwebp/src/dsp/enc_neon.c \

This seems exactly identical to upstream commit
e4c1d9ece74de212ebe5c55b134de7cb23469e2d, see
https://github.com/qt/qtimageformats/commit/e4c1d9ece74de212ebe5c55b134de7cb23469e2d.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
