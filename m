From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 17:11:03 +0100
Subject: [Buildroot] [git commit] boot: only show vendor-specific
	bootloaders for applicable arm variant
In-Reply-To: <20120202170059.42c7b05e@skate> (Thomas Petazzoni's message of
 "Thu, 2 Feb 2012 17:00:59 +0100")
References: <20120201224701.C13259097B@busybox.osuosl.org>
 <20120202164743.30dfab12@skate> <87ipjp9ql2.fsf@macbook.be.48ers.dk>
 <20120202170059.42c7b05e@skate>
Message-ID: <87ehud9pwo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Thu, 02 Feb 2012 16:56:25 +0100,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> True. Is that a common use case? If so then I'll revert.

 Thomas> I don't know if it's a common use case. But I would suspect that many
 Thomas> newcomers do not necessarily select the right sub-architecture. But I
 Thomas> don't have a strong opinion with your regard to your patch. I just
 Thomas> think that people may not discover that those bootloaders are available
 Thomas> in Buildroot.

If that's the case, then we have the same problems with SoC specific
packages like gst-dsp or armv7 only things like valgrind.

 Thomas> However, as discussed on IRC, we might see an increase of
 Thomas> platform-specific packages (3D drivers and libraries, codecs
 Thomas> and DSP stuff, etc.), so maybe we'll need some way of selecting
 Thomas> the platform in order to show only the relevant packages? Or
 Thomas> maybe simply by organizing the packages like:

 Thomas>  Platform specific packages ->
 Thomas>   Texas Instruments OMAP packages ->
 Thomas>   Freescale i.MX packages ->
 Thomas>   ...

Yes, I guess something like that is needed. We should make sure we don't
make it too complicated though.

-- 
Bye, Peter Korsgaard
