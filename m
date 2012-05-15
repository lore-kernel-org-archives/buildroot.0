From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 May 2012 09:02:10 +0200
Subject: [Buildroot] [PATCH 1/1] opencv: bump to version 2.4.0
In-Reply-To: <CAHXCMMKcLXdLWySrosjh41WbottHaEz-Y0cZGxrtaJ-hq4Htxw@mail.gmail.com>
 (Samuel Martin's message of "Tue, 15 May 2012 08:19:58 +0200")
References: <1337035892-29285-1-git-send-email-s.martin49@gmail.com>
 <20120515034259.GA3091@sapphire.tkos.co.il>
 <CAHXCMMKcLXdLWySrosjh41WbottHaEz-Y0cZGxrtaJ-hq4Htxw@mail.gmail.com>
Message-ID: <8762byvsel.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 >> Can we detect the SSE capability of the target automatically using
 >> the various BR2_x86_* config options in target/Config.in.arch?

 Samuel> Of course, we could.
 Samuel> But IMHO, this belongs more to the target/Config.in.arch file than to
 Samuel> any packages.
 Samuel> OpenCV may be the first package that can take benefit from such
 Samuel> options, but hope it's not the last one ;-)

 Samuel> I'll see how we can handle this. Any objections?

That's also good. E.G. add hidden options for the various instruction
set extensions (mmx, sse, neon, altivec, ..) and then select those from
the applicable cpu variant options.

Don't worry if you don't know all the details about the various
architecture variants, we can always complete it later.

-- 
Bye, Peter Korsgaard
