From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 16:14:24 +0100
Subject: [Buildroot] [PATCH v2] opencv: Replace absolute path of static
 library with -l$library_name
In-Reply-To: <1412167450-26406-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412167450-26406-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150308161424.159f95e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 1 Oct 2014 13:44:10 +0100, Vicente Olivert Riera wrote:
> Some opencv modules are forced to build statically (for instance the
> "ts" module) because they have a line like this one in their
> CMakeLists.txt file:
> 
>   set(OPENCV_MODULE_TYPE STATIC)
> 
> That makes a static library get installed and also listed in the "Libs:"
> line of the pkgconfig file (opencv.pc) along with all the shared
> libraries. That can cause link failures in other packages which link to
> opencv, for instance the gst1-plugins-bad package. Here is an example of
> the link failure:
> 
>   CXXLD    libgstopencv.la
> 
> *** Warning: Linking the shared library libgstopencv.la against the
> *** static library /usr/lib/libopencv_ts.a is not portable!
> mips-linux-gnu-g++: error: /usr/lib/libopencv_ts.a: No such file or
> directory
> make[4]: *** [libgstopencv.la] Error 1
> 
> The solution is to not list the static library in the "Libs:" line of
> the pkgconfig file and add '-lopencv_ts' instead.
> 
> This issue has been reported upstream:
>   http://code.opencv.org/issues/3931
> 
> Fixes:
>   http://autobuild.buildroot.net/results/e8a/e8a859276db34aff87ef181b0cce98916b0afc90/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Following the feedback from Samuel on this patch, I have marked it as
Rejected in patchwork. Can you work with Samuel to resubmit a proper
fix?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
