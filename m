From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 8 Feb 2016 12:14:35 -0800
Subject: [Buildroot] Speeding up the Build
In-Reply-To: <56B6021E.3070608@lucaceresoli.net>
References: <CAJJ6jxvwFavFNNVMnBuCGr4hmEgOdRzyU6XDx=_9bF9a9FUn5Q@mail.gmail.com>
 <56B6021E.3070608@lucaceresoli.net>
Message-ID: <CAJJ6jxs8G9i=K-qCCu29LZe0ro-kEjJeVTOHiEgEmmP88O=taQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 6, 2016 at 6:24 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Steve,
>
> Steve Calfee wrote:
>>
<snip>
>> Is there any way to share the host built utilities? It could be done
>> like using a pre-built toolchain, or some kind of special links for
>> output/host. The problem is .../host is splatted right in the middle
>> of the dynamic per build output directory. Do these files get changed
>> much in normal buildroot use, so they should stay in output?
>
>
> Not quite replying to your question (Arnout has already done, with
> great detail).
>
> But I submitted a patch [0] to skip host-cmake building entirely. It
> saves 30% of the build time in my setup. If you use cmake-based
> packages, you might want to give it a try and give your feedback.
>
> [0] http://patchwork.ozlabs.org/patch/579445/
>
> --
> Luca


Sorry I don't use CMAKE. Could your solution be extended to other host
packages? Python for instance takes a long time to build and I have
one installed. Unless we are patching the host tool or require a
special version, it would build faster if buildroot used the installed
version rather than building. I mean generically it would be nice.

Steve
