From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 16 May 2013 09:29:53 -0500
Subject: [Buildroot] [PATCH v6 10/10] gst-omx: add gst-omx package
In-Reply-To: <20130516101052.737192f2@skate>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-11-git-send-email-spenser@gillilanding.com>
 <20130516101052.737192f2@skate>
Message-ID: <CAEBucnCt0ed=iKRhMR1b4Dc2+wFWe27KxPHJ8Dx1_1E5uyjwdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> One question: it would be good to mention, in your cover letter, on
> which platform this was tested. Was it tested on RPi? With what command
> line/tool?

I'll add this info to the cover letter.  It was tested with gst-launch.

>> +comment "gst-omx requires a OpenMAX implementation please select rpi-userland or bellagio"
>> +     depends on BR2_PACKAGE_GSTREAMER1 && ! BR2_PACKAGE_HAS_OPENMAX
>
> I'm not sure it's reasonable to list the available OpenMAX
> implementations. So I'd just stick with "gst-omx requires an OpenMAX
> implementation".
>
> No space between ! and BR2_PACKAGE_HAS_OPENMAX.

Fixed.

>> diff --git a/package/multimedia/gst-omx/gst-omx.mk b/package/multimedia/gst-omx/gst-omx.mk
>> new file mode 100644
>> index 0000000..7f54900
>> --- /dev/null
>> +++ b/package/multimedia/gst-omx/gst-omx.mk
>> @@ -0,0 +1,9 @@
>
> The usual (and useless, but conventional) comment header is missing.
>
>> +GST_OMX_VERSION=1.0.0
>> +GST_OMX_SOURCE=gst-omx-$(GST_OMX_VERSION).tar.xz
>> +GST_OMX_SITE=http://gstreamer.freedesktop.org/src/gst-omx/
>
> Spaces before and after =.

Fixed.

>> +GST_OMX_DEPENDENCIES = gstreamer1 gst1-plugins-base libopenmax
>> +GST_OMX_LICENSE = LGPLv2.1
>> +GST_OMX_LICENSE_FILE = COPYING
>> +GST_OMX_INSTALL_STAGING = YES
>> +
>> +$(eval $(autotools-package))
>
> Not sure here: do we have a reason to install this to the staging/
> space? I thought it was only installing a plugin, and not a library
> against which other things would be linked with.

Not required in staging dir.  I've removed the line from the latest version.

I'm going to wait another couple days before I sent another version
just in case more reviews come in.  If you want to see the changes in
the meantime take a look at the rpi branch on my github buildroot
clone at https://github.com/Spenser309/buildroot/commits/rpi .

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
