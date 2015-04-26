From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sun, 26 Apr 2015 11:45:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for
	internal toolchain
In-Reply-To: <20150426113742.182fa26b@free-electrons.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <1430040062-46308-2-git-send-email-kaszak@gmail.com>
 <20150426113742.182fa26b@free-electrons.com>
Message-ID: <CABbD_XCocg8xyZHE5rxAA3FUH5p2eGaFiKdaJhoaXhdFVingug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Well, even for external toolchains using the mtime on the compiler in
> $(HOST_DIR)/usr/bin will not work. Because the compiler in
> $(HOST_DIR)/usr/bin is not actually the compiler, but a binary wrapper
> built by Buildroot, for which the mtime will change at each build.
>

That is true, so the wrapper for external toolchains also needs the
extrafiles/hash solution. I simply missed this.


> I must say I don't quite like the fact that the solution used here is
> different between internal and external toolchain, but I haven't
> thought too much of the problem.
>

I thought this would be more efficient, but the above statement kills it.


> How would ccache work with external toolchains?
>

Well, using mtime is out of question because of the BR built wrapper, so it
requires the
same solution: a wrapper for ccache and using extrafiles/hash as for the
internal.

This means a wrapper will always be needed, and has to recognize the
toolchain - mtime for HOST_CC and EXTRAFILES for TARGET_CC always.

Kind regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150426/a70247b4/attachment.html>
