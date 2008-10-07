From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 7 Oct 2008 16:19:41 +1100
Subject: [Buildroot] [buildroot 0005234]: Selecting MTD utils from
	git	doesn't give you the HEAD
In-Reply-To: <532a9ee2ed7a6e52612f1f2e0680f030@bugs.uclibc.org>
References: <532a9ee2ed7a6e52612f1f2e0680f030@bugs.uclibc.org>
Message-ID: <20081007051941.GD5127@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 03, 2008 at 09:42:04AM -0700, bugs at busybox.net wrote:
>  #############################################################
> -MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
> +MTD_VERSION:=HEAD

Not a good idea. I did this originally.

Problem is that it'll download head once, but nothing will cause it to
download head again (unless you remove the .tar.gz from the sources
directory). AND you don't know what version you have either if you want
to rebuild later.

Also, the patches won't necessarily apply to a later version.

A configuration option would be an improvement though it doesn't solve
the patch problem.

I think it really needs manual intervention, which is how it came to be
how it is now.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
