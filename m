From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Apr 2020 14:25:07 +0200
Subject: [Buildroot] how to make two defconfig simultaneously
In-Reply-To: <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
References: <VI1PR04MB513697495A894BC827B3CF0DFEC10@VI1PR04MB5136.eurprd04.prod.outlook.com>
 <20200409133434.20276005@windsurf.home>
 <CA+h21hpmV55Nh7HUA5WZ3QKU+yCPsnoLOVuNge8VyMbbK6EtHg@mail.gmail.com>
Message-ID: <20200409142507.5de703f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 9 Apr 2020 15:16:36 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com  
> 
> I would assume the question is about merging a defconfig with multiple
> fragments.

Then:

$ ./support/kconfig/merge_config.sh fragment1 fragment2

see also
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf slides
43 and 44.

However, I would recommend to *not* store fragments under configs/ with
a _defconfig suffix, as this is normally used for complete defconfigs,
not fragments.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
