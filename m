From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Apr 2018 20:18:30 -0300
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
References: <20180415194915.GE21958@scaer>
Message-ID: <5ad3ddc6945b6_e202ab4a3c39380265b0@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 15, 2018 at 04:49 PM, Yann E. MORIN wrote:

>> Another concern is how to fix those autobuilders that have already
>> removed some random files from their cached Git repositories? Should we
>> ask the people who run those autobuilders to entirely wipe the download
>> folders of their autobuilder instances ? Or do we have a smart (but
>> simple) thing to do to avoid this ?
> 
> For this last part, we've already discused this with Ricardo in another
> thread: we run git-fsck, and if there is an error, we ditch the git tree
> and clone from scratch.
> 
> See the current work I have to further robustify (does that even exist?)
> the git backend:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/git-robust

Thank you for working on this. I can review the series.

I have some work in progress too (in early stages), but your series cover more
cases. If you like some lines of code from it, feel free to use them.
https://gitlab.com/RicardoMartincoski/buildroot/commits/ditch-restart-git-v1

The ditch and re-clone I did in a different way, without calling the script
again. Maybe I missed something.


Regards,
Ricardo
