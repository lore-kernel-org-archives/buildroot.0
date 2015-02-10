From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 10 Feb 2015 20:34:11 +0100
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure:
 missing dependency ExtUtils/MakeMaker
In-Reply-To: <20150210153136.C133880E35@busybox.osuosl.org>
References: <bug-7772-163@https.bugs.busybox.net/>
 <20150210153136.C133880E35@busybox.osuosl.org>
Message-ID: <CAB0FRsuumK_7m-4Sy5mO3cJ4e89GXHeaPfgti-Aoccdf_XqqcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-02-10 16:31 GMT+01:00  <bugzilla@busybox.net>:
> https://bugs.busybox.net/show_bug.cgi?id=7772
>
> --- Comment #3 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-02-10 15:31:36 UTC ---
> (In reply to comment #2)
>> Vicente, saiberion: would you mind sending the proposed patch to the mailing
>> list?
>
> Hello Thomas,
>
> shouldn't we have an agreement on what would be the solution to this?
>
> a) adding the perl-ExtUtils-MakeMaker package to Buildroot
> b) adding a dependency check as saiberion did
>
> I personally don't like the option b), because I like to be able to use
> Buildroot having the minimum packages installed. And, if we keep doing this, we
> could end with a loooong list of dependencies to use Buildroot. I think it's
> better to add the perl-ExtUtils-MakeMaker instead.
>
> Maybe Francois Perrad has something to say about this since he seems to be the
> perl maintaner in Buildroot.
>

libxml-parser-perl works with the system perl (not a host-perl built by BR).
ExtUtils-MakeMaker is a core Perl module, especially the module which
allows to install other modules.
So, it comes with the system perl package of your distribution.
The Makefile.PL of XML-Parser 2.41 uses ExtUtils-MakeMaker without a
specific version requirement,
so the system ExtUtils-MakeMaker module doesn't require an update.

Could you post the full output of following commands (outside BR environment):
    $ perl -V
    $ perl -e "use ExtUtils::MakeMaker; print qq{ok\n};"

and in BR environment:
    $ make libxml-parser-perl-dirclean
    $ make libxml-parser-perl-configure

Fran?ois

> --
> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
