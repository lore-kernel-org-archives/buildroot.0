From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:04:09 +0200
Subject: [Buildroot] [PATCH 5/5] package/mariadb: fix build error with
 newer cmake
In-Reply-To: <20190915193559.8464-5-bluemrp9@gmail.com>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
 <20190915193559.8464-5-bluemrp9@gmail.com>
Message-ID: <20190915220409.4aa2d5fa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On Sun, 15 Sep 2019 12:35:59 -0700
Ryan Coe <bluemrp9@gmail.com> wrote:

> When using a newer host system cmake to build MariaDB, the following build
> error occurs:
> 
> CMake Error at cmake/os/Linux.cmake:29 (STRING):
> STRING sub-command REPLACE requires at least four arguments.
> Call Stack (most recent call first):
> CMakeLists.txt:101 (INCLUDE)
> 
> CMake Error at cmake/os/Linux.cmake:29 (STRING):
> STRING sub-command REPLACE requires at least four arguments.
> Call Stack (most recent call first):
> CMakeLists.txt:101 (INCLUDE)
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=11781
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

So, this error occurs with the mariadb version currently in Buildroot.
So this patch is a fix that is unrelated to the version bumps. It
should ideally appear *before* the version bumps in the patch series.
No need to resend, but please confirm that it is independent of the
version bumps.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
