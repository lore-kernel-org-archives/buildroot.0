From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 15:57:45 +0200
Subject: [Buildroot] [PATCH 2/3] cmake: add documentation about how it
	is built
In-Reply-To: <1467388410-28135-3-git-send-email-luca@lucaceresoli.net>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <695946c9-509a-9e19-2cf8-bf9e7e967197@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-07-16 17:53, Luca Ceresoli wrote:
> Commit 7b17bafc5d7948aff3059e058ada80ad1fc50500 by Davide Viti has a
> detailed explanation of some unusual techniques used for building
> host-cmake and (target-)cmake. This is useful information for whoever
> starts hacking on it, so copy it in the makefile, where it will be
> easily noticed.
> 
> Also remove the sentence about host-cmake having a runtime dependency
> on host-pkgconfig (not true anymore: it's the specific cmake-packages
> that depend on it) and fix typos.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Davide Viti <zinosat@tiscali.it>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cmake/cmake.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 33fb4aa..d734e03 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -10,6 +10,18 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3c
>  CMAKE_LICENSE_FILES = Copyright.txt
>  
> +# CMake is a particular package:
> +# * CMake can be built using the generic infrastructure or the cmake one.
> +#   Since Buildroot has no requirement regarding the host system cmake
> +#   program presence, it uses the generic infrastructure to build the
> +#   host-cmake package, then the (target-)cmake package can be built
> +#   using the cmake infrastructure;
> +# * CMake bundles its dependencies within its sources. This is the
> +#   reason why the host-cmake package has no dependencies:, whereas
> +#   the (target-)cmake package has a lot of dependencies, using only
> +#   the system-wide libraries instead of rebuilding and statically
> +#   linking with the ones bundled into the CMake sources.
> +
>  HOST_CMAKE_DEPENDENCIES =
>  CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
