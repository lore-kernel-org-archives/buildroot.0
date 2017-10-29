From: Steve Kenton <skenton@ou.edu>
Date: Sun, 29 Oct 2017 17:56:11 -0500
Subject: [Buildroot] Libpng missing a link dependency in 2017-08?
In-Reply-To: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
References: <afc724e2-a455-82cd-80f8-ee329e2a3e47@ou.edu>
Message-ID: <1c63c930-a7b0-1400-36d4-42a6eb632c07@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As expected, same behavior with Buildroot 2017-08.1 and with 2017-08.

FYI Steve


On 10/29/2017 03:36 PM, Steve Kenton wrote:
> I recently began evaluating a switch to buildroot-2017.08 and started 
> getting the following message (transcribed from a screen shot)
>
> ffprobe: Relink `/usr/lib64/libpng16.so.16' with 
> `/lib64/libpthread.so.0' for IFUNC symbol `longjmp'
>
> As far as I can determine it is because libpng 1.6.31 uses longjmp() 
> and it needs another link dependency to avoid the runtime fixup above.
>
> I did not see anything on the list about this and buildroot 2017-08.1 
> did not switch to libpng 1.6.32 although I'm building it anyway on 
> general principles.
>
> So, is this likely a libpng build issue or should I start digging 
> into? ffmpeg?
>
> Thanks,
>
> Steve Kenton
>
