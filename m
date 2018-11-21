From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Wed, 21 Nov 2018 07:48:03 +0100
Subject: [Buildroot] [PATCH v3 1/6] package/compiler-rt: new package
In-Reply-To: <1542595067-45972-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1542595067-45972-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <7d364b6a-3c2a-735d-0f6e-5108b99a9767@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

> This patch adds support for the compiler-rt (CLANG runtime) library.
> It builds a set of static libraries and installs them into the
> CLANG/LLVM toolchain resource folder.
>
> Signed-off-by: Matthew Weber<matthew.weber@rockwellcollins.com>
> Cc: Romain Naour<romain.naour@smile.fr>
> Cc: Ricardo Martincoski<ricardo.martincoski@gmail.com>
> ---
> Changes
> v1 -> v2
> [Romain
>   - Removed unnecessary host-cmake dependency
>
> v2 -> v3
> [Romain
>   - Update to use COMPILER_RT_INSTALL_PATH for library install
> [Ricardo
>   - Fixed check-package extra line
>   - Spelling in commit message
> ---

I've just tried to build compiler-rt for arm with uclibc and got the following:

buildroot/test/build/compiler-rt-7.0.0/lib/interception/interception_linux.cc:
In function ?void* __interception::GetFuncAddrVer(const char*, const char*)?:
buildroot/test/build/compiler-rt-7.0.0/lib/interception/interception_linux.cc:48:10: error:
?dlvsym? was not declared in this scope
  return dlvsym(RTLD_NEXT, func_name, ver);
           ^~~~~~
buildroot/test/build/compiler-rt-7.0.0/lib/interception/interception_linux.cc:48:10: note:
suggested alternative: ?dlsym?
return dlvsym(RTLD_NEXT, func_name, ver);
        ^~~~~~
        dlsym


buildroot/test/build/compiler-rt-7.0.0/lib/sanitizer_common/sanitizer_platform_limits_posix.cc:141:10:
fatal error: obstack.h: No such file or directory
  #include <obstack.h>
           ^~~~~~~~~~~
compilation terminated.


It seems we depend on glibc, haven't tried with musl yet.

Best regards,

Valentin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181121/1cf3e183/attachment.html>
