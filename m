From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Sep 2016 17:12:38 +0200
Subject: [Buildroot] [PATCH] gst1-rtsp-server: new package
In-Reply-To: <20160909152623.6d8cf9a6@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 9 Sep 2016 15:26:23 +0200")
References: <1472820821-5130-1-git-send-email-Abhilash.Tuse@imgtec.com>
 <20160908233019.4d3c3890@free-electrons.com>
 <e45482ba-2f3c-18e9-8486-72223e201386@imgtec.com>
 <20160909152623.6d8cf9a6@free-electrons.com>
Message-ID: <87k2el3y55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Hum, ok. So it's like *some* plugins are absolutely mandatory for
 > gst1-rtsp-server to work properly?

Yes, I don't think rtsp-server is usable without rtpbin.

 > If that's the case, then selecting those plugins as you did is good, as
 > we prefer when things work "out of the box" rather than having to
 > figure out the runtime dependencies by trial on error.

 > However, you just selected the main "base", "good" and "bad" plugin
 > packages, but in fact all the plugins in those packages have
 > sub-options. So you can build gst1-plugins-base without any plugin
 > selected I believe, for example. So if some plugins are absolutely
 > mandatory for gst1-rtsp-server to work, those plugins should be
 > selected.

 > For example, I guess the rtpbin element is provided by the
 > gst1-plugins-good rtp plugin, so you should select
 > BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP.

Agreed.

-- 
Bye, Peter Korsgaard
