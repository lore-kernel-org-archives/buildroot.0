From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:09:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cmake: set
 CMAKE_SYSTEM_PROCESSOR correctly on powerpc64{, le}
In-Reply-To: <f05fe88f-a347-046d-2ab3-d4bd5529d938@au1.ibm.com>
References: <f05fe88f-a347-046d-2ab3-d4bd5529d938@au1.ibm.com>
Message-ID: <20170309220922.24ba50d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Mar 2017 11:57:10 +1100, Daniel Black wrote:
> Like ARM, BR2_ARCH doesn't correspond to the uname -m. With cmake
> CMAKE_SYSTEM_PROCESSOR is expected to contain the uname -m value.
> 
> So we change CMAKE_SYSTEM_PROCESSOR from powerpc64 -> ppc64 (big endian)
> and powerpc64le -> ppc64le (little endian).
> 
> This corrects the cross compile to the powerpc64{,le} target
> architecture for the mariadb (and possibly others) packages that
> use the CMAKE_SYSTEM_PROCESSOR variable and compare it against
> Power64 based architectures.
> 
> Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
> Acked-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  package/pkg-cmake.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
