From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 29 Apr 2013 14:12:13 +0100
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <20130204235109.5d1b85f7@skate>
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
 <20130204235109.5d1b85f7@skate>
Message-ID: <CAHt8ZCOMTcEa71OsgLOvW0QcydhqRUHNqymJcNNsxtbkLGU3NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 February 2013 22:51, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Alexandre Belloni,
>
> On Mon,  4 Feb 2013 23:26:13 +0100, Alexandre Belloni wrote:
>> --- /dev/null
>> +++ b/package/multimedia/gst-plugin-x170/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_GST_PLUGIN_X170
>> +     bool "gst-plugin-x170"
>> +     depends on BR2_PACKAGE_GSTREAMER
>
> A "depends on BR2_arm" should be added here. We generally try to hide
> such architecture-specific packages when they really don't make sense.
> Of course, technically speaking, it should only appear if the SoC is an
> AT91 SoC that has this specific video unit, but we are not able to do
> that with the existing Buildroot options. But we still try to make such
> options depend on BR2_arm.

I think it's ARM9 only, so we can probably be slightly more specific:

  depends on (BR2_arm920t || BR2_arm922t || BR2_arm926t)

Simon
