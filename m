From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 07 Feb 2012 18:08:43 +0100
Subject: [Buildroot] Customize package not copy .svn .git etc?
In-Reply-To: <jgrkfd$m8n$1@dough.gmane.org>
References: <jgrkfd$m8n$1@dough.gmane.org>
Message-ID: <4F315A9B.1000207@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

Grant Edwards wrote:
> Do other users of the customize package not use svn, git, CVS, etc?

During the Buildroot Developers Day last Friday we agreed that the
customize package is not well-written and not satisfactory, thus it will
be deprecated in 2012.02 and removed in a following release.

A much better method to obtain the same result is to put your board
specific files in board/<company>/<project>/rootfs-additions/, and write
a command in the post-build script to copy these files onto the target
root filesystem.

For more details, see http://free-electrons.com/blog/elce-2011-videos/,
search for "Using Buildroot For a Real Project". There's a video of
Thomas Petazzoni with many best practices for using Buildroot.
My above suggestion comes from slide 24 of his presentation. Thanks
Thomas.

Ah, actually this won't solve your problem with some version control
systems such as Subversion < 1.7 or CVS which create hidden directories
for their metadata.
To solve this problem you should, in my personal order of preference:
- use git, which creates only one hidden dir in the project root, or
- upgrade to Subversion >= 1.7, which created only one dir as git
   does, or
- write your post-build script so that it bypasses .svn and CVS dirs,
   for example using the find command.

Luca
