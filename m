From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Tue, 25 Jan 2011 04:55:47 +0200
Subject: [Buildroot] [PATCH 3rd RESEND 6/6] Add gst-omapfb package
In-Reply-To: <87lj2ahe4y.fsf@macbook.be.48ers.dk>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimFBvGJdW975fEObvwh9L5cK9vS5o7EbWr=qV83@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 24, 2011 at 10:58 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
>
> ?Felipe> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> ?Felipe> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> And here.

Well, there's no 'uninstall' in upstream. Should I add a patch to the
Makefile, or shall I manually remove the files (in gst-dsp and
gst-omapfb it's just one file, and in the other packages there are
very few).

> Thinking a bit more about it - For the omap3 stuff, they are all with A8
> cores, so we could even do 'depends on BR2_cortex_a8', right?

I guess so.

> ?Felipe> diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
> ?Felipe> new file mode 100644
> ?Felipe> index 0000000..e4a62c0
> ?Felipe> --- /dev/null
> ?Felipe> +++ b/package/multimedia/gst-omapfb/Config.in
> ?Felipe> @@ -0,0 +1,7 @@
> ?Felipe> +config BR2_PACKAGE_GST_OMAPFB
> ?Felipe> + ? ? ?bool "gst-omapfb"
> ?Felipe> + ? ? ?depends on BR2_PACKAGE_GSTREAMER
> ?Felipe> + ? ? ?help
> ?Felipe> + ? ? ? ?GStreamer plug-in to use OMAP framebuffer.
>
> Is this omap3 specific like the rest, or would it also work on E.G. the
> pandaboard?

That's a good question. I don't think the OMAP4 display sub-system
works right now, so it's hard to tell, but in theory it should work.

Cheers.

-- 
Felipe Contreras
