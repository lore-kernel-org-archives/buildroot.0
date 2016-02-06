From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 6 Feb 2016 15:24:30 +0100
Subject: [Buildroot] Speeding up the Build
In-Reply-To: <CAJJ6jxvwFavFNNVMnBuCGr4hmEgOdRzyU6XDx=_9bF9a9FUn5Q@mail.gmail.com>
References: <CAJJ6jxvwFavFNNVMnBuCGr4hmEgOdRzyU6XDx=_9bF9a9FUn5Q@mail.gmail.com>
Message-ID: <56B6021E.3070608@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

Steve Calfee wrote:
> Hi,
>
> I know buy faster hardware...
>
> We have the ability to share a common download directory, so multiple
> systems builds can have faster downloads.
>
> We have the ability to install a pre-build toolchain - that really helps.
>
> We can have multiple output directories, using the single downloaded
> buildroot directory. Saves git downloading and disk storage.
>
> Is there any way to share the host built utilities? It could be done
> like using a pre-built toolchain, or some kind of special links for
> output/host. The problem is .../host is splatted right in the middle
> of the dynamic per build output directory. Do these files get changed
> much in normal buildroot use, so they should stay in output?

Not quite replying to your question (Arnout has already done, with
great detail).

But I submitted a patch [0] to skip host-cmake building entirely. It
saves 30% of the build time in my setup. If you use cmake-based
packages, you might want to give it a try and give your feedback.

[0] http://patchwork.ozlabs.org/patch/579445/

-- 
Luca

-- 
Luca
