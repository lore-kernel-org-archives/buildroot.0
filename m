From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2015 18:03:48 +0200
Subject: [Buildroot] [RFC] Add pyudev package
In-Reply-To: <CAGm1_ksKKpqeHVYH3=Pt1iheON8mihkBL7LXTPmqKTwKOo50cw@mail.gmail.com>
References: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
 <20150910143930.00227183@free-electrons.com>
 <CAGm1_kvo5wPvVgxSjK+CG7QGmMsdP-eNqNAwhOs+Q6B2QsXekA@mail.gmail.com>
 <CAGm1_ksKKpqeHVYH3=Pt1iheON8mihkBL7LXTPmqKTwKOo50cw@mail.gmail.com>
Message-ID: <20150910180348.4b8e66b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu, 10 Sep 2015 16:57:02 +0200, Yegor Yefremov wrote:

> >> I haven't looked in detail, but isn't the solution to patch the Python
> >> find_library() function to make it not rely on gcc/objdump?
> >
> > It would be the best solution. Have you seen such a patch in the wild?
> > So far there was not much feedback in Python's bug tracker.
> 
> Found this mail in our mailing list:
> http://lists.busybox.net/pipermail/buildroot/2013-October/081483.html

Yes, that's probably the sort of changes we need to make. The only
issue is that the change is architecture/platform/C library specific,
so it's a bit annoying, but maybe we can come up with something smart
to handle that, or something stupid that we progressively extend to
cover the different platforms.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
