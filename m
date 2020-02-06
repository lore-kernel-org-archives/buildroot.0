From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2020 11:51:44 +0100
Subject: [Buildroot] [PATCH 2/6 v2] package/linux-headers: license files
 hashes only valid for latest version
In-Reply-To: <88a204c7db99f603e33f079b7d24017f2446865e.1580914115.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 5 Feb 2020 15:48:39 +0100")
References: <cover.1580914115.git.yann.morin.1998@free.fr>
 <88a204c7db99f603e33f079b7d24017f2446865e.1580914115.git.yann.morin.1998@free.fr>
Message-ID: <878slgugxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Like we did on the previous commit, change linux-headers to only check
 > the license hashes for the latest known version.

 > To simplify the test, we introduce an intermediate, blind option that get
 > selected by the two latest versions.

It is not really for the TWO latest versions, just the two ways we have
of using the latest kernel headers.

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Markus Mayer <mmayer@broadcom.com>
 > ---
 >  package/linux-headers/Config.in.host   | 6 ++++++
 >  package/linux-headers/linux-headers.mk | 7 ++++++-
 >  2 files changed, 12 insertions(+), 1 deletion(-)

 > diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 > index 9f46a1052b..7a68ab7492 100644
 > --- a/package/linux-headers/Config.in.host
 > +++ b/package/linux-headers/Config.in.host
 > @@ -25,6 +25,7 @@ choice
 >  config BR2_KERNEL_HEADERS_AS_KERNEL
 >  	bool "Same as kernel being built"
 >  	depends on BR2_LINUX_KERNEL
 > +	select BR2_KERNEL_HEADERS_LATEST if BR2_LINUX_KERNEL_LATEST_VERSION
 
 >  config BR2_KERNEL_HEADERS_4_4
 >  	bool "Linux 4.4.x kernel headers"
 > @@ -52,6 +53,7 @@ config BR2_KERNEL_HEADERS_4_19
 >  config BR2_KERNEL_HEADERS_5_4
 >  	bool "Linux 5.4.x kernel headers"
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 > +	select BR2_KERNEL_HEADERS_LATEST
 
 >  config BR2_KERNEL_HEADERS_VERSION
 >  	bool "Manually specified Linux version"
 > @@ -83,6 +85,10 @@ config BR2_KERNEL_HEADERS_CUSTOM_GIT
 
 >  endchoice
 
 > +# Select this for the latest kernel headers ersion (for licenses hashes)

s/ersion/version/

Fixed that and reworded the commit message a bit and committed, thanks.

-- 
Bye, Peter Korsgaard
