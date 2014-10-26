From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:01:44 +0100
Subject: [Buildroot] [PATCH v4] libevent: Use github call & fix patch
In-Reply-To: <1413739261-3675-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413739261-3675-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141026170144.0aaa3d00@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 19 Oct 2014 19:21:01 +0200, Maxime Hadjinlian wrote:
> We want to use the github helper since there is not a specific releases
> tarball that we can download, as specified in the manual.
> 
> This tarball is generated from the tag, which doesn't contains the
> autotools generated files, we then need to use AUTORECONF.
> 
> We want to use the github helper anyway as the current URL use an old
> GitHub feature which was called 'Download' where you could upload files
> along your repositories, theses files were not related to your tags.
> 
> This features has been replaced with the 'Release' option where you can
> create a release from a git tag. But these tarball are generated from
> the sources and they don't contains all the generated autotools file.
> 
> Since the old URL scheme can be deprecated at any time, we want to
> switch to the new URL scheme, which in the case of libevent, implies
>     having to do an AUTORECONF.
> 
> The patch that was already present is updated to apply against
> Makefile.am instead of Makefile.in
> 
> The second patch is backported from upstream to remove the use of
> $(top_src_dirs) which makes current autotools error out.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
