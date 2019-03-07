From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:31:42 +0100
Subject: [Buildroot] [PATCH v3] package/optee-*: packages depend on
 thread support
In-Reply-To: <1551973528-5130-1-git-send-email-etienne.carriere@linaro.org>
References: <17603738bfac0de04a1de57a562dbde2a572d926.1551944208.git.etienne.carriere@linaro.org>
 <1551973528-5130-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <20190307223142.2fb09608@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Thu,  7 Mar 2019 16:45:28 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> BR2_PACKAGE_OPTEE_CLIENT depends on BR2_TOOLCHAIN_HAS_THREADS.
> Library teec uses pthread support to protect clients state
> management.
> 
> This change declares this dependency in package optee-client and
> updates dependent packages accordingly: optee-benchmark,
> optee-client, optee-examples and optee-test.
> 
> Fixes [1] and [2] where config selected an toolchain without thread
> support and build failed with trace like:
> 
>   CMake Error at /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>     Could NOT find Threads (missing: Threads_FOUND)
>   Call Stack (most recent call first):
>     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindPackageHandleStandardArgs.cmake:377 (_FPHSA_FAILURE_MESSAGE)
>     /home/buildroot/autobuild/run/instance-1/output/host/share/cmake-3.8/Modules/FindThreads.cmake:212 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>     libteec/CMakeLists.txt:8 (find_package)
> 
> [1] http://autobuild.buildroot.net/results/ed6ffe2197da4f3a970bd3c5522291236396cc8e
> [2] http://autobuild.buildroot.net/results/406f90048db097580b626ef889823132f8676ba1
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
> Changes v2 -> v3:
>   - Squash v2 series into a single patch.
>   - Update config comment for unmet dependencies.

Applied to master after fixing the dependencies of the Config.in
comment entries, as noticed by Baruch (thanks for the review!).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
