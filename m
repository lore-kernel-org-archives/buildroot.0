From: Steven Woody <narkewoody@gmail.com>
Date: Sun, 31 Aug 2008 22:14:27 +0800
Subject: [Buildroot] HELP: the rootfs does not work
In-Reply-To: <1B0F60C9E236904CB364F9EF52E0AFD9026139BC@sma10.technidata-ag.com>
References: <ed4892840808310420n251bb8d1hf052f15b4713200e@mail.gmail.com>
	<1B0F60C9E236904CB364F9EF52E0AFD9026139BC@sma10.technidata-ag.com>
Message-ID: <ed4892840808310714r17e02300la0e03cb8228d11da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 31, 2008 at 8:38 PM, Bussmann, Paul
<Paul.Bussmann@technidata.com> wrote:
> Hi Steven,
>
>
>> I built a cramfs rootfs for my arm target. After burning it to the
>> flash and boot, I got:
>
>> ...
>> scsi0 : SCSI emulation for USB Mass Storage devices
>> IP-Config: No network devices available.
>> VFS: Mounted root (cramfs filesystem) readonly.
>> Freeing init memory: 84K
>> Can't open /dev/null: No such file or directory
>> ...
>> Can't open /dev/null: No such file or directory
>> Can't open /dev/tty2: No such file or directory
>> Can't open /dev/ttyS0: No such file or directory
>> Can't open /dev/null: No such file or directory
>> ...
>
>> I even did not know if the /bin/init got run :(
>
> /bin/init seems to be started or maybe it was overridden at kernel command
> line with "init=...".
> After the initial console has been opened by the Linux Kernel, init is
> started. The /dev/tty... related lines belong to your consoles defined in
> /etc/inittab .
>

I saw from the kernel boot messages, there is a line
"console=/dev/ttyS0".  What you mean by "The /dev/tty... related lines
belong to your consoles defined in /etc/inittab"? I think, I did not
define ( and I don't know how ) any console in inittab.

> I'm not familiar with cramfs, but at least your /etc/inittab has been loaded
> as it seems.

I am afraid, this is a problem related to "busybox", /sbin/init is
merely a symbol link to the busybox.  The reason why I thought that is
because:

1, I have a running rootfs ( provided by the vendor) on hand, I
substitute its original busybox with the buildroot compiled busybox as
well as files in /lib and /usr/lib, then I recompiled that version of
rootfs, got similar "can't open /dev/..." messages at boot time. Of
course the system still can not boot.

2. Still using the vendor provided rootfs, but this time, I put the
buildroot compiled busybox in another directory /usr/local/bin.  And,
after the system boot up with this rootfs, I manually run
'/usr/local/bin/busybox ls', this resulted an error:  "can't find
symbox '__stdin'".  So I GUESS the busybox itself get some problem.
But the building process of buildroot did not report any error.
That's why I am wondering.

So, I still need a solution.

Best Regards,
narke
