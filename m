From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 16 Jan 2014 09:50:20 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-13
In-Reply-To: <87vbxlv3q3.fsf@dell.be.48ers.dk>
References: <20140114073009.D944B10264B@stock.ovh.net>
 <CAFOYHZB+FECgTWX1aa2cSDQMHSS83f8Ri7yOj7H+nZyY6Lr_kw@mail.gmail.com>
 <87vbxlv3q3.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZBcBNWvhVYd6oABiA2RSTP=Hr1oifA+5AggWS46h95yrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 16, 2014 at 1:17 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>  > Hi
>  > On Tue, Jan 14, 2014 at 8:30 PM, Thomas Petazzoni
>  > <thomas.petazzoni@free-electrons.com> wrote:
>  >> arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/54b739bd3713de87113cbed35e05b9074282b30d/
>  >> arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/fec13bcb3e65e691f6f3c34548024312c3ba9ec1/
>
>  > I have tried to reproduce both of these build configs. The first one
>  > fails for me with an unrelated error ( /usr/X11R6/lib in chroot .: No
>  > such file or directory). The second one succeeds. Am I doing something
>  > wrong?
>
> Are you sure the first one really fails? The message sounds like the
> warning from ldconfig about the rootfs not having /usr/X11R6/lib unless
> you have X11 enabled, but that's just a warning.

I could be misinterpreting the message, it's just the last thing in
the console output. In lieu of a reassuring green light I interpreted
the message as a failure.

> I also cannot reproduce the tcpreplay issue here. I see that all of the
> failures happens on Thomas' machine, so hopefully he can take a closer
> look once he is back.

I took a look at last nights new failures (for x86_64) and can't
reproduce them either. Does anything insert extra CFLAGS from outside
of the defconfig? I notice a few warnings that -Werror would bail on.
I'll see if I can get them fixed upstream just to reduce noise.
