From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 23:01:21 +0100
Subject: [Buildroot] [PATCH v2] gst1-plugins-imx: add package
In-Reply-To: <CADCpmyOMtq1vf9TtZJ-=JaRR67qiSQoX5k5CZ7T0jqYav2GWeA@mail.gmail.com>
 (Gary Bisson's message of "Mon, 3 Nov 2014 14:47:48 -0800")
References: <1414636344-8152-1-git-send-email-bisson.gary@gmail.com>
 <5457F8C5.5000708@mind.be>
 <CADCpmyOMtq1vf9TtZJ-=JaRR67qiSQoX5k5CZ7T0jqYav2GWeA@mail.gmail.com>
Message-ID: <8761eps66m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <bisson.gary@gmail.com> writes:

Hi,

 >     ?I'm sorry to return to the naming issue, but shouldn't the package be
 >     called
 >     gst1-imx instead of gst1-plugins-imx? We don't use 'plugins' in any other
 >     gst
 >     package (except the official plugin bundles), and upstream also doesn't
 >     have
 >     'plugins' in the name.

 > ?
 > I see your point and really changing the name doesn't bother me, we just need
 > to agree on something. How do we organize a vote? irc? ;-) So far Peter K
 > suggested "gstreamer1-imx", Arnout "gst1-imx" and mine "gst1-plugins-imx". As a
 > reminder the git repo name is "gstreamer-imx" and the Yocto recipe is
 > "gstreamer1.0-plugins-imx". Since the first version of this patch have been
 > integrated two plugins:gst1-libav and gst1-validate which tends towards a gst1-
 > <name> convention.

Yes, so lets go with gst1-imx.


 >> +? ? ?depends on BR2_arm # Only relevant for i.MX
 >> +? ? ?depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
 >> +? ? ?depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q

 >     ?This should be a select.


 > We unfortunately discussed that before and Yann came to the conclusion it
 > wasn't possible for now [1]. Otherwise this requires reworking all the iMX
 > platforms selections in freescale-imx packages.

Ahh yes, so lets leave it as depends on (for both).

-- 
Bye, Peter Korsgaard
