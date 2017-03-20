From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:58:48 +0100
Subject: [Buildroot] [PATCH] gst1-vaapi: fix build when Gstreamer
 debugging is disabled
In-Reply-To: <1490035980-7927-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490035980-7927-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20170320215848.6b699556@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 00:23:00 +0530, Rahul Bedarkar wrote:
> When Gstreamer debugging is disabled (BR2_PACKAGE_GSTREAMER1_GST_DEBUG)
> we get following build errors:
> 
>   gstvaapisink.c: In function 'gst_vaapisink_init':
>   gstvaapisink.c:1902:39: error: 'gst_debug_vaapisink' undeclared (first use in this function)
>   gstvaapisink.c:1902:39: note: each undeclared identifier is reported only once for each function it appears in
>   gstvaapidecode.c: In function 'gst_vaapidecode_init':
>   gstvaapidecode.c:1365:63: error: 'gst_debug_vaapidecode' undeclared (first use in this function)
>   gstvaapidecode.c:1365:63: note: each undeclared identifier is reported only once for each function it appears in
>   gstvaapipostproc.c: In function 'gst_vaapipostproc_init':
>   gstvaapipostproc.c:1811:7: error: 'gst_debug_vaapipostproc' undeclared (first use in this function)
>   gstvaapipostproc.c:1811:7: note: each undeclared identifier is reported only once for each function it appears in
> 
> Add upstream patch to fix these build issues.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/653/653d9b056b04e589b8f5c57111635b0b3d7c8949
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  ...n-debug-disabled-default-category-is-NULL.patch | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-vaapi/0002-plugins-when-debug-disabled-default-category-is-NULL.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
