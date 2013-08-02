From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Aug 2013 10:50:07 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
References: <20130731191415.545f7dff@skate>
 <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
 <20130801182311.6bb6e57e@skate>
 <CAHXCMMJacpBKoSpKH8NRtDyto92ZZ6AA2bh2jFyOZx4L00cxFw@mail.gmail.com>
 <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
Message-ID: <20130802105007.6957b0da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 2 Aug 2013 10:33:18 +0200, Thomas De Schampheleire wrote:

> I am currently used to -reconfigure and -rebuild to rebuild also the
> rootfs, but I also agree it's inconsistent with the other targets. If
> we want to be strict, then foo-reconfigure can only configure, not
> build. And foo-rebuild can only build.

Yerk, that's a bit ugly. foo-reconfigure removes the configure, build
stamp files as well as the host, staging, images and target install
stamp files. foo-rebuild does the same, except for the configure stamp
file.

So, I would find it strange if foo-reconfigure only did the configure
again and not the entire package build process. Same for foo-rebuild.

Remember, the use case for those is someone who is actively working on
the source code of a package (mainly when using the OVERRIDE_SRCDIR
thing or the local site method) and wants to be able to restart the
build of the package, just as if he was running 'make && make install'
in his package source code.

So the intention is really to have 'make foo-rebuild' do that 'make &&
make install' for the user, for the package <foo>.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
