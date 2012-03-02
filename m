From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Mar 2012 10:16:53 +0100
Subject: [Buildroot] DL_TOOLS_DEPENDENCIES and PRIMARY_SITE
Message-ID: <CAAXf6LXfd_w5muFabHEFxYKgCFSsrsCCX0Cqibpfz0o7NZt1wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Suppose you have a PRIMARY_SITE set for direct retrieval of source
tarballs instead of fetching them from the web, for example because
you want a self-contained buildroot distribution to give to others.

If you select a package that has git/svn/bzr/... as site method, then
the dependencies system will check for the availability of the
git/svn/bzr tools.
In case all tarballs are present on the PRIMARY_SITE, this check is
actually not needed and annoying, because you would have to e.g.
install 'git' even though it will never be used.

For me this is a problem, as the machines on which our builds are made
do not contain tools like git, and it's difficult to update them all.

Some suggested solutions:
1. change support/dependencies/dependencies.sh to output a warning
instead of an error for the DL_TOOLS. If the tool cannot be found when
used, the shell will throw an error.

2. when PRIMARY_SITE is set, don't fill DL_TOOLS at all (so don't
check in support/dependencies), and let the shell handle a missing
tool.

3. Don't check the DL_TOOLS in support/dependencies upfront, but
rather in the DOWNLOAD function when you actually need a certain tool.

I'm looking forward to your ideas about this.

Thanks,
 Thomas
