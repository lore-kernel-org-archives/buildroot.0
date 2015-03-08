From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 7 Mar 2015 21:31:36 -0500
Subject: [Buildroot] [PATCH 1/2] package/openssl: Enable parallel build
In-Reply-To: <20141118225525.6e8b4e02@free-electrons.com>
References: <1416146446-27060-1-git-send-email-bernd.kuhls@t-online.de>
 <20141118225525.6e8b4e02@free-electrons.com>
Message-ID: <20150308023136.GS12857@vapier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 Nov 2014 22:55, Thomas Petazzoni wrote:
> Unfortunately, this patch is a fairly large patch, which is more a
> feature patch than a real fix. Could we instead get it merged upstream?

i've tried before and only got some of it in.  i could try again since upstream 
openssl has changed a bit.

> I discussed this with Yann, and I believe Peter will agree that it's a
> feature patch that we shouldn't take in Buildroot. The solutions are
> either to take this patch upstream, or in Buildroot build in parallel
> and then fallback to serial build if the parallel build has failed.
> Something along the lines of:
> 
> 	$(MAKE) -C $(@D) || $(MAKE1) -C $(@D)

unfortunately, that is not safe.  it might end up with incomplete static 
archives.  at least, that was some of the errors we saw in the past that 
made me investigate making openssl parallel safe.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150307/c15d7112/attachment.asc>
