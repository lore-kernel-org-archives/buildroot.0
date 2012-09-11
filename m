From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 10:26:29 -0400
Subject: [Buildroot]  Buildroot customizations as a git submodule?
Message-ID: <CADiAo4KpKSJT8j7KJuL6nkFWRsw=Fx+597hi4FrzkjoFoKj+yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel,

Daniel wrote:

> How do you folks on this mailing list manage your customizations on Buildroot?

I have something like this in use, although not as a git submodule but
rather as a group of git repos under Google's repo utility management
(the same utility was used in Android source tree management).

See http://gitorious.org/lfa, and specifically:

http://gitorious.org/lfa/build/trees/master - this repo contains the
necessary submakefile
http://gitorious.org/lfa/myroot/trees/master - this repo contains a
project with private packages
http://gitorious.org/lfa/lfa-manifest/trees/master - this repo
contains an XML manifest file to put things together.

At the top level it looks like a directory with three subdirs: myroot,
buildroot, and build. Technicaly it should be possible to add more
repos for custom packages to manage them under the same source tree.

All private packages are symlinked to the Buildroot tree (under
"packages"), so Buildroot sources are not disturbed. Also,
build/Build.mk does some environment manipulations to run menuconfig
over an extended config file which also includes custom packages (in a
special section).

One thing which il likely not handled well, when a custom package has
the same name as an existing package, but IMHO such situation must be
avoided anyway.

Hope this helps.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
