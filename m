From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu, 22 Aug 2019 15:33:44 +0300
Subject: [Buildroot] Help with forcing a rebuild of the target
In-Reply-To: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
References: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
Message-ID: <CAMw6YJJGA6K=909qNahYbM4v=7QfX2BfVLW-LNWHNa0ihUCV_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jakob,

On Sun, Aug 11, 2019 at 2:41 AM Jakob Cornell <jakob@jcornell.net> wrote:
>
> Hi all,
>
> I've been working with Buildroot for a few weeks, and I occasionally find that I want to undo a change I've made to the 'output/target' tree. This is usually because I want to remove a file previously added using an overlay or because there are stale files leftover from a package that I've deselected.
>
> So what I want to do, ideally, is run everything needed to fully populate the target filesystem, but also ensure that only what's needed is there. I've tried removing 'output/target' or individual files in it, but that often breaks the build. I've been resorting to doing a full clean and build, which is very wasteful. Is there any way to clean out the target tree and rebuild it without having to recompile anything?
>
> Thanks,
> Jakob
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Yes, Buildroot does not provide mechanism to un-install package from
the target/staging/host, I think the answer might be here:

    https://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages

Regards,
Vadim Kochan
