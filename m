From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Apr 2019 23:10:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-04-11
In-Reply-To: <e49bfd0c-270c-77fb-0b18-04722b971c41@gmail.com>
References: <5cb02982.1c69fb81.f3887.2c53SMTPIN_ADDED_MISSING@mx.google.com>
 <e49bfd0c-270c-77fb-0b18-04722b971c41@gmail.com>
Message-ID: <3c3e02ff-b257-0225-7360-8d8ed4b3e10c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2019 22:15, Valentin Korenblit wrote:
> Hi Thomas,
> 
>> Results for the 'master' branch
>> ===============================
>>
>> Build failures related to your packages:
>>
>> ???????? i586 |??????????????? host-llvm-8.0.0 |
>> http://autobuild.buildroot.net/results/0c046a1b57a4f0b992333003d41062e1b256eb0d
> 
> Should we require gcc 5.1 or do we add LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN
> and wait until next version ?
> 
> -- Detecting CXX compile features - done
> CMake Error at cmake/modules/CheckCompilerVersion.cmake:40 (message):
> ? Host GCC version should be at least 5.1 because LLVM will soon use new C++
> ? features which your toolchain version doesn't support.? Your version is
> ? 4.8.2.? You can temporarily opt out using
> ? LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN, but very soon your toolchain won't be
> ? supported.

 That is an extremely stupid error...

 So, now we should set LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN, and as soon as it
really requires GCC 5.1, we'll have to make llvm depend on BR2_HOST_GCC_AT_LEAST_5.

 Regards,
 Arnout


> Call Stack (most recent call first):
> ? cmake/modules/CheckCompilerVersion.cmake:45 (check_compiler_version)
> ? cmake/config-ix.cmake:13 (include)
> ? CMakeLists.txt:590 (include)
> 
> Best regards,
> 
> Valentin
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
