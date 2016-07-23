From: Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 23 Jul 2016 19:33:10 +0000 (UTC)
Subject: [Buildroot] [PATCH v4] Don't build host-cmake if it is
 available on the build host
References: <1468702571-23265-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <nn0gpm$pjm$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Jul, 2016 at 20:56:11 GMT, Luca Ceresoli wrote:
> Currently all cmake packages depend on host-cmake. Unfortunately
> host-cmake takes a long time to configure and build: almost 7 minutes
> on a dual-core i5 with SSD. The time does not change even with ccache
> enabled.

FWIW, if Ninja is used to build CMake it is faster[1]. Though I don't see a
way to use Ninja from a bootstrapped build?I'm not sure how much work
that would be.

--Ben

[1]This is also true of pretty much any CMake-based project.
