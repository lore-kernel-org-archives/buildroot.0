From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:20:48 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: bump to version 3.2.2
In-Reply-To: <20181010180332.30331-1-fontaine.fabrice@gmail.com>
References: <20181010180332.30331-1-fontaine.fabrice@gmail.com>
Message-ID: <20181010212048.2f8651bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 20:03:32 +0200, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Move to cmake infrastructure because AC_RUN_IFELSE was added to
>   configure
> - Remove --with-icu, --with-gnu-ld and --with-curl options (not
>   available in cmake)
> - Replace --enable-netaccessor-curl by -Dnetwork-accessor=curl
> - Replace --enable-threads option by -Dthreads
> - Update XERCES_DISABLE_SAMPLES for cmake
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied, but...

>  define XERCES_DISABLE_SAMPLES
> -	$(SED) 's/ samples//' $(@D)/Makefile.in
> +	$(SED) 's/add_subdirectory(samples)//' $(@D)/CMakeLists.txt
>  endef

... it would be good to replace this with a patch, making the build of
samples conditional, and submit it upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
