From: John Faith <jfaith@impinj.com>
Date: Tue, 13 Aug 2019 00:07:22 +0000
Subject: [Buildroot] Help with forcing a rebuild of the target
In-Reply-To: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
References: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
Message-ID: <c0ab1a51f65e35c589f71dee9629a54efea61de7.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2019-08-10 at 18:32 -0500, Jakob Cornell wrote:
Hi all,

Hi.


I've been working with Buildroot for a few weeks, and I occasionally find that I want to undo a change I've made to the 'output/target' tree. This is usually because I want to remove a file previously added using an overlay or because there are stale files leftover from a package that I've deselected.

So what I want to do, ideally, is run everything needed to fully populate the target filesystem, but also ensure that only what's needed is there. I've tried removing 'output/target' or individual files in it, but that often breaks the build. I've been resorting to doing a full clean and build, which is very wasteful. Is there any way to clean out the target tree and rebuild it without having to recompile anything?

In the output directory, I've done this:

rm -f build/*/.stamp_target_installed
rm -rf target
make

,
John

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190813/c6068f3c/attachment.html>
