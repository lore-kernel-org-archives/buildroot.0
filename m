From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 19 May 2014 01:40:42 +0100
Subject: [Buildroot] Problems building for Olimex A13. A new user enquires
	...
Message-ID: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First off: Thanks for Buildroot. 

Second: Building on a Xubuntu 14.04 Virtual Box guest using Buildroot
2014-05-RC1

Thirdly: Please advise If there is a better place (to ask questions :))

I have set up a .config (attached if this helps) which builds quite happily
from scratch until the board specific u-boot. The u-boot URL has been
changed to https://github.com/linux-sunxi/u-boot-sunxi.git.

This is possibly a slightly odd combination as I'm trying to build using a
board-specific u-boot with the mainline kernel sources (3.14.4). 

The symptoms of the problem are below. I note this:
http://stackoverflow.com/questions/17216067/git-clone-b-tag-results-in-warni
ng-remote-branch-not-found-in-upstream-origi

How best to fix/resolve this? Is it a .config problem?

Many thanks.

Jerry.

--------------------------snip------------------------------
make[1]: Leaving directory `/home/jevans/olimex/buildroot'
>>> uboot  Downloading
Doing shallow clone
Cloning into 'uboot-'...
warning: Could not find remote branch --bare to clone.
fatal: Remote branch --bare not found in upstream origin
Unexpected end of command stream
Doing full clone
Cloning into bare repository 'uboot-'...
remote: Reusing existing pack: 261244, done.
remote: Counting objects: 52, done.
remote: Compressing objects: 100% (52/52), done.
remote: Total 261296 (delta 29), reused 2 (delta 0)
Receiving objects: 100% (261296/261296), 72.68 MiB | 228.00 KiB/s, done.
Resolving deltas: 100% (205455/205455), done.
Checking connectivity... done.
usage: git archive [options] <tree-ish> [<path>...]
   or: git archive --list
   or: git archive --remote <repo> [--exec <cmd>] [options] <tree-ish>
[<path>...]
   or: git archive --remote <repo> [--exec <cmd>] --list

    --format <fmt>        archive format
    --prefix <prefix>     prepend prefix to each pathname in the archive
    -o, --output <file>   write the archive to this file
    --worktree-attributes
                          read .gitattributes in working directory
    -v, --verbose         report archived files on stderr
    -0                    store only
    -1                    compress faster
    -9                    compress better

    -l, --list            list supported archive formats

    --remote <repo>       retrieve the archive from remote repository <repo>
    --exec <command>      path to the remote git-upload-archive command

--2014-05-19 01:03:33--  http://sources.buildroot.net/uboot-.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net
(sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2014-05-19 01:03:33 ERROR 404: Not Found.

make: ***
[/home/jevans/olimex/buildroot/output/build/uboot-/.stamp_downloaded] Error
1
jevans at xub64:~/olimex/buildroot$ 
jevans at xub64:~/olimex/buildroot/output/build$ make
make: *** No targets specified and no makefile found. Stop.
jevans at xub64:~/olimex/buildroot/output/build$ 
