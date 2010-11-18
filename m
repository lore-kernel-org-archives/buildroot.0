From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 14:58:46 +0100
Subject: [Buildroot] Buildroot with Alsa-Lib Question
In-Reply-To: <SNT105-DS199937549E05B4359869B5EB390@phx.gbl>
References: <SNT105-DS199937549E05B4359869B5EB390@phx.gbl>
Message-ID: <20101118145846.055e1acc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jon,

On Thu, 18 Nov 2010 13:12:10 +0000
Jon Ambrose <jonathan.ambrose@live.uwe.ac.uk> wrote:

> Basically I am trying to get Flite 1.4 (Text synthesis application)
> working on my embedded Arm IGEP v2 Platform, using Buildroot.
> 
> For this to work and my applications to cross compile, I need
> libasound_module_pcm_pulse.so located in /usr/lib/alsa-lib/ however
> nothing like that appears. This library I think is part of something
> called Pulse Audio. Which I don't think Buildroot offers does it?

As far as I understand, libasound_module_pcm_pulse.so is the ALSA
plugin that re-injects the sound output into PulseAudio. It allows
application written on top of ALSA to work nicely with PulseAudio. We
don't have a package for PulseAudio at the moment, but for your
project, you probably don't need it. You should tell your Flite
application to directly talk to ALSA devices, and not configure those
ALSA devices to loop back into PulseAudio.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
