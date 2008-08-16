From: jazzman at exdomain.org <jazzman@exdomain.org>
Date: Fri, 15 Aug 2008 23:30:00 -0400 (EDT)
Subject: [Buildroot] Buildroot not installing TAR or SED (7-28-08 snapshot)
Message-ID: <Pine.LNX.4.44.0808152329330.13212-100000@exdomain.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I'm trying to build a uclibc toolchain that I can the use to build an
embedded linux as a project. I've got the 7/28/08 snapshot of buildroot 
and
it builds just fine, but it leaves out 2 packages. I have explicitly 
checked
"SED" and "TAR" in packages for target filesystem, and it appears to have
downloaded the source for them but they do are not installed in the final
filesystem.

Originally I was using busybox for these tools, but the busybox
implementations of TAR and AR have some problems that prevent me from
compiling some things (AR doesn't support -u apparently, and TAR
occasionally gives "Invalid TAR Magic" for some files, which prevents me
from building X). So I left busybox out and now I don't have TAR or SED. I
tried building TAR with the generated root file system, but it requires 
SED
to run the configure script. So I tried to compile SED, but guess what? It
ALSO requires SED to run the configure script.

So then i tried to build busybox but not have it install any of the 
symlinks
so that I could use busybox's SED to at least build the full SED and then 
go
from there, but no matter what I do busybox insists on installing it's
symlinks (even when I manually edited the config file for busybox to NOT
install symlinks) and that overwrites things like ar. This is a problem
because, as previously stated, busybox's AR does not have the -u option,
which causes errors when building SED. It's a vicious cycle :)

Does anyone have any ideas why I can't get buildroot to just build/install
SED and TAR in the first place?!?

Thanks in advance
Marc
