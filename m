From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Apr 2017 19:25:44 +0200
Subject: [Buildroot] [PATCH v2] package/aubio: bump to version 0.4.5
In-Reply-To: <ddc8b801-77c5-c780-8f06-a5cd5c82c5ac@gmail.com>
References: <20170416205106.28392-1-romain.naour@gmail.com>
 <20170417150736.663cc9c5@free-electrons.com>
 <ddc8b801-77c5-c780-8f06-a5cd5c82c5ac@gmail.com>
Message-ID: <a9c53f17-2ea2-d0af-60d0-23d0d9d3be81@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/04/2017 ? 15:50, Romain Naour a ?crit :
> Hi Thomas,
> 
> Le 17/04/2017 ? 15:07, Thomas Petazzoni a ?crit :
>> Hello,
>>
>> On Sun, 16 Apr 2017 22:51:06 +0200, Romain Naour wrote:
>>
>>> -ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
>>> +ifeq ($(BR2_PACKAGE_AUBIO_LIBSAMPLERATE),y)
>>
>> Since none of the other optional dependencies have a sub-option in this
>> package, what about just:
>>
>> ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
> 
> Yes, I hesitated by doing so but I thought it was better to handle the
> dependency from Config.in (for the help text and comment when not available).
> I've not a strong opinion.
> 
>>
>> Also, I don't quite understand your commit, because libsamplerate is
>> itself built with --disable-fftw.

As reported by Paul Brossier [1], fftw is not used by libsamplerate library.
Only tests programs use it.

So we just have to make sure that fftw use single precision mode when
libsamplerate is enabled [2].

Best regards,
Romain

[1] https://github.com/aubio/aubio/issues/100
[2] https://github.com/aubio/aubio/commit/8be88e77f5c275fdf4efc99ae182d14940948786

> 
> humm, I don't really know if libsamplerate without fftw support can really work
> with aubio. The build systemd doesn't check if fftw is enabled in libsamplerate.
> I'll ask upstream.
> 
> Best regards,
> Romain
> 
>>
>> Thanks,
>>
>> Thomas
>>
> 
