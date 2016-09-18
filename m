From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] python-daemon: bump to version 2.1.1
In-Reply-To: <1474165881-2553-1-git-send-email-danomimanchego123@gmail.com>
References: <1474165881-2553-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20160918162043.290611ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 22:31:21 -0400, Danomi Manchego wrote:
> Bump to the latest version, to get python3 support.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

I've applied, thanks!

> NOTE: It is not quite as clear to me in this version that the GPLv3
> license is only test code and build code, because there are more
> hits for "gpl" when I grep the package, in setup.py, version.py,
> test_version.py, the egg info SOURCES.txt, and a few more. However,
> the package home page at https://pypi.python.org/pypi/python-daemon/
> indicates Apache-2 only, as opposed to the previous PSF license. The
> doc/FAQ also mentions only Apache-2. So I am taking them at their word.

I've looking into it a bit, and I believe you're right. For the sake of
correctness, I've just changed it to:

PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPLv3+ (test, build)

so that we're clear that the build aspect (i.e setup.py) is under
GPLv3+ as well. But anyway, what really matters is what gets installed,
i.e the library itself.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
