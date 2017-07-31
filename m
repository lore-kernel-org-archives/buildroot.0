From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:25:04 +0200
Subject: [Buildroot] [RFC PATCH 2/4] support/testing: allow to use extra
 large timeouts
In-Reply-To: <20170730044946.11999-2-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-1-ricardo.martincoski@gmail.com>
 <20170730044946.11999-2-ricardo.martincoski@gmail.com>
Message-ID: <20170731212504.7f4ebf3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 01:49:44 -0300, Ricardo Martincoski wrote:

> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 0cb673c61f..33ac60d6b2 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -28,6 +28,8 @@ def main():
>                          help='number of testcases to run simultaneously')
>      parser.add_argument('-j', '--jlevel', type=int,
>                          help='BR2_JLEVEL to use for each testcase')
> +    parser.add_argument('-e', '--elastic-timeout', type=int, default=1,
> +                        help='increase timeouts (useful for slow machines)')

I find the choice of the "elastic timeout" a bit weird. To me, it feels
like a timeout that will reduce and extend like an elastic, not a
timeout multiplier.

Perhaps we should call this --timeout-multiplier or something like
that ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
