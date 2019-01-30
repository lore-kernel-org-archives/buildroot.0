From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 30 Jan 2019 08:01:32 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-29
In-Reply-To: <20190130070033.5B474209F9@mail.bootlin.com>
References: <20190130070033.5B474209F9@mail.bootlin.com>
Message-ID: <CANQCQpaAX1mdL8e=V2uNsamy4vLNpR7AhH0H1U0k8AG+U6bMAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 30, 2019 at 1:01 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2019-01-29
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  15 |   2 |   0 |  17 |
>    2018.11.x |  29 |   0 |   0 |  29 |
>       master | 162 |  65 |   1 | 228 |
>
> Results for branch '2018.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>        host-libunistring-0.9.7 | 1
>                 libsquish-1.15 | 1
>
>
> Detail of failures
> ------------------
>
>        sparc |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/dc9d4e4b4682ea4ff5f8cf099214269724ed13f1 |
>         m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c60ec845428936cd707d4b9f3501bb9053970716 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                   ffmpeg-3.4.5 | 49
>              host-grpc-v1.16.1 | 4
>                 chocolate-doom | 1
>                 civetweb-v1.11 | 1
>                     efl-1.21.1 | 1
>                  leveldb-v1.20 | 1
>              libgphoto2-2.5.17 | 1
>                libsigrok-0.5.1 | 1
>    libtorrent-rasterbar-1.1.11 | 1
>                      lua-5.3.5 | 1
>                     ofono-1.28 | 1
>                      pcre-8.42 | 1
>                 qt5base-5.11.3 | 1
>                wireshark-2.6.6 | 1
> zbar-b3b4e32b55f570372fc3af... | 1
>
>
> Detail of failures
> ------------------
>

[snip]

>      sparc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/10fd13cef3389b0c88f85572911a01279407516e |
>          arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7ec686d7b73886f01fba6a8ad690e6149113aeb7 |
>     mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a61dd5e2eda71065d2a892843d4f2ea900a6688c |
>       mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/52911efd3380bfa5e20c2e37dedb5ecbf472dde3 |

The bug that's causing this failure is an artifact of the old GCC
configuration I'm building with.  I've attempted to update GCC but
this hasn't seemed to resolve the issue like it should.  Rather then
creating a even more non-standard distro configuration, (just for this
machine)I've added a filter in autobuild-run to drop GRPC when it gets
selected to build.

I plan to re-install soon as EOL is coming up in a couple months.

Matt
