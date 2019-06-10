From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jun 2019 00:33:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/gerbera: add upstream patch to
 fix find_program with taglib-config
In-Reply-To: <20190610212023.9483-3-joerg.krause@embedded.rocks>
References: <20190610212023.9483-1-joerg.krause@embedded.rocks>
 <20190610212023.9483-3-joerg.krause@embedded.rocks>
Message-ID: <e198cc50-3e78-b2df-ccc1-269af7fad363@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 23:20, J?rg Krause wrote:
[snip]
> ++            if (CMAKE_CROSSCOMPILING)
> ++              set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)

 Again, this is wrong IMO. The executables in the sysroot are not supposed to be
executed on the host.

 What we really should do is to copy those config scripts to some other
location, and add that to the PATH.

 Besides, I think gerbera should be using the .pc file rather than the
taglib-config script.

 Moreover, I think taglib should install a TaglibConfig.cmake file so CMake
packages like gerbera can pick that up directly rather than having to write a
FindTaglib file.

 Regards,
 Arnout

> ++            endif(CMAKE_CROSSCOMPILING)
> +             find_program(TAGLIBCONFIG_EXECUTABLE NAMES taglib-config PATHS
> + 		   ${BIN_INSTALL_DIR}
> +             )
> +-- 
> +2.22.0
> +
> 
