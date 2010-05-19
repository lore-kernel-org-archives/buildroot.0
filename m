From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 May 2010 12:21:40 +0200
Subject: [Buildroot] Custom packages: downloading non-tarball packages
In-Reply-To: <AANLkTin1HjC23NvIyQVP2yzNQIYGaNLUIa88NWWnWIKn@mail.gmail.com>
References: <AANLkTin1HjC23NvIyQVP2yzNQIYGaNLUIa88NWWnWIKn@mail.gmail.com>
Message-ID: <20100519122140.51743f4e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jonathan,

On Mon, 17 May 2010 21:42:30 -0400
Jonathan Bowman <bowmanjd@gmail.com> wrote:

> I am new to buildroot, but thanks to an elegant interface and clear
> documentation, it is serving my needs quite nicely.

Thank you :)

> However, I do have a question regarding best practices. I note that in
> the documentation it is not recommended to use the "manual" method in
> the makefiles of new packages.

Yes, correct.

> However, I do not see in the other methods how to deal with sources
> that are not tarballs. Some code (strangely) only comes in zip files,
> while other code I would prefer to download using svn, git, or
> another system.
> 
> Is there a recommended practice for these scenarios?

It is true that today both package infrastructure (generic and
autotools) assume that the package is retrieved as a tarball from a
http or ftp server. These infrastructures could of course be extended
to handle svn, git or even zip files.

.zip files should be handled automatically just as we handle .tar.gz
and .tar.bz2 today. This would require some modifications in
package/Makefile.package.in in the $(BUILD_DIR)/%/.stamp_extracted
target.

For git/svn, we could probably act differently in the download stage if
the URL starts with git:// or svn://. But we need to define what the
semantic of <pkg>_VERSION, <pkg>_SOURCE, <pkg>_SITE will be, how this
should interact with the directory that caches downloads and how build
directories should be named.

Don't hesitate to make proposals, either in the form of patches or in
the form of small design documents.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
