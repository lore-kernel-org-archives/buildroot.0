From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 7 Nov 2017 20:31:27 +0100
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <00a38063-e166-6ba4-6927-b90285ce031e@mind.be>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
 <CANQCQpZ4kVabQPuCNjazZdMB_O-jUxoOFzALR=CKZh5x36pwKQ@mail.gmail.com>
 <CANQCQpZekGq2j7d0KJ=gaJSKUe8YBHm-G8QLyTiMJmsdv7r02A@mail.gmail.com>
 <00a38063-e166-6ba4-6927-b90285ce031e@mind.be>
Message-ID: <20171107193127.GX1829@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> >>> Do you know how these behave in uClibc and musl? Waldemar, any idea?
> >>> Obviously
> >>> the gcc part will still be activated, which covers about half of the
> >>> functionality.
> >>>
> >>
> >> Checking on the answer, but we ran through the complete test-pkg build list.
> >> I'll see which were skipped. We didn't see specific failures.
> >>
> > 
> > The set of test packages I used ended up forcing a glibc only test-pkg
> > build.  I'll rerun with a basic busybox scenario.
> 
>  It will build, that's for sure. My question is: will it actually do anything
> useful? The effect of fortify is shared a bit between GCC and glibc. E.g.
> 'memset' has a GCC implementation (used when it can be inlined) and a glibc
> implementation (used when it's too big or unpredictable). As far as I can see,
> neither uClibc nor musl have support for FORTIFY. So only the GCC part will take
> effect. But I think that that is so little that it's hardly worth it.

I can confirm uClibc-ng does not support FORTIFY security
mechanisms.
There is some old unused code since
82098ab9b853c33ee8ade61c9510b295cc696de1, but I am considering
removing it, because it is unused and incomplete.

best regards
 Waldemar
