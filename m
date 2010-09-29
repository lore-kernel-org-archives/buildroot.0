From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 29 Sep 2010 14:01:23 +0300
Subject: [Buildroot] Libtool work: a tentative summary
In-Reply-To: <20100929105151.76bd6230@surf>
References: <20100928223652.6dc72083@surf>
	<AANLkTi=Sf1+acAXfCgJcTv+4Yrtw0nEH+_Ugv3+0dVk0@mail.gmail.com>
	<20100929105151.76bd6230@surf>
Message-ID: <AANLkTikZEe+tS3WtxULNLNq80QrVRy0U5XWzneRcHRnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 29, 2010 at 11:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Paulius,
>
> On Wed, 29 Sep 2010 11:32:29 +0300
> Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:
>
>> I would go for a conservative solution.
>> The main reason here is compile speed.
>> Currently my configuration takes ~1 hour to compile on my 4x3.4GHz
>> machine with DDR3 RAM...
>
> Are you using internal toolchain or external toolchain ?

internal

>> The worst part here is that autoreconfigure and ./configure scripts doesn't
>> scale on multicore CPU :(
>> So adding a lot more autoreconfigure usage would drastically reduce
>> build time.
>
> Thanks for your feedback.
>
> For what it's worth, I've started to experiment the modification of our
> package infrastructure in order to use real file targets instead of
> phony targets for the steps sequencing (download -> extract -> patch ->
> configure, etc.). This is one of the requirements to be able to do
> top-level parallel builds, which I think, definitely becomes necessary
> to parallelize the autoreconf/configure steps of packages. This is
> however a lot of work, and I don't expect this to be ready anytime soon.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
