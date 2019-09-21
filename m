From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:01:23 +0200
Subject: [Buildroot] [PATCH] package/syslog-ng: fix runtime in 32-bit
In-Reply-To: <20190921022614.21674-1-ricardo.martincoski@gmail.com>
References: <20190921022614.21674-1-ricardo.martincoski@gmail.com>
Message-ID: <6b502911-76ed-4552-4e0a-59db08786c36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 04:26, Ricardo Martincoski wrote:
> When this line:
>   unix-stream ("/dev/log");
> is used as source in the .conf file and syslog-ng receives a message
> (sent for test purposes using 'logger') the server throws the exception:
> ERROR:lib/window-size-counter.c:76:window_size_counter_sub: assertion failed: (old_value >= value)
> 
> Even after replacing that config by:
>   unix-dgram ("/dev/log");
> when the server is stopped it throws the same exception.
> 
> Add one upstream patch to fix both issues.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/295369456
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Chris Packham <judge.packham@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 Applied to master, thanks.

 Regards,
 Arnout
