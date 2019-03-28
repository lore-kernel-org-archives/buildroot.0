From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 29 Mar 2019 00:51:23 +0530
Subject: [Buildroot] [PATCH] package/unixbench: new package
In-Reply-To: <81f09ffd-c49d-d42a-3d90-36d022bb79fe@gmail.com>
References: <20190324175940.25686-1-itsatharva@gmail.com>
 <81f09ffd-c49d-d42a-3d90-36d022bb79fe@gmail.com>
Message-ID: <CABM+sgoxu5jXF0_YFaYeFDdni+5rv-ajxucvran6VvEUiiMsOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Romain, all:

Sending a v2 patch soon. Hopefully I addressed all of your concerns and
suggestions.

> Also use a git formatted patch since the upstream project use git.
> You should just remove these lines instead.

Fixed in v2.

> Perl is a runtime dependency (add a comment # Runtime).
> Also, since perl package depends on MMU unixbench must also depend on it.
> I believe, unixbench should depend on perl instead.
> The user must select perl interpreter in order to be able to select
unixbench.

Fixed MMU dependency. In case of Perl, it may not be obvious to the user
that UnixBench depends
on Perl. Hence, after discussing with Yann, we decided to select Perl
instead of depending on it.

> So, how behave/build these graphics tests if the target doesn't have a
GPU ?

On close inspection, turns out that GPU benchmarks are disabled in
UnixBench's makefile by default.
Yann recommended to keep the GPU benchmarks disabled.

> unixbench script needs bash interpreter here.
> sh should be enough.

Fixed in v2.

> Why "Run" can't be used outside of /usr/lib/unixbench ?

All the necessary directories (pgms, results) are defined as a relative
path instead of an absolute
path in "Run". And since we copy the directories to /usr/lib/unixbench, Run
cannot function properly
outside of that directory.

> Add a hash for the LICENSE.txt file.
> Add a comment to explain why you are using this specific hash.
> I only see pgms, testdir and Run inside UnixBench directory.
> testdir doesn't seems useful on the target.
Fixed in v2.

> results and tmp are probably generated while building unixbench package.

Results is necessary to save the output. tmp was not required and isn't
being copied in v2.

Thank you for the suggestions.

Regards,
Atharva
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190329/fb158ebc/attachment.html>
