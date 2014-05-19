From: g4 at novadsp.com <g4@novadsp.com>
Date: Mon, 19 May 2014 10:52:58 +0100
Subject: [Buildroot] Problems building for Olimex A13. A new user
	enquires ...
In-Reply-To: <20140519025610.GE27238@tarshish>
References: <09d801cf72fa$f6cc2c40$e46484c0$@novadsp.com>
 <20140519025610.GE27238@tarshish>
Message-ID: <0ade01cf7348$1daadc10$59009430$@novadsp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch.

Attached as A13.config. Modified to set up as follows:

BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="sunxi"
BR2_TARGET_UBOOT_VERSION="sunxi"

Even though I can pull and build u-boot on its own Buildroot still fails as
shown below. I realize this is bound to be user error so thanks again.

inux-uclibcgnueabi-" ARCH=arm A13-Olimex_config
make[1]: Entering directory
`/home/jevans/olimex/buildroot/output/build/uboot-b5bd4c92b2'
make[1]: Leaving directory
`/home/jevans/olimex/buildroot/output/build/uboot-b5bd4c92b2'
make[1]: Entering directory
`/home/jevans/olimex/buildroot/output/build/uboot-b5bd4c92b2'
make: *** No rule to make target `A13-Olimex_config'.  Stop.
make[1]: *** [A13-Olimex_config] Error 1
make[1]: Leaving directory
`/home/jevans/olimex/buildroot/output/build/uboot-b5bd4c92b2'
make: ***
[/home/jevans/olimex/buildroot/output/build/uboot-b5bd4c92b2/.stamp_configur
ed] Error 2

-----Original Message-----
From: Baruch Siach [mailto:baruch at tkos.co.il] 
Sent: 19 May 2014 03:56
To: g4 at novadsp.com
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Problems building for Olimex A13. A new user
enquires ...

Hi Jerry,

On Mon, May 19, 2014 at 01:40:42AM +0100, g4 at novadsp.com wrote:
> First off: Thanks for Buildroot. 
> 
> Second: Building on a Xubuntu 14.04 Virtual Box guest using Buildroot
> 2014-05-RC1
> 
> Thirdly: Please advise If there is a better place (to ask questions 
> :))
> 
> I have set up a .config (attached if this helps)

Is it? I couldn't find one (and it really helps).

baruch

> which builds quite happily
> from scratch until the board specific u-boot. The u-boot URL has been 
> changed to https://github.com/linux-sunxi/u-boot-sunxi.git.
> 
> This is possibly a slightly odd combination as I'm trying to build 
> using a board-specific u-boot with the mainline kernel sources (3.14.4).
> 
> The symptoms of the problem are below. I note this:
> http://stackoverflow.com/questions/17216067/git-clone-b-tag-results-in
> -warni ng-remote-branch-not-found-in-upstream-origi
> 
> How best to fix/resolve this? Is it a .config problem?
> 
> Many thanks.
> 
> Jerry.
> 
> --------------------------snip------------------------------
> make[1]: Leaving directory `/home/jevans/olimex/buildroot'
> >>> uboot  Downloading
> Doing shallow clone
> Cloning into 'uboot-'...
> warning: Could not find remote branch --bare to clone.
> fatal: Remote branch --bare not found in upstream origin Unexpected 
> end of command stream Doing full clone Cloning into bare repository 
> 'uboot-'...
> remote: Reusing existing pack: 261244, done.
> remote: Counting objects: 52, done.
> remote: Compressing objects: 100% (52/52), done.
> remote: Total 261296 (delta 29), reused 2 (delta 0) Receiving objects: 
> 100% (261296/261296), 72.68 MiB | 228.00 KiB/s, done.
> Resolving deltas: 100% (205455/205455), done.
> Checking connectivity... done.
> usage: git archive [options] <tree-ish> [<path>...]
>    or: git archive --list
>    or: git archive --remote <repo> [--exec <cmd>] [options] <tree-ish> 
> [<path>...]
>    or: git archive --remote <repo> [--exec <cmd>] --list
> 
>     --format <fmt>        archive format
>     --prefix <prefix>     prepend prefix to each pathname in the archive
>     -o, --output <file>   write the archive to this file
>     --worktree-attributes
>                           read .gitattributes in working directory
>     -v, --verbose         report archived files on stderr
>     -0                    store only
>     -1                    compress faster
>     -9                    compress better
> 
>     -l, --list            list supported archive formats
> 
>     --remote <repo>       retrieve the archive from remote repository
<repo>
>     --exec <command>      path to the remote git-upload-archive command
> 
> --2014-05-19 01:03:33--  http://sources.buildroot.net/uboot-.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 
> 176.9.16.109 Connecting to sources.buildroot.net 
> (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-05-19 01:03:33 ERROR 404: Not Found.
> 
> make: ***
> [/home/jevans/olimex/buildroot/output/build/uboot-/.stamp_downloaded] 
> Error
> 1
> jevans at xub64:~/olimex/buildroot$
> jevans at xub64:~/olimex/buildroot/output/build$ make
> make: *** No targets specified and no makefile found. Stop.
> jevans at xub64:~/olimex/buildroot/output/build$

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
A non-text attachment was scrubbed...
Name: a13.config
Type: application/xml
Size: 43094 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140519/276dbf2f/attachment.wsdl>
