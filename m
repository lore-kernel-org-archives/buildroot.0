From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Aug 2013 11:09:11 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130802105007.6957b0da@skate>
References: <20130731191415.545f7dff@skate>
 <CAHXCMMJ63sJ=m5V1c5+TqOn8TfdBop20gzDHjL85Ks1rYYU+-g@mail.gmail.com>
 <20130801182311.6bb6e57e@skate>
 <CAHXCMMJacpBKoSpKH8NRtDyto92ZZ6AA2bh2jFyOZx4L00cxFw@mail.gmail.com>
 <CAAXf6LXdqkH1ccdDNdUVdriKxKur3f8ZtV58AaCsQPspUxMLaw@mail.gmail.com>
 <20130802105007.6957b0da@skate>
Message-ID: <CAAXf6LUogmYufmPM9xDf4VjiNV_N_Vg+kuXvzL2ky7Pp0dcJHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 2, 2013 at 10:50 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 2 Aug 2013 10:33:18 +0200, Thomas De Schampheleire wrote:
>
>> I am currently used to -reconfigure and -rebuild to rebuild also the
>> rootfs, but I also agree it's inconsistent with the other targets. If
>> we want to be strict, then foo-reconfigure can only configure, not
>> build. And foo-rebuild can only build.
>
> Yerk, that's a bit ugly. foo-reconfigure removes the configure, build
> stamp files as well as the host, staging, images and target install
> stamp files. foo-rebuild does the same, except for the configure stamp
> file.
>
> So, I would find it strange if foo-reconfigure only did the configure
> again and not the entire package build process. Same for foo-rebuild.
>
> Remember, the use case for those is someone who is actively working on
> the source code of a package (mainly when using the OVERRIDE_SRCDIR
> thing or the local site method) and wants to be able to restart the
> build of the package, just as if he was running 'make && make install'
> in his package source code.
>
> So the intention is really to have 'make foo-rebuild' do that 'make &&
> make install' for the user, for the package <foo>.

As said, I don't have a problem with the existing
reconfigure-does-it-all approach.
I may have misunderstood the objections of others: there is no
objection against reconfigure doing also rebuild, only that
reconfigure and rebuild also make the rootfs?
