From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Mon, 21 May 2018 06:13:19 +0000
Subject: [Buildroot] [PATCH 1/4] protobuf,
 python-protobuf: bump to v3.5.1
In-Reply-To: <20180521060246.45obl4s3spfix32y@sapphire.tkos.co.il>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
 <20180521053508.z5r7euisuak4ibgh@sapphire.tkos.co.il>
 <F5585DF4-A2FF-4B78-B226-808AD12B57EE@storagecraft.com>
 <20180521060246.45obl4s3spfix32y@sapphire.tkos.co.il>
Message-ID: <E7DCA461-B403-49F9-A6F6-6EEA52465205@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MSFT/Mimecast email filters in the cloud - not the client, it is very annoying. Have
not figured out a way to bypass yet. Corporate email policies are not always the
easiest thing to deal with.

> On May 20, 2018, at 11:02 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> Hi Charles,
> 
> Please teach your email client (Outlook?) to do proper quoting on the 
> plaintext multipart alternative of your email. If you can avoid HTML email 
> entirely that would be be best.
> 
> My comment is inline below.
> 
> On Mon, May 21, 2018 at 05:51:47AM +0000, Charles Hardin wrote:
>> Inline.
>> 
>> On May 20, 2018, at 10:35 PM, Baruch Siach <baruch at tkos.co.il<mailto:baruch@tkos.co.il>> wrote:
>> 
>> Hi Charles,
>> 
>> On Sun, May 20, 2018 at 10:05:47PM -0700, charles.hardin at storagecraft.com<mailto:charles.hardin@storagecraft.com> wrote:
>> From: Charles Hardin <charles.hardin at storagecraft.com<mailto:charles.hardin@storagecraft.com>>
>> 
>> Also, add a patch to compile for mips big endian
>> in addition to mips little endian.
>> 
>> Signed-off-by: Charles Hardin <charles.hardin at storagecraft.com<mailto:charles.hardin@storagecraft.com>>
>> ---
>> package/protobuf/0001-convert-mipsel-to-mips.patch | 12 ++++++++++++
>> package/protobuf/protobuf.hash                     |  2 +-
>> package/protobuf/protobuf.mk                       |  6 +++---
>> 3 files changed, 16 insertions(+), 4 deletions(-)
>> create mode 100644 package/protobuf/0001-convert-mipsel-to-mips.patch
>> 
>> diff --git a/package/protobuf/0001-convert-mipsel-to-mips.patch b/package/protobuf/0001-convert-mipsel-to-mips.patch
>> new file mode 100644
>> index 0000000000..005d818d9d
>> --- /dev/null
>> +++ b/package/protobuf/0001-convert-mipsel-to-mips.patch
>> @@ -0,0 +1,12 @@
>> +diff -Naur protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h
>> +--- protobuf-3.5.1.orig/src/google/protobuf/stubs/platform_macros.h 2017-12-20 23:07:13.000000000 +0000
>> ++++ protobuf-3.5.1/src/google/protobuf/stubs/platform_macros.h 2018-05-21 03:46:58.580000399 +0000
>> 
>> Patched need a description and your sign-off.
>> 
>> What is the upstream status of this patch? Please indicate in the patch
>> description.
>> 
>> I just did this locally with no git - there is no upstream, it was just for a local build
>> against Cavium. So, it would be nice if people upstream actually did mips - but
>> they don?t...
> 
> In upstream I meant the Protobuf project upstream which seems to be pretty 
> much alive and active. Have you sent this patch upstream? If so, please add a 
> link to your submission in the patch description.
> 
> baruch
> 
>> +@@ -56,7 +56,7 @@
>> + #elif defined(__aarch64__)
>> + #define GOOGLE_PROTOBUF_ARCH_AARCH64 1
>> + #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
>> +-#elif defined(__MIPSEL__)
>> ++#elif defined(__mips__)
>> + #if defined(__LP64__)
>> + #define GOOGLE_PROTOBUF_ARCH_MIPS64 1
>> + #define GOOGLE_PROTOBUF_ARCH_64_BIT 1
>> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
>> index fa02440a40..d86f9758f3 100644
>> --- a/package/protobuf/protobuf.hash
>> +++ b/package/protobuf/protobuf.hash
>> @@ -1,2 +1,2 @@
>> # Locally calculated
>> -sha256 2bb34b4a8211a30d12ef29fd8660995023d119c99fbab2e5fe46f17528c9cc78 protobuf-cpp-3.4.1.tar.gz
>> +sha256 826425182ee43990731217b917c5c3ea7190cfda141af4869e6d4ad9085a740f  protobuf-v3.5.1.tar.gz
>> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
>> index d2782ddcfd..6120d6030d 100644
>> --- a/package/protobuf/protobuf.mk
>> +++ b/package/protobuf/protobuf.mk
>> @@ -7,11 +7,11 @@
>> # When bumping this package, make sure to also verify if the
>> # python-protobuf package still works, as they share the same
>> # version/site variables.
>> -PROTOBUF_VERSION = 3.4.1
>> -PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>> -PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
>> +PROTOBUF_VERSION = v3.5.1
>> +PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
>> 
>> Why are you switching to git fetch? We prefer tarballs whenever upstream
>> provides them which is the case here.
>> 
>> 
>> Because I was pulling a specific commit before there was a release? it happens...
>> 
>> PROTOBUF_LICENSE = BSD-3-Clause
>> PROTOBUF_LICENSE_FILES = LICENSE
>> +PROTOBUF_AUTORECONF = YES
>> 
>> Upstream tarball includes a pre-generated configure script, so this should not
>> be needed.
>> 
>> 
>> Switch to GitHub is a flip to build from source - so?. if this is a release tarsal, then this
>> isn?t needed.
>> 
>> # N.B. Need to use host protoc during cross compilation.
>> PROTOBUF_DEPENDENCIES = host-protobuf
>> 
>> baruch
> 
> -- 
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> 
