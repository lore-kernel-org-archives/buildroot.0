From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 29 Apr 2020 07:37:37 -0500
Subject: [Buildroot] [PATCH] package/cunit: switch to maintain fork
 version 3.2.6
In-Reply-To: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
References: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
Message-ID: <CAMQcK5L1raaxnJGOkU7tO+w9Uf7UaOPcNx8udrvGk2R4ySURkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Apr 28, 2020 at 5:10 PM Ryan Barnett
<ryan.barnett@rockwellcollins.com> wrote:
>
> The CUnit project on Sourgeforce has not been maintained since 2014.
> Switch to forked version on Gitlab which is under active development
> at:
>
>   https://gitlab.com/cunity/cunit#new-releases-of-cunit-2018-08-onwards
>
> Changes which were made to the package include:
>
>  * Switch to CMake build system
>  * Requires BR2_USE_MMU for '-rdynamic' (CMake test)
>  * Requires C++ for CUnit/Sources/wxWidget/wxWidget.cpp
>  * Update hash format to two spaces
>  * Add patch to resolve issue with unused variable with assert to
>    allow compiling with GCC 8
>  * Add patch to optionally build test and examples (turn off for
>    buildroot)
>  * Add myself to DEVELOPERS for this package
>
> Tested with ./utils/test-pkg -c cunit.config -p cunit:
>
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed
>
> Checked with check-package:
>
> $ ./utils/check-package package/cunit/*
> 192 lines processed
> 0 warnings generated
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  DEVELOPERS                                    |   1 +
>  ...n-remove-variable-only-used-in-asser.patch |  45 +++++++
>  ...dd-optional-builds-of-tests-examples.patch | 114 ++++++++++++++++++
>  package/cunit/Config.in                       |  10 +-
>  package/cunit/cunit.hash                      |   4 +-
>  package/cunit/cunit.mk                        |  15 +--
>  6 files changed, 178 insertions(+), 11 deletions(-)
>  create mode 100644 package/cunit/0001-Framework-TestRun-remove-variable-only-used-in-asser.patch
>  create mode 100644 package/cunit/0002-CMakeLists-add-optional-builds-of-tests-examples.patch

I'm going to mark these as changes requested as it appears that
upstream is going to make more changes in regards to supporting
building without tests or examples:

https://gitlab.com/cunity/cunit/-/merge_requests/58

Will send v2 when these changes are merged.

Thanks,
-Ryan
