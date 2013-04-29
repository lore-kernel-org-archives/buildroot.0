From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Apr 2013 15:20:39 +0200
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <CAHt8ZCOMTcEa71OsgLOvW0QcydhqRUHNqymJcNNsxtbkLGU3NA@mail.gmail.com>
 (Simon Dawson's message of "Mon, 29 Apr 2013 14:12:13 +0100")
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
 <20130204235109.5d1b85f7@skate>
 <CAHt8ZCOMTcEa71OsgLOvW0QcydhqRUHNqymJcNNsxtbkLGU3NA@mail.gmail.com>
Message-ID: <87ip354gns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 >>> +config BR2_PACKAGE_GST_PLUGIN_X170
 >>> +     bool "gst-plugin-x170"
 >>> +     depends on BR2_PACKAGE_GSTREAMER
 >> 
 >> A "depends on BR2_arm" should be added here. We generally try to hide
 >> such architecture-specific packages when they really don't make sense.
 >> Of course, technically speaking, it should only appear if the SoC is an
 >> AT91 SoC that has this specific video unit, but we are not able to do
 >> that with the existing Buildroot options. But we still try to make such
 >> options depend on BR2_arm.

 Simon> I think it's ARM9 only, so we can probably be slightly more specific:

 Simon>   depends on (BR2_arm920t || BR2_arm922t || BR2_arm926t)

And the only device I've ever seen with this IP block integrated are
at91sam9m10/11, both of which are arm926t.

-- 
Bye, Peter Korsgaard
