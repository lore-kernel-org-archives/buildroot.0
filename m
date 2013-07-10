From: Julien COUVRAND <julien.couvrand@stericsson.com>
Date: Wed, 10 Jul 2013 09:56:21 +0200
Subject: [Buildroot] Buildroot compilation using uClibc and activating
 bluez
In-Reply-To: <20130709173907.06199659@skate>
References: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9923@EXDCVYMBSTM005.EQ1STM.local>
 <20130709125037.0a4e0077@skate>
 <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9A50@EXDCVYMBSTM005.EQ1STM.local>
 <20130709171404.1fc94ea6@skate>
 <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9A66@EXDCVYMBSTM005.EQ1STM.local>
 <20130709173907.06199659@skate>
Message-ID: <747C1E83C744F44E9ACFB89FAEEC2C7B2423BF9B14@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I use the following toolchain:
uClibc/elf-fdpic-v7

About the patch, we will see together the best approach to apply it in Buildroot.


Julien

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: mardi 9 juillet 2013 17:39
To: Julien COUVRAND
Cc: buildroot@
Subject: Re: [Buildroot] Buildroot compilation using uClibc and activating bluez

Dear Julien COUVRAND,

On Tue, 9 Jul 2013 17:23:12 +0200, Julien COUVRAND wrote:

> I am checking it in my environment and submit it to Buildroot if it is ok.

Ok, thanks. Note that the Blackfin patch cannot be accepted as is. This NOMMU define is non-standard, and instead a configure.ac check for fork should be added. And ideally, the patch should be submitted upstream to D-Bus so that at some point in the future, we are able to get rid of it in Buildroot.

> Currently, I use an architecture with R4 ARM processor.

Nice! Which toolchain are you using? I'm really interested in improving the support for noMMU platforms in Buildroot, so don't hesitate to ask questions if needed.

Thanks,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
