From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 11 Jun 2016 17:22:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/cmake: with BR2_ENABLE_DEBUG
	use RelWithDebInfo
In-Reply-To: <20160611161913.5ad9765f@free-electrons.com>
References: <1463861314-15547-1-git-send-email-ckhardin@exablox.com>
 <20160611161913.5ad9765f@free-electrons.com>
Message-ID: <CAHXCMMJrKaCxTSh1psSfDHF6_S2XtHwLA32SBbQGWs2HVGTToA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jun 11, 2016 at 4:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Samuel,
>
> Please review/ack this patch if appropriate.
>
> If there is no feedback in the next days, I'll assume it's good and
> I'll apply.

Ooops, I missed this patch :-/
>
> Thanks,
>
> Thomas
>
> On Sat, 21 May 2016 13:08:34 -0700, Charles Hardin wrote:
>> From the documentation on BR2_ENABLE_DEBUG, the intention is to get
>> a build with debug symbols and not a "debug build" since that can have
>> the unintended consequence of being a different code path then a
>> release build type definition.
>>
>> Switch the "Debug" to "RelWithDebInfo" in the cmake package support
>> to accomodate getting the debug symbols and still be a release
>> build.
>>

By default CMake sets the CFLAGS like this:
CMAKE_C_FLAGS_DEBUG=-g
CMAKE_C_FLAGS_RELWITHDEBINFO=-O2 -g -DNDEBUG
CMAKE_C_FLAGS_RELEASE=-O3 -DNDEBUG

I do not see what could be wrong with this patch, hence:
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

>> Signed-off-by: Charles Hardin <ckhardin@exablox.com>
>> ---
>>  package/pkg-cmake.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
>> index 81dcfcc..bca3603 100644
>> --- a/package/pkg-cmake.mk
>> +++ b/package/pkg-cmake.mk
>> @@ -87,7 +87,7 @@ define $(2)_CONFIGURE_CMDS
>>       PATH=$$(BR_PATH) \
>>       $$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
>>               -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
>> -             -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
>> +             -DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),RelWithDebInfo,Release) \
>>               -DCMAKE_INSTALL_PREFIX="/usr" \
>>               -DCMAKE_COLOR_MAKEFILE=OFF \
>>               -DBUILD_DOC=OFF \
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Regards,

-- 
Samuel
