From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 6 Mar 2020 10:48:23 -0600
Subject: [Buildroot] Use Pigz instead of gzip for filesystem compression
In-Reply-To: <ea-mime-5e627db0-4568-363416cc@www-5.netcourrier.com>
References: <ea-mime-5e627db0-4568-363416cc@www-5.netcourrier.com>
Message-ID: <bfb188d5-2d07-e7aa-bf3c-c221ddf372ff@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis-Paul,

On 3/6/20 10:43 AM, lpdev at cordier.org wrote:
> Hi all,
>
> I have an improvement suggestion for filesystem compression. I have done some benchmark with pigz program (see https://zlib.net/pigz/).
>
> Calling make after the target has been built the first time, buildroot has to compress a 850MB filesystem (build machine is i7-6700K CPU @ 4.00GHz):
>
> gzip: 2m23s
> pigz: 46s
>
> It's almost 3 times faster.
>
> In the main Config.in, I suggest to add to Build options -> Command menu a BR2_GZIP command that would allow to specify the gzip program we want to use. Or better would be to set pigz as an host package.
> Then updating fs/common.mk:
>
> ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
> ROOTFS_$(2)_COMPRESS_EXT = .gz
> ROOTFS_$(2)_COMPRESS_CMD = $(BR2_GZIP) -9 -c -n
> endif
If the commandline parameters are the same, this could likely be done 
within support/dependencies/check-host-gzip.sh ?
> More generally I think it would be useful to specify the compression command, as bzip2 seems to have pbzib2.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
