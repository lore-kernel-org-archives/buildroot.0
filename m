From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 8 Sep 2015 23:02:03 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <55EF582F.1090407@mind.be>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
 <55EF582F.1090407@mind.be>
Message-ID: <CA+BsyQ6-9nt+GRLTmVRHetm_gP4vvrXKEEr1wdku_P44x2DWnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Romain patches gdb to avoid recursing in the doc directory [1][2]
> Vicente does the same but with a sed instead of patch [3].
> Brendan adds host-texinfo to dependencies (this patch) [4].
>
>  Which one do we choose?
>
>  host-texinfo takes a bit of time to build because it also depends on
> host-ncurses, but it's not a huge problem.

I noted that, but in any scenario where host-texinfo is needed,
ncurses was already a dependency anyway.

On my W520 (i7-2760QM, SSD, Fedora 22, btrfs) with ccache it's taking
11 seconds to rebuild host-texinfo, most of that being the time taken
by the configure script. But I appreciate there are folks working on
slower hardware.

>  The best solution is adding an upstreamable --disable-doc, but that will take a
> bit of work still (esp. because we can't easily autoreconfigure).

I looked very briefly at the idea of trying to make it not build docs,
but was scared off by the huge tree with lots of Makefiles. I guessed
it would be a day or so's work, and quicker just to add the dep.

regards

Brendan
