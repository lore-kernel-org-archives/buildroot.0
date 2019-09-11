From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 09:47:23 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20190910203902.5852-2-matthew.weber@rockwellcollins.com>
References: <20190910203902.5852-1-matthew.weber@rockwellcollins.com>
 <20190910203902.5852-2-matthew.weber@rockwellcollins.com>
Message-ID: <20190911094723.3599082f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Sep 2019 15:39:02 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> * Add new libsysfs dependency for rng available check
> * Remove patch adding special return code when no RNG module is available
> * Remove exit code corner case in systemd script
> * Add new jitterentropy dependency which always provides a entropy source
> * Change to a autotools build
> * Switch to new site and add license file hash
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes v1 -> v2
> [Thomas P
>  - Added host automake/autotools dependencies and checked for no
>    libtool dependency.

As I replied to your v1 just a few minutes ago, if the issue with
<pkg>_AUTORECONF = YES is just the README being missing, then there's a
simple and good solution of adding the "foreign" argument to
AM_INIT_AUTOMAKE. This should be a simple upstreamable patch.

Of course, for upstreaming, you can drop the line in autogen.sh that
copies README.md into README.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
