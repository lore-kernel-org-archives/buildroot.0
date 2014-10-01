From: Eric Limpens <limpens@gmail.com>
Date: Wed, 1 Oct 2014 21:27:00 +0200
Subject: [Buildroot] wpa_supplicant using epoll
Message-ID: <CABGWzsRbmekc0+vDqd37Cg1hT-At_pUkrgPN95oA5dsGR407qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo, all,

In commit ad92b26df746ef1d9a78e75c6ac8e8557211cf0b epoll has been enabled
for wpa_supplicant.

While debugging issues between connman and wpa_supplicant it looks like
wpa_supplicant is not able to receive dbus messages. I see the same
symptoms as:
https://lists.archlinux.org/pipermail/arch-commits/2014-July/245614.html

My  issues where solved by removing CONFIG_ELOOP_EPOLL from the
wpa_supplicant.mk.

Shouldn't we use the default 'select' method instead of epoll?

Eric.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141001/50d7ca33/attachment.html>
