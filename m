From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 29 Jun 2017 19:08:53 +0200
Subject: [Buildroot] : gstreamer-imx issue with missing VP8 decoder
In-Reply-To: <CAD6G_RT4V7evd7nxBo5thc+ysfmwqff5J7tZew+ZgR_=K5=-GQ@mail.gmail.com>
References: <CAMty3ZBK15PiFMmxp3D6vB9wukXzVgds4z4zoNSg=6cOTT-0PA@mail.gmail.com>
 <CAOMZO5CvVSM0zZpnPfa2i9e289KVuQqN0Xu_9iDWYA2pmw-PyA@mail.gmail.com>
 <CAD6G_RRAsBWnWcTEcFaHmssnqqfwStkWZtGB=tgWT_ocevf_qQ@mail.gmail.com>
 <CAOMZO5C=4hWHfeDVK+fmAP9bp1akQ-J01z5WAeK=r9GzG39g_A@mail.gmail.com>
 <CAD6G_RT4V7evd7nxBo5thc+ysfmwqff5J7tZew+ZgR_=K5=-GQ@mail.gmail.com>
Message-ID: <CAOf5uwkwaksP5S9OiH+436ExuacQb8OgWjx4AV6_d7Vap6Rriw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi


On Jun 29, 2017 7:04 PM, "Jagan Teki" <jagannadh.teki@gmail.com> wrote:

Hi Fabio,

On Thu, Jun 29, 2017 at 8:49 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Jun 29, 2017 at 12:18 PM, Jagan Teki <jagannadh.teki@gmail.com>
wrote:
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
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/
GstTypeFindElement:typefind:
Stream contains no data.
Additional debug info:
gsttypefindelement.c(1126): gst_type_find_element_loop ():
/GstPlayBin:playbin0/GstURIDecodeBin:uridecodebin0/GstDecodeBin:decodebin0/
GstTypeFindElement:typefind:
Can't typefind empty stream
ERROR: pipeline doesn't want to preroll.
Setting pipeline to NULL ...
Freeing pipeline ...

Same file is launching well, on Ubuntu.


Problem can be in the file? Could be that you miss some element able to
decode it. GST_DEBUG can give more info

Michael


thanks!
--
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170629/7bac48cd/attachment.html>
