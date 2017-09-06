From: Julien CORJON <corjon.j@ecagroup.com>
Date: Wed, 6 Sep 2017 16:06:57 +0000
Subject: [Buildroot] Orange Pi HDMI to VGA output
In-Reply-To: <874lshmo2z.fsf@dell.be.48ers.dk>
References: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
 <878thum8u8.fsf@dell.be.48ers.dk>
 <20170905094103.GA5082@airbook.vandijck-laurijssen.be>
 <874lshmo2z.fsf@dell.be.48ers.dk>
Message-ID: <955fd355-3b00-dde9-d629-f55a39a302d0@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 05/09/2017 ? 12:33, Peter Korsgaard a ?crit :
>>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:
> 
> Hi,
> 
>   > My experience with HDMI to VGA convertors, on a beaglebone:
> 
>   > an "HDMI to VGA" convertor needs power.
>   > An HDMI port provides, per spec, up to 10mA or so.
>   > So, if you're using such HDMI to VGA convertor:
>   > The beaglebone has a polyfuse to enforce this current limit.
>   > Then the HDMI to VGA will never actually power up and fail to
>   > emit VGA signal.
>   > I once managed to succeed here with bypassing the polyfuse with a wire.
> 
> Alternatively, the HDMI-to-VGA adapters I've seen typically can be
> powered through USB (sometimes not exposed on the outside though).
> 

I'm also trying to make a HDMI to VGA converter on an i.MX6 and just 
discovered that most of them only support CEA resolutions [1]... 
(720p,1080p, etc.)

This can be the issue with your 1280x720 resolution.

I would recommend to take a look in /sys/class/graphics/fbX/modes to see 
the resolution negociated with your dongle.

Kind regards,

Julien

[1] https://en.wikipedia.org/wiki/Extended_Display_Identification_Data
