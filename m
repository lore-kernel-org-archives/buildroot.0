From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:47:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with
 protobuf and gcc < 6
In-Reply-To: <20201226102500.351912-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Dec 2020 11:25:00 +0100")
References: <20201226102500.351912-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1nb9x8l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the folloing build failure with protobuf (enabled since commit
 > 31c68a449ecd7da61ecfd909bea7ce799f9a6450) and gcc 5.3.0:

 > [ 53%] Building CXX object modules/dnn/CMakeFiles/opencv_dnn.dir/opencv-caffe.pb.cc.o
 > In file included from /home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/atomic:38:0,
 >                  from /home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/google/protobuf/io/coded_stream.h:115,
 >                  from /home/peko/autobuild/instance-1/output-1/build/opencv3-3.4.12/buildroot-build/modules/dnn/opencv-caffe.pb.h:23,
 >                  from /home/peko/autobuild/instance-1/output-1/build/opencv3-3.4.12/buildroot-build/modules/dnn/opencv-caffe.pb.cc:4:
 > /home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 >  #error This file requires compiler and library support \
 >   ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7caf175af039054a032b8f63b458b3940d9ec0f3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
