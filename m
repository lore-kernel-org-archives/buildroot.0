From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Apr 2017 15:50:24 +0200
Subject: [Buildroot] [PATCH v2] package/aubio: bump to version 0.4.5
In-Reply-To: <20170417150736.663cc9c5@free-electrons.com>
References: <20170416205106.28392-1-romain.naour@gmail.com>
 <20170417150736.663cc9c5@free-electrons.com>
Message-ID: <ddc8b801-77c5-c780-8f06-a5cd5c82c5ac@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/04/2017 ? 15:07, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 16 Apr 2017 22:51:06 +0200, Romain Naour wrote:
> 
>> -ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
>> +ifeq ($(BR2_PACKAGE_AUBIO_LIBSAMPLERATE),y)
> 
> Since none of the other optional dependencies have a sub-option in this
> package, what about just:
> 
> ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)

Yes, I hesitated by doing so but I thought it was better to handle the
dependency from Config.in (for the help text and comment when not available).
I've not a strong opinion.

> 
> Also, I don't quite understand your commit, because libsamplerate is
> itself built with --disable-fftw.

humm, I don't really know if libsamplerate without fftw support can really work
with aubio. The build systemd doesn't check if fftw is enabled in libsamplerate.
I'll ask upstream.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
