From: Parsa Panahi <panahi.parsa@paravisioner.com>
Date: Tue, 22 Apr 2014 13:00:17 +0430
Subject: [Buildroot] OpenCV compilation Error
Message-ID: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Hi 

I checked opencv to be included in my kernel but When I make the
buildroot it gives the following error for the opencv package. 

It seems it didn't find the gcc/cmake cannot compile the package. what's
wrong and what should I do ? 

>>> opencv 2.4.2 Configuring
(cd
/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/
&& rm -f CMakeCache.txt &&
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/cmake
/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/
-DCMAKE_TOOLCHAIN_FILE="/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/share/buildroot/toolchainfile.cmake"
-DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF
-DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Debug
-DBUILD_WITH_STATIC_CRT=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF
-DBUILD_PACKAGE=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=ON
-DBUILD_WITH_DEBUG_INFO=OFF -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF
-DCMAKE_SKIP_RPATH=OFF -DCMAKE_USE_RELATIVE_PATHS=OFF
-DENABLE_FAST_MATH=ON -DENABLE_NOISY_WARNINGS=OFF
-DENABLE_OMIT_FRAME_POINTER=ON -DENABLE_PRECOMPILED_HEADERS=OFF
-DENABLE_PROFILING=OFF -DENABLE_SOLUTION_FOLDERS=OFF
-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
-DBUILD_opencv_androidcamera=OFF -DBUILD_opencv_calib3d=ON
-DBUILD_opencv_contrib=ON -DBUILD_opencv_core=ON
-DBUILD_opencv_features2d=ON -DBUILD_opencv_flann=ON
-DBUILD_opencv_gpu=OFF -DBUILD_opencv_highgui=ON
-DBUILD_opencv_imgproc=ON -DBUILD_opencv_java=OFF
-DBUILD_opencv_legacy=ON -DBUILD_opencv_ml=ON -DBUILD_opencv_nonfree=OFF
-DBUILD_opencv_objdetect=ON -DBUILD_opencv_photo=ON
-DBUILD_opencv_python=OFF -DBUILD_opencv_stitching=ON
-DBUILD_opencv_ts=ON -DBUILD_opencv_video=ON -DBUILD_opencv_videostab=ON
-DBUILD_opencv_world=OFF -DENABLE_POWERPC=OFF -DENABLE_SSE=OFF
-DENABLE_SSE2=OFF -DENABLE_SSE3=OFF -DENABLE_SSSE3=OFF
-DBUILD_JASPER=OFF -DBUILD_JPEG=OFF -DBUILD_PNG=OFF -DBUILD_TIFF=OFF
-DBUILD_ZLIB=OFF -DBUILD_ANDROID_CAMERA_WRAPPER=OFF
-DBUILD_ANDROID_EXAMPLES=OFF -DBUILD_FAT_JAVA_LIB=OFF
-DBUILD_JAVA_SUPPORT=OFF -DBUILD_NEW_PYTHON_SUPPORT=OFF
-DINSTALL_ANDROID_EXAMPLES=OFF -DINSTALL_C_EXAMPLES=OFF
-DINSTALL_PYTHON_EXAMPLES=OFF -DINSTALL_TO_MANGLED_PATHS=OFF
-DWITH_1394=OFF -DWITH_ANDROID_CAMERA=OFF -DWITH_AVFOUNDATION=OFF
-DWITH_CARBON=OFF -DWITH_CUBLAS=OFF -DWITH_CUDA=OFF -DWITH_CUFFT=OFF
-DWITH_EIGEN=OFF -DWITH_IMAGEIO=OFF -DWITH_IPP=OFF -DWITH_JASPER=OFF
-DWITH_OPENEXR=OFF -DWITH_OPENGL=OFF -DWITH_OPENNI=OFF -DWITH_PVAPI=OFF
-DWITH_QUICKTIME=OFF -DWITH_TBB=OFF -DWITH_UNICAP=OFF
-DWITH_VIDEOINPUT=OFF -DWITH_XIMEA=OFF -DWITH_XINE=OFF -DWITH_FFMPEG=ON
-DWITH_GSTREAMER=OFF -DWITH_GTK=OFF -DWITH_JPEG=ON -DWITH_PNG=ON
-DWITH_QT=ON -DWITH_TIFF=ON -DWITH_V4L=OFF )
Re-run cmake no build system arguments
-- The CXX compiler identification is unknown
-- The C compiler identification is unknown
-- Check for working CXX compiler:
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++
CMake Error: your CXX compiler:
"/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
was not found. Please set CMAKE_CXX_COMPILER to a valid compiler path or
name.
CMake Error: Internal CMake error, TryCompile configure of cmake failed
-- Check for working CXX compiler:
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++
-- broken
CMake Error at
/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/share/cmake-2.8/Modules/CMakeTestCXXCompiler.cmake:54
(message):
 The C++ compiler

"/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
 is not able to compile a simple test program. 

It fails with the following output: 

CMake will not be able to correctly generate this project.
Call Stack (most recent call first):
 CMakeLists.txt:61 (project) 

CMake Error: your CXX compiler:
"/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
was not found. Please set CMAKE_CXX_COMPILER to a valid compiler path or
name.
CMake Error: your C compiler:
"/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-gcc"
was not found. Please set CMAKE_C_COMPILER to a valid compiler path or
name.
-- Configuring incomplete, errors occurred!
See also
"/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/CMakeFiles/CMakeOutput.log".
See also
"/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/CMakeFiles/CMakeError.log".
make: ***
[/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/.stamp_configured]
Error 1 
-- 

Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140422/8d25cbea/attachment.html>
