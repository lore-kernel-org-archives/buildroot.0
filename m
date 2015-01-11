From: Thomas Ruschival <t.ruschival@gmail.com>
Date: Sun, 11 Jan 2015 18:29:01 -0200
Subject: [Buildroot] Repository information during build
Message-ID: <CAAOPk_zdYo4RhifBpQq8mtBQmt4_xfmhm0rQw+ubZ9DOUDy1SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In a cmake project I use a git and some cmake-macros to extract the current
commit hash of the source code and generate a C file with the information.
This way the executable can print out with the revision.

Using Buildroot this aproach fails rather obviously. (Buildroot clones the
repository, checks out the requested branch/tag/commit and generates a
tarball without the git information which is used for build)

I extended the CMakeLists of the project, The git-revision can be also
passed as definition (cmake -DGIT_COMMIT_HASH=12345 ....) and cmake only
uses git to get the commit hash if it is not defined.

Is there a canonical way to access the git revision of a package in the
package.mk file to pass it to the build of the package?

I.e. how do I find out the revision of the "master" branch Buildroot used
to create the tarball?

Thanks in advance & Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150111/06770916/attachment.html>
