From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 13 Jan 2013 11:51:49 +0100
Subject: [Buildroot] [PATCH] rpi-firmware: Add default kernel name to
	config.txt
In-Reply-To: <16f9.50f28078.5f8a4@xionine.xdna.net>
References: <1357926905-26350-1-git-send-email-maxime.hadjinlian@gmail.com>
 <16f9.50f28078.5f8a4@xionine.xdna.net>
Message-ID: <CAGduivwOq-V_eq6NL3L4F7atHv00dE2FeeD4eqhx=HYaOPYkgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 13, 2013 at 10:38 AM, Cam Hutchison <camh@xdna.net> wrote:
> Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>>diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
>>index 2cabd68..da212c4 100644
>>--- a/package/rpi-firmware/config.txt
>>+++ b/package/rpi-firmware/config.txt
>>@@ -6,6 +6,7 @@
>>
>> arm_freq=700
>> core_freq=250
>>+kernel='zImage'
>
> In my experiments, no quotes (single or double) should be around zImage.
> With either, it fails to boot. Just:
>
> kernel=zImage
You're right, I got bitten by the two partition stuff, I changed the
file in the rootfs when I tested.
>
>> disable_overscan=1
>> gpu_mem_256=100
>> gpu_mem_512=100
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
