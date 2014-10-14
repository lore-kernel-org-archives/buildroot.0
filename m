From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 14 Oct 2014 10:59:43 +0200
Subject: [Buildroot] [PATCH v3 2/3] gst-ffmpeg: add --pkg-config to
 internal libav configure options
In-Reply-To: <CANxTyt4jq7EE-99rWsGiFgCjAKptaGWHyMpaEtgKxyZPhBG3Jg@mail.gmail.com>
References: <1413142206-30581-1-git-send-email-danomimanchego123@gmail.com>
 <1413142206-30581-2-git-send-email-danomimanchego123@gmail.com>
 <543BD5B5.4000602@lucaceresoli.net>
 <CANxTyt4jq7EE-99rWsGiFgCjAKptaGWHyMpaEtgKxyZPhBG3Jg@mail.gmail.com>
Message-ID: <543CE5FF.9000307@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi,

Danomi Manchego wrote:
> Luca,
>
> On Mon, Oct 13, 2014 at 9:37 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Dear Danomi,
>>
>> Danomi Manchego wrote:
>>>
>>> The internal copy of libav in gst-ffmpeg does not understand the
>>> PKG_CONFIG env variable, so it throws a line like this at the end
>>> of its configuration:
>>>
>>> WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found,
>>> library detection may fail.
>>
>>
>> I tried to reproduce the issue, but the message didn't show up.
>> Can you chare a defconfig to reproduce the issue?
>
> I've seen this in a few different configurations, so I didn't think
> that you needed anything special.  But anyway, here is one possible
> defconfig:
>
>      BR2_arm=y
>      BR2_cortex_a8=y
>      BR2_ARM_FPU_NEON=y
>      BR2_ENABLE_DEBUG=y
>      BR2_TOOLCHAIN_EXTERNAL=y
>      BR2_PACKAGE_GSTREAMER=y
>      BR2_PACKAGE_GST_FFMPEG=y
>      # BR2_TARGET_ROOTFS_TAR is not set
>
> Look at the very end of the configure step, just before the build step:
>
>      License: GPL version 2 or later
>      Creating config.mak and config.h...
>
>      WARNING: xxxx/output/host/usr/bin/arm-none-linux-gnueabi-pkg-config
> not found, library detection may fail.

Reproduced with this config, and disappeared applying your patch.

Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
