From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 29 Jun 2017 22:34:43 +0530
Subject: [Buildroot] : gstreamer-imx issue with missing VP8 decoder
In-Reply-To: <CAOMZO5C=4hWHfeDVK+fmAP9bp1akQ-J01z5WAeK=r9GzG39g_A@mail.gmail.com>
References: <CAMty3ZBK15PiFMmxp3D6vB9wukXzVgds4z4zoNSg=6cOTT-0PA@mail.gmail.com>
 <CAOMZO5CvVSM0zZpnPfa2i9e289KVuQqN0Xu_9iDWYA2pmw-PyA@mail.gmail.com>
 <CAD6G_RRAsBWnWcTEcFaHmssnqqfwStkWZtGB=tgWT_ocevf_qQ@mail.gmail.com>
 <CAOMZO5C=4hWHfeDVK+fmAP9bp1akQ-J01z5WAeK=r9GzG39g_A@mail.gmail.com>
Message-ID: <CAD6G_RT4V7evd7nxBo5thc+ysfmwqff5J7tZew+ZgR_=K5=-GQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Thu, Jun 29, 2017 at 8:49 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Jun 29, 2017 at 12:18 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>
>> Mainline kernel
>
> In this case you don't need the gstreamer-imx package. You should use
> the standard Gstreamer packages instead.

OK, now I moved with Gsteamer.

Now I'm observing  an Error while playbin

Log:
----
# gst-launch-1.0 playbin  uri=file:///root/tears_of_steel_1080p.webm
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
ERROR: from element
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstTypeFindElement:typefind:
Stream contains no data.
Additional debug info:
gsttypefindelement.c(1126): gst_type_find_element_loop ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/GstTypeFindElement:typefind:
Can't typefind empty stream
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Freeing pipeline ...

Same file is launching well, on Ubuntu.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
