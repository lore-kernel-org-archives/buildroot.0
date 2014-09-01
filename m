From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 1 Sep 2014 07:00:48 +0000
Subject: [Buildroot] [PATCH v2] ARC: bump tools to 2014.08 release
In-Reply-To: <878umavrhu.fsf@dell.be.48ers.dk>
References: <1408642436-2489-1-git-send-email-abrodkin@synopsys.com>
 <1409064582.6466.21.camel@abrodkin-8560l.internal.synopsys.com>
 <20140826165826.398f7a63@free-electrons.com>
 <1409065267.6466.23.camel@abrodkin-8560l.internal.synopsys.com>
 <87d2bmvs2f.fsf@dell.be.48ers.dk> <1409090000.3760.1.camel@abrodkin-8560l>
 <878umavrhu.fsf@dell.be.48ers.dk>
Message-ID: <1409554847.16864.7.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2014-08-27 at 00:02 +0200, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
> Hi,
> 
>  >> I agree. The current patch doesn't apply to next. Care to rebase and
>  >> resend?
> 
>  > Do I have any options? :)
> 
>  > I mean anyway after you guys cut final 2014.08 release "next" branch
>  > will be merged with current master, right?
> 
>  > If so I have no other choice other than rebase and resend.
>  > Correct me if I'm wrong.
> 
> Well, you can let me do the rebase myself, but it will probably go faster if you
> do it.

I've just checked what's the difference between master and next that
causes problems on patch application.

And it looks the reason is in "next" there's a commit missing:
--->---
gcc/arc-4.8-R3: add patch to enable more C++ features with uClibc
http://git.buildroot.net/buildroot/commit/package/gcc/arc-4.8-R3?id=4bb2a05e8133f2f553b8e0cd6af53dfa8b8208b1
https://patchwork.ozlabs.org/patch/379707/
--->---

And since this patch
(package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch) should be moved to "arc-2014.08" (and my current v2 change does it) I'm not sure if there's a reason to do changes to "next" or just wait before "master" is open to new submissions.

Otherwise we may whether lose history or Thomas' patch.

Let me know if that's fine for this v2 to be applied later directly on
"master".

-Alexey
