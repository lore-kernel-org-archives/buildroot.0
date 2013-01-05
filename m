From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 5 Jan 2013 17:09:32 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <CA+wH2971Nbf8TJJOHiP5gCFTGqtc=b2YkxLEs9m1Mo2LVEkbgQ@mail.gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <CA+wH2971Nbf8TJJOHiP5gCFTGqtc=b2YkxLEs9m1Mo2LVEkbgQ@mail.gmail.com>
Message-ID: <CAGduivxnhxFMp9Vtz01Xt46+qKRD7xOcXBAq3ck-gXppYzqATA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 5, 2013 at 4:52 PM, Alex Bradbury <asb@asbradbury.org> wrote:
> On 5 January 2013 14:10, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
>> diff --git a/package/rpi-fw/config.txt b/package/rpi-fw/config.txt
>> new file mode 100644
>> index 0000000..ab9f7ff
>> --- /dev/null
>> +++ b/package/rpi-fw/config.txt
>> @@ -0,0 +1,7 @@
>> +arm_freq=700
>> +core_freq=250
>> +disable_overscan=1
>> +gpu_mem_256=100
>> +gpu_mem_512=100
>> +sdram_freq=400
>> +over_voltage=0
>
> It's not clear to me that you want a config.txt at all, but if you are
> going to add one I'm not sure it's appropriate to overclock the sdram
> by default.
The sdram is not over clocked, according to this page :
http://elinux.org/RPiconfig
The default is 400Mhz.
>
>> +#############################################################
>> +RPI_FW_VERSION = 76d0ac38f16b6343c6155c80db1e4758b3a5838a
>> +RPI_FW_SITE = http://github.com/raspberrypi/firmware/tarball/master
>> +RPI_FW_LICENSE = FOSS
>> +RPI_FW_LICENSE_FILE = LICENCE.broadcom
>
> The license is straight-forward and allows redistribution with no
> strings attached, but is not a FOSS license.
>
I'll change the license, I was unable to find information that seemed valid.
> Regards,
>
> Alex
