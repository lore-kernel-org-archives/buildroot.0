From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 09:24:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: needs wchar
In-Reply-To: <20181115165903.GL10271@scaer>
References: <20181023160931.16417-1-bernd.kuhls@t-online.de>
 <CAFSsvmqEdPu2V3j=d55j6cUVmNeC0MSjTmA5HM1R5HcWh1LzwA@mail.gmail.com>
 <643ca3d2-1825-4707-5fbb-0817229188f9@mind.be>
 <20181101223046.72222a3c@windsurf> <20181115165903.GL10271@scaer>
Message-ID: <20181116092424.79d94e4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 17:59:03 +0100, Yann E. MORIN wrote:

> I agree with Arnout here.
> 
> However, from a purely pragmatic point of view, I see that it is totally
> useless in practice, so I would not mind we drop them.
> 
> And in retrospect, I think it *is* better that we do drop them. If the
> top-level option loses that dependency, then it is 'easy' to detect it
> has become mandatory for a sub-option, because the autobuilders will
> fail.
> 
> However, if we repeat the dependency and the top-level option lses it
> and we forget to remove it, we will never realise that the sub-option
> shouldalso lose it.

That is indeed a good argument. Should we settle on the idea that we
should not uselessly replicate such dependencies ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
