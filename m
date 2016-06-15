From: Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 15 Jun 2016 23:44:00 +0000 (UTC)
Subject: [Buildroot] [git commit] taskd: add patch to fix musl build
	issue
References: <20160507071838.BB2F8817CA@busybox.osuosl.org>
Message-ID: <njsp80$bbh$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 07 May, 2016 at 07:17:00 GMT, Thomas Petazzoni wrote:
> taskd checks for `get_current_dir_name` but forgets to add a `cmakedefine`
> in cmake.h.in, so `HAVE_GET_CURRENT_DIR_NAME` is always undefined.
>
> CMake detects correctly that the musl C library defines `get_current_dir_name`.
> However, as `HAVE_GET_CURRENT_DIR_NAME` is not set, the block of code evaluated
> cannot be compiled as musl does not define `PATH_MAX`.
>
> Reported upstream:
> https://bug.tasktools.org/browse/TD-120

I didn't see the patch on the issue, so I sent it to the development
list:

    https://groups.google.com/forum/#!topic/taskwarrior-dev/bxIftgz-hBI

--Ben
