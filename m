From: Cameron Hutchison <lists@xdna.net>
Date: Wed, 03 Feb 2010 03:36:19 -0000
Subject: [Buildroot] Confusion with building at91bootstrap
Message-ID: <411b.4b68ef33.cfddb@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build an image for an AT91SAM9260EK board and I'm getting
a little confused with the build ot at91bootstrap. I'm using BR 2009.11

When at91bootstrap is configured, the buildroot makefile
(at91bootstrap.mk) runs "make at91sam9260ek_defconfig" which sets up
at91bootstrap for building for my specific board.

That config file defines IMG_SIZE to be 0x40000 and passes
-DIMG_SIZE=0x40000 to the compiler.

The buildroot makefile passes -DIMG_SIZE=0x32000. This value comes from
the buildroot config.

This causes a build warning that IMG_SIZE is redefined.

Apart from that I don't yet know what the correct image size should be,
it looks like the at91bootstrap integration into buildroot is broken.
The option to set the image size in the BR config cannot work, since the
at91bootstrap (2.10) source will attempt to override it anyway. Am I
missing something here?

Also, the at91bootstrap defconfig for this board adds the suffix of
"card" to the output file, making that filename contain "dataflashcard"
when I have configured for "dataflash" not "dataflashcard". I dont yet
know what the difference is between these (my board does not appear to
have any sort of card or slot for one), so I'm not sure what should be
done here, but it appears inconsistent.

Finally, is this the best place to discuss at91bootstrap and other
issues related to this board and buildroot, or is there a better forum?

Thanks
