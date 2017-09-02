From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 Sep 2017 11:56:39 +0200
Subject: [Buildroot] [PATCH 0/7] glibc: bump to 2.26
In-Reply-To: <CANLo3JjBwvUG3Emgi8U44aBgxiv75yv8eUK0P8APFzamMQxPFw@mail.gmail.com>
References: <20170827173606.13144-1-romain.naour@gmail.com>
 <nmlc7ex4h4.ln2@ID-313208.user.individual.net>
 <CANLo3JjBwvUG3Emgi8U44aBgxiv75yv8eUK0P8APFzamMQxPFw@mail.gmail.com>
Message-ID: <1cfc2592-0202-ba34-0863-e8f24442e297@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 28/08/2017 ? 09:59, Romain Naour a ?crit :
> Hi Bernd,
> 
> Le 28 ao?t 2017 07:20, "Bernd Kuhls" <bernd.kuhls@t-online.de
> <mailto:bernd.kuhls@t-online.de>> a ?crit :
> 
>     Am Sun, 27 Aug 2017 19:35:59 +0200 schrieb Romain Naour:
> 
>     > Another C++ namespace change trigger a build issue when the code contain
>     > a workaround for math functions:
> 
>     Hi Romain,
> 
>     Kodi is also affected by this problem:
> 
>     /home/buildroot/br8_ffmpeg3_kodi17_github/output/build/kodi-17.4-Krypton/
>     xbmc/dialogs/GUIDialogExtendedProgressBar.cpp:55:14: error:
>     '__builtin_isnan' is not a member of 'std'
>        if (!(std::isnan(fPercentage)))
> 
>     According to https://github.com/voidlinux/void-packages/
>     <https://github.com/voidlinux/void-packages/>
>     issues/7307#issuecomment-322543154 the problem was solved upstream by
>     these patches: https://sourceware.org/ml/libc-alpha/2017-08/msg00586.html
>     <https://sourceware.org/ml/libc-alpha/2017-08/msg00586.html>
> 
>     Voidlinux applied these and other patches from upstream:
>     https://github.com/voidlinux/void-packages/
>     <https://github.com/voidlinux/void-packages/>
>     commit/728afd17c66644ff41fe018ef2be0c0454944a4f
> 
> 
> Thanks for testing!
> 
> The build issue I reported seems sligly different since using glibc 2.26 stable
> branch didn't fix mesa and jsoncpp packages.
> 
> I'll test again including the backported patch. Also, it would be great if you
> can test the patch on your side :)

I'm testing again with the latest v2.26 version from the git branch but kodi
still trigger this issue (event with master).

It seems there is a lot of issues about C++/math with this release...
Maybe we want to wait for glibc 2.26.1 ?

Best regards,
Romain

> 
> Thanks,
> Romain
> 
> 
>     Regards, Bernd
> 
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>     <http://lists.busybox.net/mailman/listinfo/buildroot>
> 
> 
