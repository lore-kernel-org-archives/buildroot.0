From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:43:23 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: superres - Fix return value
	VideoFrameSource_GPU
In-Reply-To: <1415192359-52914-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 5 Nov 2014 12:59:19 +0000")
References: <1415192359-52914-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415192359-52914-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87mw81s70k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > superres module fails to compile with the following error messages:
 > [100%] Building CXX object
 > modules/superres/CMakeFiles/opencv_superres.dir/src/super_resolution.cpp.o
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp: In function
 > 'cv::Ptr<cv::superres::FrameSource>
 > cv::superres::createFrameSource_Video_GPU(const string&)':
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error:
 > expected type-specifier before 'VideoFrameSource'
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error:
 > could not convert '(int*)operator new(4ul)' from 'int*' to
 > 'cv::Ptr<cv::superres::FrameSource>'
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp:263:16: error:
 > expected ';' before 'VideoFrameSource'
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp:263:41: error:
 > 'VideoFrameSource' was not declared in this scope
 > /opencv-2.4.10/modules/superres/src/frame_source.cpp:264:1: error:
 > control reaches end of non-void function [-Werror=return-type]
 > cc1plus: some warnings being treated as errors
 > make[3]: ***
 > [modules/superres/CMakeFiles/opencv_superres.dir/src/frame_source.cpp.o]
 > Error 1
 > make[3]: *** Waiting for unfinished jobs....

 > This is caused because the return value of the
 > createFrameSource_Video_GPU function should be a VideoFrameSource_GPU
 > object.

 > Backporting an upstream patch to fix this problem in Buildroot:
 >   https://github.com/Itseez/opencv/commit/2e393ab83362743ba1825ad4b31d4a2925c606b4

 > Fixes:
 >   http://autobuild.buildroot.net/results/b09/b0996267197a9016d29d6070804ebc0cb7853548/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
