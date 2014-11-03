From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 22:33:04 +0100
Subject: [Buildroot] [PATCH v2] gst1-plugins-imx: add package
In-Reply-To: <5456AC81.5090403@lucaceresoli.net>
References: <1414636344-8152-1-git-send-email-bisson.gary@gmail.com>
 <5456AC81.5090403@lucaceresoli.net>
Message-ID: <5457F490.6050200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/11/14 23:13, Luca Ceresoli wrote:
> Dear Gary,
> 
> thanks for you resubmission.
> 
> Gary Bisson wrote:
>> Open-source GStreamer 1.0 plugins for i.MX platforms.
>> More info at https://github.com/Freescale/gstreamer-imx
>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>> ---
>> Modifications v1->v2:
>> - Use of github helper macro
>> - Modify package comment with Peter S. original patch
>> - Add comment for eglibc dependency (due to GPU libs)
>> - Remove comments on package dependencies
>>
>> One thing I wasn't sure about, should all new package contain a .hash file? If
>> so I can submit a v3 right away.
> 
> It is not mandatory. AFAIK the hash is recommended for security-related
> packages only.

 We discussed it last BR meeting but didn't come to a real conclusion. For sure,
the hash file isn't mandatory.


> 
> [...]
>> diff --git a/package/gstreamer1/gst1-plugins-imx/Config.in
>> b/package/gstreamer1/gst1-plugins-imx/Config.in
>> new file mode 100644
>> index 0000000..d499874
>> --- /dev/null
>> +++ b/package/gstreamer1/gst1-plugins-imx/Config.in
>> @@ -0,0 +1,28 @@
>> +comment "gst1-plugins-imx needs an imx-specific Linux kernel to be built"
>> +    depends on BR2_arm && !BR2_LINUX_KERNEL
>> +
>> +# Required by gpu-viv-bin-mx6q
>> +comment "gst1-plugins-imx needs an (e)glibc toolchain"
>> +    depends on BR2_arm
>> +    depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
> These messages are much cleaner than in version 1 of your patch.
> However, for an ARM configuration with a musl or uClibc toolchain and
> without a kernel build activated, two lines are displayed. This is not
> coherent with the general Buildroot behavior.

 Well, there are a few other packages like that. Because...

> 
> It should be:
> 
> comment "gst1-plugins-imx needs an (e)glibc toolchain and an imx-specific Linux
> kernel to be built"

 ... this line is really too long.


 Regards,
 Arnout

>     depends on BR2_arm && (!BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC)
> 
> Although that's a bit lengthy...
> 
> With that fixed (which can be done by the committer):
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> I'll try to test it during the coming week and give my Tested-by tag, or
> report any issues.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
