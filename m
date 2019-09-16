From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Sep 2019 23:36:23 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-09-13
In-Reply-To: <c7f9da15-ae5d-c457-955e-94463962c10b@arcturusnetworks.com>
References: <cmu-lmtpd-8902-1568441566-0@mail>
 <c7f9da15-ae5d-c457-955e-94463962c10b@arcturusnetworks.com>
Message-ID: <20190916233623.676bd27d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oleksandr,

On Mon, 16 Sep 2019 15:19:15 -0400
Oleksandr G Zhadan <oleks@arcturusnetworks.com> wrote:

> I? re-built and re-tested images from fresh today's clone of buildroot 
> on both, uCLS1012A and uCP1020 modules . Everything works OK on real 
> hardware.
> 
> I am not familiar with your run-time test procedures and have not enough 
> info to "fix" working images to pass that test.

defconfigs are not runtime tested, they are only build tested.

> 
> Base on the error from link you pointed to:
> 
> ERROR: Job failed (system failure): Error response from daemon: mkdir 
> /home/docker/aufs/mnt/2d951eb14738916f4779f5f7633bd64272a8286b6fcac64f191e7c5d61b0e678-init: 
> no space left on device (executor_docker.go:743:0s)

As you can see from the error, it was just the build machine that was
used to build these particular defconfigs that ran out of disk space.

I fixed the disk space issue on this build server, and restarted a new
test of all defconfigs. This new test is at
https://gitlab.com/buildroot.org/buildroot/pipelines/82198743/builds,
and you can see that both of your defconfigs built correctly.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
