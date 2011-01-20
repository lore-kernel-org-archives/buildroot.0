From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Jan 2011 10:15:33 -0300
Subject: [Buildroot] [PATCH 04/10] wavpack: new package
In-Reply-To: <87y66fbwe9.fsf@macbook.be.48ers.dk>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>	<1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
	<87y66fbwe9.fsf@macbook.be.48ers.dk>
Message-ID: <4D383575.7010203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/11 09:19, Peter Korsgaard wrote:

> CPUs without HW FPU are not necessarily low performance for integer
> calculations. I don't know anything about wavpack, but from the
> wikipedia page it seems like it doesn't use much FPU:
> 
> No floating-point arithmetic is used in WavPack's data path because,
> according to the author, integer operations are less susceptible to
> subtle chip-to-chip variations that could corrupt the lossless nature of
> the compression (the Pentium floating point bug being an example). It is
> possible that a lossless compressor that used floating-point math could
> generate different output when running on that faulty Pentium. Even
> disregarding actual bugs, floating-point math is complicated enough that
> there could be subtle differences between "correct" implementations that
> could cause trouble for this type of application.
> 
> So I would just drop this sentence.

Fair enough, armv4t @ 200 mhz seems to handle it OK at ~50% CPU load.
