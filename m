From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:17:45 +0200
Subject: [Buildroot] [PATCH 1/2] syslog-ng: bump version header in conf
 file to 3.10
In-Reply-To: <20180419191418.28285-1-ricardo.martincoski@gmail.com>
References: <20180419191418.28285-1-ricardo.martincoski@gmail.com>
Message-ID: <20180419231745.66f6b641@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Apr 2018 16:14:17 -0300, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Remove a runtime warning message about configuration file being too old.
> 
> Do the same as commit 3dad25466d "syslog-ng: Bump version header in conf
> file to 3.9". Package version of syslog-ng is 3.10.1, so bump version
> number in syslog-ng.conf to 3.10.
> 
> Also add a comment to avoid the same warning message reappears when the
> package is bumped.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Chris Packham <judge.packham@gmail.com>

I've applied, thanks. A suggestion below, though.

> diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
> index a3384eebc3..e767255d71 100644
> --- a/package/syslog-ng/syslog-ng.conf
> +++ b/package/syslog-ng/syslog-ng.conf
> @@ -1,4 +1,4 @@
> - at version: 3.9
> + at version: 3.10

Why don't we replace this by:

@version: VERSION_MAJOR

> +# When updating the version, please check at runtime if version at
> +# syslog-ng.conf header needs to be updated
>  SYSLOG_NG_VERSION = 3.10.1

And then:

SYSLOG_NG_VERSION_MAJOR = 3.10
SYSLOG_NG_VERSION = $(SYSLOG_NG_VERSION_MAJOR).1

and do some $(SED) logic when installing syslog-ng.conf ?

This would avoid the need to manually sync this stupid version
number :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
