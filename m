From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 4 Oct 2016 06:02:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl: bump version to 5.24.0
In-Reply-To: <20161003141728.25097-1-bernd.kuhls@t-online.de>
References: <20161003141728.25097-1-bernd.kuhls@t-online.de>
Message-ID: <CAB0FRstXs7JNhBzmYqRyOddDdBLNvHvwU=AkYFR6UfsFLvJZKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-10-03 16:17 GMT+02:00 Bernd Kuhls <bernd.kuhls@t-online.de>:
> perl-cross has a new version scheme since 1.1.0:
> https://github.com/arsv/perl-cross/releases
>
> perl does not contain a version-specific perldelta.pod anymore:
> https://rt.perl.org/Public/Bug/Display.html?id=129328#txn-1424561
>
> Therefore PERL_CROSS_SET_POD was changed accordingly.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/perl/perl.hash | 12 ++++++------
>  package/perl/perl.mk   | 16 +++++++---------
>  2 files changed, 13 insertions(+), 15 deletions(-)

perl-cross 1.1.0 is not mature (11 issues opened on september), it is
a full refactor, there are already 19 commits after this tag.

I never bump a perl version 5.x.0, I always wait the version 5.x.1

If you really need a perl 5.24.0, cross-compiled it with
perl-5.24.0-cross-1.0.3.

When I bump a perl version, I run on target the full Perl test suite
(~ 800 000 tests), and failures are not expected.
With cross-perl 1.0.3 and 1.1.0 tags, there have failures described in
https://github.com/arsv/perl-cross/issues/33

Please, revert this commit.

Fran?ois
