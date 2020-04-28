From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:45:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add valgrind support
In-Reply-To: <20200428052225.121426-1-james.hilliard1@gmail.com>
References: <20200428052225.121426-1-james.hilliard1@gmail.com>
Message-ID: <20200428074521.1142454c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 23:22:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Speaking of mesa3d/valgrind, we have this:

  http://autobuild.buildroot.net/results/1b5/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a/build-end.log

Seems like mesa3d is trying to link with some static libraries from
valgrind, which are not built with -fPIC. Have you looked into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
