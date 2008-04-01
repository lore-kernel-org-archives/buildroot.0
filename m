From: Will Newton <will.newton@gmail.com>
Date: Tue, 1 Apr 2008 16:20:45 +0100
Subject: [Buildroot] [PATCH] Return appropriate error code from pkgconfig
	script
Message-ID: <87a5b0800804010820h4118cf5exe610b2af9d8e8213@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently the wrapper script for pkgconfig clobbers the return status
of pkgconfig. This is a problem for example when someone tries to run
"pkgconfig --exists". This patch should allow the correct return code
to be passed through. Note it uses the "pipefail" option that was
introduced with bash 3.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pkgconfig-filter.patch
Type: text/x-diff
Size: 493 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080401/81cc16fe/attachment-0001.patch 
