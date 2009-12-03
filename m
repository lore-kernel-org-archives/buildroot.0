From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 03 Dec 2009 12:33:17 +0100
Subject: [Buildroot] tremor / libvorbis confusion
Message-ID: <1259839997.12310.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

currently tremor is part of the libvorbis package in buildroot and if
you select BR2_PACKAGE_LIBVORBIS_TREMOR, then tremor silently takes the
role of libvorbis. This means that libvorbis is not installed and tremor
is installed instead of it. This is IMO rather confusing and it doesn't
work for us (and probably not for other people).

The reason that it doesn't work for our needs is that tremor is not a
drop-in replacement for libvorbis. The APIs are similar, becase the
tremor API is based on an old libvorbis API, but it is not identical.
Also the library that is built and installed by tremor is not libvorbis,
but libvorbisidec.

For our project we actually need both. One application in our stack
needs features from libvorbis. And another application uses
libvorbisidec. This can not be done with the current setup of tremor
being hidden in the libvorbis package.

So what I propose is to move tremor out of libvorbis and turn it into a
regular buildroot package called either 'tremor' or 'libvorbisidec'.
Then people can select whatever they need and if they need both, they
select both libraries.

If you agree with this proposal, then I can make patches for this. I
would then also like to contribute a patch for for gst-plugins-bad that
allows to configure the build of the ivorbisdec gstreamer plugin.


Sven

-- 
Sven Neumann
Head of Software Development

RAUMFELD GmbH | Reichenberger Str. 124 | 10999 Berlin | Germany
Tel: +49.30.340.60.98.0 | Fax: +49.30.340.60.98.99 | s.neumann at raumfeld.com
