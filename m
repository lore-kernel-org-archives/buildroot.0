From: Louis Rannou <louis.rannou@smile.fr>
Date: Tue, 26 Nov 2019 22:34:36 +0100
Subject: [Buildroot] [PATCH] package/libfcgi: bump to version 2.4.2
In-Reply-To: <20191118211531.5322485f@windsurf.home>
References: <20191118125434.105949-1-louis.rannou@smile.fr>
 <20191118211531.5322485f@windsurf.home>
Message-ID: <226534cb-baea-c908-bfe9-c8a2ce4d4208@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, thanks for the answer

On 18/11/2019 21:15, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for your contribution!
>
> On Mon, 18 Nov 2019 13:54:34 +0100
> Louis Rannou <louis.rannou@smile.fr> wrote:
>
>> FCGI is abandonned (https://repo.or.cz/fcgi2.git). Replace it by a maintained
>> fork (https://github.com/FastCGI-Archives/fcgi2).
>>
>> Most of the patches are already in the latest version.
> Ideally, it would be nice to have a more detailed description of the
> status of the patches, with for each patch that is removed, a link to
> the corresponding upstream commit.

Ok, here is what I can add :

 ?? Patchs status:
 ??? 0001-eof.patch -> fixed by commit 
122e55cc354dd4a78849aed8d36c61ed9edeaeb2
 ??? 0002-link-against-libfcgi-la.patch -> included in commit 
2a575066bcbdadfc161d46ef816a45f6edf9d529
 ??? 0004-make-autoreconfable.patch -> fixed in commits 
854643b36e87cf1262da2eb82b3f10b56185131b and 
ad30485fa12be4415d57422702ee4f64a09b7bea
 ??? 0006-fix-CVE-2012-6687.patch -> applied in commit 
5c15a7bb5260bc83715090c9fd386d704c13967

>> diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
>> index 98aa2ecf8f..9c82bf1085 100644
>> --- a/package/libfcgi/libfcgi.hash
>> +++ b/package/libfcgi/libfcgi.hash
>> @@ -1,3 +1,3 @@
>>   # Locally calculated
>> -sha256	66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9	fcgi-2.4.0.tar.gz
>> +sha256	180ba6148fc56fedf60132600bdc444a5faf0618b1fede4d6462289b5d4cafff	libfcgi-2.4.2.tar.gz
> Are you sure about this hash ? Because when I applied your patch and
> try to build, I get:
>
> ERROR: libfcgi-2.4.2.tar.gz has wrong sha256 hash:
> ERROR: expected: 180ba6148fc56fedf60132600bdc444a5faf0618b1fede4d6462289b5d4cafff
> ERROR: got     : 1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc
Indeed, sorry for that. I checked it, but one way or another, I did not 
submit the checked patch.
> Also, did you try building the reverse dependencies of libfcgi after
> this version bump? There's only 3 reverse dependencies, so it should be
> pretty easy to do a quick build. For example this defconfig:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_WSAPI_FCGI=y
> BR2_PACKAGE_BOINC=y
> BR2_PACKAGE_FCGIWRAP=y
> # BR2_TARGET_ROOTFS_TAR is not set
Done ! (build passed)
>
> Thanks!
>
> Thomas

I'm submitting a new patch

Louis
