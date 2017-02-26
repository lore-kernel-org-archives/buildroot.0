From: Ben Boeckel <mathstuf@gmail.com>
Date: Sun, 26 Feb 2017 16:32:12 +0000 (UTC)
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
References: <cover.1488048682.git.yann.morin.1998@free.fr>
Message-ID: <o8uvu7$rgc$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Feb, 2017 at 18:51:29 GMT, Yann E. MORIN wrote:
> cmake 3.7 causes serious regressions in some cmake-based packages,
> related to how RPATH is handled.
>
> See for example:
>
>   - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/
>   - freerdp  : http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/
>   - libcec   : http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/
>
> (and many others)
>
> All causes the link to be attemped against host libraries, which is
> definitely not appropriate...
>
> Properly fixing this so close to the release is problematic; we'd risk
> having to hunt down packages one by one.

Could you please submit a report to CMake's issue tracker? Regressions
are taken seriously and it'd be nice to have this fixed for 3.8.0 (which
is currently in its RC cycle).

    https://gitlab.kitware.com/cmake/cmake/issues

Thanks,

--Ben
