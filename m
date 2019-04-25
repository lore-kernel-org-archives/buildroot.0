From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 25 Apr 2019 11:38:21 -0400
Subject: [Buildroot] [PATCH v3 04/10]
 package/gstreamer1/gst1-plugins-{base, good, bad, ugly}: bump to 1.16.0
In-Reply-To: <20190425000442.09f6044e@gmx.net>
References: <20190424210333.62571-1-aduskett@gmail.com>
 <20190424210333.62571-4-aduskett@gmail.com>
 <20190425000442.09f6044e@gmx.net>
Message-ID: <CAFSsvmrnLLWpTWNyUOxOHu8Xt6=m5bZaNNrJnDd=6_+920HV5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Peter;

On Wed, Apr 24, 2019 at 6:04 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Adam,
>
> On Wed, 24 Apr 2019 17:03:27 -0400, aduskett at gmail.com wrote:
>
> [...]
>
> >
> >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV to Config.in.legacy as the
> >     plugin now requires opencv3 with the bgsegm opencv_contrib module, which is
> >     not in Buildroot.
>
> Out of interest, whats is wrong/missing from package/opencv3 (providing
> opencv-3.4.3) or what is the error message if you try to compile with this
> package enabled?
>
It's looking for opencv2/bgsegm.hpp, which is in the opencv_contrib project.

We have two options:
1) Disable the opencv plugin
2) Add opencv_contrib as a subproject to opencv.

Here is the full output:
https://pastebin.com/C47Eg1eT

Adam

> Regards,
> Peter
