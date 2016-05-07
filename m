From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 May 2016 01:41:37 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <572D9A1E.20609@gmail.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be> <572AEB2E.1050305@gmail.com>
 <572AFC1F.3070004@gmail.com> <20160505142533.67f8e473@free-electrons.com>
 <572D9A1E.20609@gmail.com>
Message-ID: <e3cfa132-94c0-2b3d-7593-3286bab1e535@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 09:32, Marco Trapanese wrote:
> Il 05/05/2016 14:25, Thomas Petazzoni ha scritto:
>>> - bluez4 is recommended with pulseaudio due to simpler configuration of
>>> A2DP and HFP
>>> - but connman 1.32 doesn't support bluez4 anymore
>>> - but QtConnectivity doesn't support bluez5
>> I think it does, see https://patchwork.ozlabs.org/patch/612073/.
>
>
> I've just seen bluez5 requires glibc or musl toolchain.
> I tried to rebuild all with glibc (instead of uClibc) but the RPi3 refuses to
> boot due to a kernel panic.

  Please use a serial port for debugging: the screenshot isn't really readable, 
and the interesting part has probably scrolled off-screen.

  However, it's extremely unlikely that changing uClibc to glibc would cause a 
kernel panic, because the kernel isn't using libc. So you have probably 
inadvertedly changed something else as well.

  Regards,
  Arnout

>
> It's a known behavior? Otherwise I'm afraid I have to do a "regression" with
> older versions.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
