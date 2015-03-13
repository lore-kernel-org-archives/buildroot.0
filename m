From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:53:38 +0100
Subject: [Buildroot] [PATCH v7 3/3] GNURadio: new package
In-Reply-To: <1426235050-3482-3-git-send-email-gwenj@trabucayre.com>
References: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
 <1426235050-3482-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150313225338.3f2c4796@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 13 Mar 2015 09:24:10 +0100, Gwenhael Goavec-Merou wrote:

> +Index: gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/cmake/VolkBoost.cmake
> ++++ gnuradio-3.7.5/volk/cmake/VolkBoost.cmake
> +@@ -29,7 +29,6 @@ set(__INCLUDED_VOLK_BOOST_CMAKE TRUE)
> + set(BOOST_REQUIRED_COMPONENTS
> +     filesystem
> +     system
> +-    unit_test_framework

It will probably be needed to re-add this unit_test_framework
dependency, but maybe only if BUILD_TEST is enabled, or something like
that.

> +     program_options
> + )
> + 
> +Index: gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +===================================================================
> +--- gnuradio-3.7.5.orig/volk/lib/CMakeLists.txt
> ++++ gnuradio-3.7.5/volk/lib/CMakeLists.txt
> +@@ -540,8 +540,9 @@ endif(ENABLE_STATIC_LIBS)
> + # Build the QA test application
> + ########################################################################
> + 
> ++find_package(Boost "1.35" COMPONENTS "unit_test_framework")
> + 
> +-if(Boost_FOUND)
> ++if(Boost_FOUND AND BUILD_TEST)
> + 
> +     set_source_files_properties(
> +         ${CMAKE_CURRENT_SOURCE_DIR}/testqa.cc PROPERTIES
> +@@ -558,4 +559,4 @@ if(Boost_FOUND)
> +     target_link_libraries(test_all volk ${Boost_LIBRARIES})
> +     add_test(qa_volk_test_all test_all)
> + 
> +-endif(Boost_FOUND)
> ++endif(Boost_FOUND AND BUILD_TEST)

Can you please work with upstream to get this patch merged?


> +# host-python-cheetah is needed for volk to compile
> +GNURADIO_DEPENDENCIES = \
> +		host-python-cheetah \
> +		host-swig \
> +		boost

Indentation should be only one tab.

> +GNURADIO_CONF_OPTS = \
> +		-DENABLE_DEFAULT=OFF \
> +		-DENABLE_VOLK=ON \
> +		-DENABLE_GNURADIO_RUNTIME=ON

Ditto.

Committed with the indentation fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
