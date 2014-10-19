From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:06:49 +0200
Subject: [Buildroot] [PATCH v3] libevent: Use github call & fix patch
In-Reply-To: <1413713789-28767-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413713789-28767-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019170649.46a39583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 19 Oct 2014 12:16:29 +0200, Maxime Hadjinlian wrote:
> We want to use the github helper since we download a generated tarball
> from the tag anyway.
> 
> We also need to use AUTORECONF as those releases do not contains
> 'configure' and such.
> 
> The patch that was already present is updated to apply against
> Makefile.am instead of Makefile.in
> 
> The second patch is backported from upstream to remove the use of
> $(top_src_dirs) which makes current autotools error out.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I still don't understand the benefit of switching from a download place
that provides a tarball with the configure and Makefile.in already
generated to a place where those are not generated and will therefore
always require an autoreconf.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
