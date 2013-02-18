From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 18 Feb 2013 20:37:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-12
In-Reply-To: <20130215055400.6688c117@skate>
References: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
 <511D556D.3060503@lucaceresoli.net> <20130215055400.6688c117@skate>
Message-ID: <512282EB.7070702@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Thu, 14 Feb 2013 22:21:49 +0100, Luca Ceresoli wrote:
>
>> Should I send a patch to set -no-pch? I'm reluctant because it's not a real
>> fix, and compile time could increase significantly, I guess.
>>
>> Thomas, this probably affects Qt5 Beta 1 as well, according to this blog
>> post:
>> http://gpupowered.org/node/14. Would you mind testing it on your Qt5 branch?
> For Qt5, I do have -no-pch otherwise it doesn't build
> (http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c1f7b9967d814e3f5c838e7090ac04b9d06af51).
> Apparently, there are bugs in the precompiled headers implementation.

Given that precompiled headers are disabled when using ccache, and they are
broken otherwise (at least with some toolchains), I think it's best to just
add -no-pch inconditionally.

I'll send a patch that does so, and copy your comment at the commit you
pointedme to:

 > -no-pch to workaround the issue described at
 > http://comments.gmane.org/gmane.comp.lib.qt.devel/5933

You might want to sign off the patch then.

Luca
