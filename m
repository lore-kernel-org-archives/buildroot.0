From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Sun, 12 Feb 2012 00:54:27 +0200
Subject: [Buildroot] [PATCH] Add gst-av package
In-Reply-To: <87zkcpz2i1.fsf@macbook.be.48ers.dk>
References: <1328919431-22820-1-git-send-email-felipe.contreras@gmail.com>
 <87d39l1hwr.fsf@macbook.be.48ers.dk>
 <CAMP44s2pzn3vZXve8VCsNPM0iX=AVB83cFnxoj0t3KJo5rxqkw@mail.gmail.com>
 <87zkcpz2i1.fsf@macbook.be.48ers.dk>
Message-ID: <CAMP44s0wq2AT0-ayCovzXwxz0qMo=c5xqEc0VXtcjG2rvU9hvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 11, 2012 at 7:47 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
> ?Felipe> I thought the help text explained that: gst-ffmpeg disables certain
> ?Felipe> codecs, like MP3, Vorbis, Theora, etc. IOW. It has political baggage
> ?Felipe> from GStreamer developers; they don't want people to use FFmpeg, they
> ?Felipe> want people to use native elements: vorbisdec, theoradec, maddec, etc.
>
> But how does (more-or-less) reimplementing gst-ffmpeg change this
> political baggage?

I don't have to convince GStreamer developers--I know many of them,
and I doubt they would allow such a change.

Plus, here's another important part of the description[1]:

---
In addition, it is much simpler (2654 vs 16575 LOC), has better
performance, and has a bit of extra features (such as less latency),
and doesn?t use deprecated API?s. In a previous post I measured
exactly how much improvement compared to gst-ffmpeg there is; it?s not
much, but it?s some.
---

Yes, I have actually measured the power usage[2].

But the main reason is the complexity of the code. If you quickly skim
through both code-bases, you would see what I mean :)

Cheers.

[1] http://felipec.wordpress.com/2011/05/19/gst-av-0-5-released-now-with-video-encoding-and-decoding-support/
[2] http://felipec.wordpress.com/2010/09/14/gst-av-0-3-better-performance-for-vorbis-and-mp3/

-- 
Felipe Contreras
