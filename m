From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 18:58:14 +0200
Subject: [Buildroot] [PATCH 2/2] cmake: bump version to 3.8.0
In-Reply-To: <20170418154815.51039-2-Vincent.Riera@imgtec.com>
References: <20170418154815.51039-1-Vincent.Riera@imgtec.com>
 <20170418154815.51039-2-Vincent.Riera@imgtec.com>
Message-ID: <caa93bc4-4583-29db-e02d-4c2012ef9859@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-17 17:48, Vicente Olivert Riera wrote:
[snip]
> @@ -22,7 +22,7 @@ CMAKE_LICENSE_FILES = Copyright.txt
>  #   the system-wide libraries instead of rebuilding and statically
>  #   linking with the ones bundled into the CMake sources.
>  
> -CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv
> +CMAKE_DEPENDENCIES = zlib jsoncpp libcurl libarchive expat bzip2 xz libuv librhash

 This is weird: cmake depends on librhash, but host-cmake doesn't?

 Ah, of course, it's because cmake bundles its dependencies, and we use the
bundled versions for host but not for target. Would be good to make that
explicit in the commit message.

 Regards,
 Arnout

>  
>  CMAKE_CONF_OPTS = \
>  	-DKWSYS_LFS_WORKS=TRUE \

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
