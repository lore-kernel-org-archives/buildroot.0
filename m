From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 10 Oct 2012 17:04:33 +0200
Subject: [Buildroot] [PATCH v9 06/10] cpanminus: new package
In-Reply-To: <20121008113710.4d01376c@skate>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-6-git-send-email-francois.perrad@gadz.org>
 <20121008113710.4d01376c@skate>
Message-ID: <CAB0FRssF7U6aU6+54=A1SERkkyw=eqm0yhMUN5jDQOC-ywN9fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Sat,  6 Oct 2012 15:53:49 +0200, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  package/Config.in                        |    5 ++++
>>  package/cpanminus/Config.in              |   36 +++++++++++++++++++++++
>>  package/cpanminus/cpanminus.mk           |   46 ++++++++++++++++++++++++++++++
>>  package/perl/perl-fix-Module-Build.patch |   16 +++++++++++
>>  4 files changed, 103 insertions(+)
>>  create mode 100644 package/cpanminus/Config.in
>>  create mode 100644 package/cpanminus/cpanminus.mk
>>  create mode 100644 package/perl/perl-fix-Module-Build.patch
>
> One thing that I'm wondering with cpanminus is how it interacts with
> the Buildroot mechanisms for download.
>

It doesn't interact.
cpanminus is not a CPAN client based on BR infrastructure.
I think what creating a CPAN client based on BR infrastructure could
be a nice project, but premature at this time.

But the reproductibility of a project (with an identified version of
each CPAN module) could be done with a local CPAN mirror.
A local CPAN mirror allows to work offline.
(see minicpan, http://search.cpan.org/~rjbs/CPAN-Mini-1.111009/bin/minicpan).
So, cpanminus does the job (with its way).

Fran?ois

> I.e :
>
>  *) Where does cpanminus downloads the Perl module tarballs?
>
>  *) Does it re-use the downloaded tarballs between rebuilds?
>
>  *) Is there a way to tell it to download its tarballs in $(DL_DIR) ?
>
>  *) Is there a way to have "make source" work properly, i.e ask
>     cpanminus to download the tarballs that it will need so that
>     offline builds are possible.
>
>  *) Is it possible to make it play nice with BR2_PRIMARY_SITE ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
