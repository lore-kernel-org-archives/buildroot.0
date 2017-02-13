From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 16:18:07 +0100
Subject: [Buildroot] [PATCH v5] gqrx: new package
In-Reply-To: <20170213160125.69d4a1b0@x230.trabucayre.com>
References: <20170210140112.26552-1-gwenj@trabucayre.com>
 <20170212155348.0f14e2a3@free-electrons.com>
 <20170213093839.38b994c9@x230.trabucayre.com>
 <20170213133507.67a46075@free-electrons.com>
 <20170213160125.69d4a1b0@x230.trabucayre.com>
Message-ID: <20170213161807.4e973c6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 16:01:25 +0100, gwenhael.goavec wrote:

> > in the BR2_PACKAGE_GNURADIO_AUDIO option.  
> this modification produce :
> package/alsa-lib/Config.in:4:error: recursive dependency detected!
> package/alsa-lib/Config.in:4:   symbol BR2_PACKAGE_ALSA_LIB is selected
> by BR2_PACKAGE_PORTAUDIO_ALSA package/portaudio/Config.in:15: symbol
> BR2_PACKAGE_PORTAUDIO_ALSA depends on BR2_PACKAGE_PORTAUDIO
> package/portaudio/Config.in:4:  symbol BR2_PACKAGE_PORTAUDIO is
> selected by BR2_PACKAGE_ALSA_LIB

Gah, yes, indeed.

> I think the first solution (select BR2_PACKAGE_ALSA_LIB), to have a
> default backend, is the most simpliest.

Yes, I think too.

> > Make sure to read the discussion I
> > had with the original submitter. I remember spending quite some time
> > interacting with him/her to try to find a good solution (but that
> > wasn't trivial).
>
> I know. I must check everything to have my opinion about this... But I
> think more than one version of this patch will be needed. 

Sure, no problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
