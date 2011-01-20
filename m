From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 13:19:10 +0100
Subject: [Buildroot] [PATCH 04/10] wavpack: new package
In-Reply-To: <1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:34 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y66fbwe9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> +++ b/package/multimedia/wavpack/Config.in
 Gustavo> @@ -0,0 +1,10 @@
 Gustavo> +config BR2_PACKAGE_WAVPACK
 Gustavo> +	bool "wavpack"
 Gustavo> +	help
 Gustavo> +	  WavPack is a completely open audio compression format providing
 Gustavo> +	  lossless, high-quality lossy, and a unique hybrid compression mode.
 Gustavo> +
 Gustavo> +	  Works on softfloat but it's not recommended since it uses
 Gustavo> +	  a big deal of CPU power.

CPUs without HW FPU are not necessarily low performance for integer
calculations. I don't know anything about wavpack, but from the
wikipedia page it seems like it doesn't use much FPU:

No floating-point arithmetic is used in WavPack's data path because,
according to the author, integer operations are less susceptible to
subtle chip-to-chip variations that could corrupt the lossless nature of
the compression (the Pentium floating point bug being an example). It is
possible that a lossless compressor that used floating-point math could
generate different output when running on that faulty Pentium. Even
disregarding actual bugs, floating-point math is complicated enough that
there could be subtle differences between "correct" implementations that
could cause trouble for this type of application.

So I would just drop this sentence.

-- 
Bye, Peter Korsgaard
