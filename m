From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:53:19 +0100
Subject: [Buildroot] [PATCH v2] package/pkg-cmake.mk: add ccache support
 for host packages
In-Reply-To: <1418584321-10788-1-git-send-email-s.martin49@gmail.com>
References: <1418584321-10788-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141221225319.12501d7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 14 Dec 2014 20:12:01 +0100, Samuel Martin wrote:
> This ccache support for host-cmake-package uses the same logic as the
> one done for the target packages in the toolchainfile.cmake file.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Seriously, do you test your patches before sending them?

> +# Set compiler variables.
> +ifeq ($(BR2_CCACHE),y)
> +CMAKE_HOST_C_COMPILER="$(HOST_DIR)/usr/bin/ccache"
> +CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
> +CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC)"

This should have been HOSTCC_NOCCACHE.

> +CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX)"

This should have been HOSTCXX_NOCCACHE.

Otherwise, HOSTCC and HOSTCXX already contains
"$(HOST_DIR)/usr/bin/ccache /usr/bin/gcc".


> +		-DCMAKE_C_COMPILER="$$(CMAKE_HOST_C_COMPILER) \

Missing closing double quote.

> +		-DCMAKE_C_COMCXX_COMPILER="$$(CMAKE_HOST_CXX_COMPILER) \

Really C_COMCXX_COMPILER ?

This was really a completely crappy and untested patch. How do you want
us to trust your future submissions if you submit such things?

I've applied after fixing this mess.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
