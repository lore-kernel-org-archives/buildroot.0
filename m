From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 21:29:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix static build with
 atomic
In-Reply-To: <CAPi7W81OFgz-a8_Fjdvi_LrfwgkWs3KnO6MV=SAVpGjpXdjaSQ@mail.gmail.com>
References: <20190530213022.3878-1-fontaine.fabrice@gmail.com>
 <20190531164042.49667958@windsurf>
 <CAPi7W81OFgz-a8_Fjdvi_LrfwgkWs3KnO6MV=SAVpGjpXdjaSQ@mail.gmail.com>
Message-ID: <20190531212946.75199930@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 May 2019 16:54:15 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > It would be nice to not introduce a third way of doing the same
> > thing :-)  
> I know but in this case, this is the only solution that does not
> impact upstream.
> upstream choose to link through
> target_link_libraries( "${PROJECT_NAME}" libi2pd libi2pdclient
> ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY}
> ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB}
> ${CMAKE_REQUIRED_LIBRARIES})
> 
> Because of this, if we pass -latomic through CMAKE_EXE_LINKER_FLAGS or
> CMAKE_CXX_FLAGS, it'll always be placed before Boost_Libraries and all
> the other dependencies.
> I can try to find a way to fix this but I didn't take time to do so as
> it was quicker to just use CMAKE_REQUIRED_LIBRARIES.

Shouldn't we find a canonical way of adding the -latomic dependency
handling directly in the CMakeLists.txt files of all those packages ?
Ultimately, this should be the right thing to do, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
