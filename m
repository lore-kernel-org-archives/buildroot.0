From: Espen Frimann Koren <espenfk@gmail.com>
Date: Wed, 9 Oct 2013 10:23:49 +0200
Subject: [Buildroot] Qt 5.0.2 with OpenSSL
In-Reply-To: <20131009095154.2d368292@skate>
References: <CA+csPL7n8=fX7LLyLE4uS4s4uXHTYoLyNVm66b6_Dj0k3N+p-Q@mail.gmail.com>
 <20131008104858.69c60676@skate>
 <CA+csPL5q=rYc_-Q4enRD07Pomj9A6hossAB9cesFnMNnLQv5GA@mail.gmail.com>
 <20131009095154.2d368292@skate>
Message-ID: <CA+csPL6eKEBs3vT4G-Ayx7hUHeZwVvhT85UAsTUWDsmKHWt5LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I lost the build log and when I did make clean, it worked :-)

The link errors did not relate to OpesSSL-libs, but to functions within Qt
that should have been compiled/present when OpenSSL was enabled. Maybe it
was a consequence of how I did the build:

1. Built all without openssl
2. Added openssl and built again, but without clean
2.1 Qt is not rebuilt then
3. Ran make qt5base-dirclean && make qt5base-build because I needed more
features in Qt
3.1 The link error is present
4. make clean && make
4.1 Everything builds fine.

Sp1


On 9 October 2013 09:51, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Espen Frimann Koren,
>
> (Please keep the Buildroot list in Cc, and avoid top-posting if
> possible, thanks!)
>
> On Wed, 9 Oct 2013 09:43:18 +0200, Espen Frimann Koren wrote:
>
> > Nothing that make clean could not fix. Sorry for the "noise".
>
> Ok, but what was the build failure? Probably we can fix it.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/7093c517/attachment.html>
