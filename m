From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:57:49 +0200
Subject: [Buildroot] [PATCH v2] pacakge/qt5/qt5base: fix build with
 ccache
In-Reply-To: <1440755211-46875-1-git-send-email-benoit@wsystem.com>
References: <1440755211-46875-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150828115749.6e4b4481@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 28 Aug 2015 11:46:51 +0200, Beno?t Th?baudeau wrote:

> +diff --git a/mkspecs/features/device_config.prf b/mkspecs/features/device_config.prf
> +index cd3a0cf..eee4ac6 100644
> +--- a/mkspecs/features/device_config.prf
> ++++ b/mkspecs/features/device_config.prf
> +@@ -19,10 +19,15 @@ defineTest(deviceSanityCheckCompiler) {
> +     else: \
> +         sfx =
> + 
> ++    # Build the compiler filename using the first value in QMAKE_CXX in order to
> ++    # support tools like ccache, which give QMAKE_CXX values of the form:
> ++    #     ccache <path_to_compiler>
> ++    compiler = $$first(QMAKE_CXX)$$sfx

Then wouldn't it make more sense to use the last() function, to use the
last value rather than the first, and actual check the compiler rather
than ccache?

	compiler = $$last(QMAKE_CXX)$$sfx

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
