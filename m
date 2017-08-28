From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Aug 2017 07:18:47 +0200
Subject: [Buildroot] [PATCH 0/7] glibc: bump to 2.26
References: <20170827173606.13144-1-romain.naour@gmail.com>
Message-ID: <nmlc7ex4h4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 27 Aug 2017 19:35:59 +0200 schrieb Romain Naour:

> Another C++ namespace change trigger a build issue when the code contain
> a workaround for math functions:

Hi Romain,

Kodi is also affected by this problem:

/home/buildroot/br8_ffmpeg3_kodi17_github/output/build/kodi-17.4-Krypton/
xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:14: error: 
'__builtin_isnan' is not a member of 'std'
   if (!(std::isnan(fPercentage)))

According to https://github.com/voidlinux/void-packages/
issues/7307#issuecomment-322543154 the problem was solved upstream by 
these patches: https://sourceware.org/ml/libc-alpha/2017-08/msg00586.html

Voidlinux applied these and other patches from upstream:
https://github.com/voidlinux/void-packages/
commit/728afd17c66644ff41fe018ef2be0c0454944a4f

Regards, Bernd
