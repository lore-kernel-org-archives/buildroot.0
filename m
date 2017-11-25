From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 17:45:35 +0100
Subject: [Buildroot] [PATCH] utils/diffconfig: add diffconfig utility
In-Reply-To: <20171125135047.503d4fda@windsurf.lan>
References: <20171104203644.4045-1-marcus.folkesson@gmail.com>
 <20171125135047.503d4fda@windsurf.lan>
Message-ID: <474413fe-d7c5-0759-b17b-0456e14c3b18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-17 13:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  4 Nov 2017 21:36:44 +0100, Marcus Folkesson wrote:
>> Diffconfig is a simple utility for comparing two configuration files.
>> See usage in the script for more info.
>>
>> Borrowed from the Linux kernel source code and adapted to Buildroot.
>>
>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> ---
>>  DEVELOPERS       |   3 ++
>>  utils/diffconfig | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 139 insertions(+)
>>  create mode 100755 utils/diffconfig
> 
> I've applied to next. However, I must say I've personally not be very
> convinced by the output of this tool. If you generate the .config
> corresponding to an empty defconfig on one side, and the following
> defconfig on the other side:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_BELLAGIO=y
> BR2_PACKAGE_FFMPEG=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> You will get a very, very, very noisy output with "diffconfig". And
> comparately, the diff between the defconfigs is a lot more readable.

 Well, it's not really meant for that kind of situation. It's meant for a
situation where you would normally diff the full configs because you want to see
which packages have been implicitly added or removed (due to select or depends).
You'd normally do a diff .config.old .config, but then you get a lot of changes
that are due to packages that have become available but are not selected - not
very interesting. So in this case, diffconfig gives more compact and readable
results.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
