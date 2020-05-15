From: Nicolas Robin <nrosfs@gmail.com>
Date: Fri, 15 May 2020 22:50:34 +0200
Subject: [Buildroot] [PATCH 1/3] package/sdl2: enable SSE only if it's
 supported by the target
In-Reply-To: <20200515224416.7443c5b6@windsurf.home>
References: <20200515175357.45954-1-nrosfs@gmail.com>
 <20200515214840.7327bb1b@windsurf.home>
 <70CE52ED-932A-4109-89E1-910C2C447846@gmail.com>
 <20200515224416.7443c5b6@windsurf.home>
Message-ID: <D08389EB-C413-42CA-A246-AD0A22E72F9D@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SDL2 does have SSE and 3DNOW enabled by default, I have to disable these to avoid illegal instruction on the little Pentium.
Buildroot works fine on it, and with the latest kernel :-) I don't know why I do that, I just do it.

> Le 15 mai 2020 ? 22:44, Thomas Petazzoni <thomas.petazzoni@bootlin.com> a ?crit :
> 
> On Fri, 15 May 2020 21:55:38 +0200
> Nicolas Robin <nrosfs@gmail.com> wrote:
> 
>> I do! Pentium MMX 233MHz, a beast!
> 
> But a Pentium MMX does not have 3DNow.
> 
> And anyway, you're using Buildroot to build a system for a Pentium MMX
> at 233 Mhz ? These machines are still running and alive ?
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
