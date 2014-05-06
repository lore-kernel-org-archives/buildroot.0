From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 May 2014 13:40:26 +0100
Subject: [Buildroot] [PATCH] clapack: Disable for MIPS platforms
In-Reply-To: <CAAXf6LWP_cC8G4UHn4TD_FL0awpgvCqmE-XksAbwTfSJCy7gfw@mail.gmail.com>
References: <1399374660-25341-1-git-send-email-Vincent.Riera@imgtec.com>
 <CAAXf6LWP_cC8G4UHn4TD_FL0awpgvCqmE-XksAbwTfSJCy7gfw@mail.gmail.com>
Message-ID: <5368D83A.7010700@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2014 12:52 PM, Thomas De Schampheleire wrote:
> Hi Vicente,
>
> On Tue, May 6, 2014 at 1:11 PM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
>> Disable this package for MIPS because it needs IRIX headers and
>> libraries.
>>
>> Fixes:
>>     http://autobuild.buildroot.net/results/370/370f964441722675820c644403dde7fbc683a315/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
>> ---
>>   package/armadillo/Config.in |    1 +
>>   package/clapack/Config.in   |    1 +
>>   2 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
>> index 2251d91..0b86b77 100644
>> --- a/package/armadillo/Config.in
>> +++ b/package/armadillo/Config.in
>> @@ -5,6 +5,7 @@ config BR2_PACKAGE_ARMADILLO
>>          bool "armadillo"
>>          depends on BR2_INSTALL_LIBSTDCPP
>>          depends on BR2_LARGEFILE # clapack
>> +       depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
>>          select BR2_PACKAGE_CLAPACK
>>          help
>>            Armadillo: An Open Source C++ Linear Algebra Library for
>> diff --git a/package/clapack/Config.in b/package/clapack/Config.in
>> index a77094f..95dd343 100644
>> --- a/package/clapack/Config.in
>> +++ b/package/clapack/Config.in
>> @@ -1,6 +1,7 @@
>>   config BR2_PACKAGE_CLAPACK
>>          bool "cblas/clapack"
>>          depends on BR2_LARGEFILE
>> +       depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
>>          help
>>            BLAS and LAPACK C implementation (f2c'ed version of).
>>
>
> These dependencies should also be added to the respective comment lines, see
> http://buildroot.uclibc.org/downloads/manual/manual.html#dependencies-target-toolchain-options
>
> "The comment should only be visible if the config option itself would
> be visible when the toolchain option dependencies are met. This means
> that all other dependencies of the package (including dependencies on
> target architecture and MMU support) have to be repeated on the
> comment definition. To keep it clear, the depends on statement for
> these non-toolchain option should be kept separate from the depends on
> statement for the toolchain options. If there is a dependency on a
> config option in that same file (typically the main package) it is
> preferable to have a global if ? endif construct rather than repeating
> the depends on statement on the comment and other config options."
>
> Best regards,
> Thomas
>

Hi Thomas,

it wasn't me who put the "depends on BR2_LARGEFILE" in that package. 
Anyway, I will add that fix to my patch.

Cheers,

-- 
Vincent
