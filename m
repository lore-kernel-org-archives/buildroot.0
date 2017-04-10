From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:21:24 +0200
Subject: [Buildroot] [PATCH v3] libgphoto2: new package
In-Reply-To: <be4a6cfa-8ca0-d013-837c-21b0f4367a41@mind.be>
References: <1491827774-11245-1-git-send-email-kevin.joly@sensefly.com>
 <be4a6cfa-8ca0-d013-837c-21b0f4367a41@mind.be>
Message-ID: <e8516325-a50e-ec80-825d-43978aab55dc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 15:14, Arnout Vandecappelle wrote:
> 
> 
> On 10-04-17 14:36, Kevin JOLY wrote:
>> Add support for libgphoto2 core library designed to allow access to
>> digital camera.
>>
>> Signed-off-by: Kevin JOLY <kevin.joly@sensefly.com>
>> Cc: Romain Naour <romain.naour@gmail.com>
> 
>  Except for some minor issues and one style issue in Config.in (see below), it
> all looks good. I've already ran test-pkg for a dozen toolchains and it looks
> good. So
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Oh, there is one important issue after all: it installs something in
/usr/lib/udev, but that should be /lib/udev. So you need to set

LIBGPHOTO2_CONF_ENV = udevscriptdir=/lib/udev

 With that, you can add my Acked-by to v4.

 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
