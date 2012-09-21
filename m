From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 21 Sep 2012 20:25:14 +0200
Subject: [Buildroot] [PATCH 06/13] cpanminus: new package v3
In-Reply-To: <505B8C14.5090103@mind.be>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-6-git-send-email-francois.perrad@gadz.org>
 <20120920220418.65bb6b14@skate> <505B8C14.5090103@mind.be>
Message-ID: <CAB0FRsv6CbPpvsYaA0cdJLA_qu+8zBg1TTkdSUDiWhVi1poW3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/9/20 Arnout Vandecappelle <arnout@mind.be>:
> On 09/20/12 22:04, Thomas Petazzoni wrote:
>>
>> Hum, do we really want a package which has configuration options that
>> allow to select a set of libraries/modules to be downloaded and
>> installed? It would be more natural to have those Perl modules properly
>> packaged into Buildroot, no? I suspect that they are all packaged
>> similarly, so a $(perl-package) infrastructure would work quite well.
>>
>> This way, we still have the usual package infrastructure for licensing
>> report and things like this. I honestly don't know if we want packages
>> whose job is in turn to download/install a bunch of other things. It's
>> smart, but I'm not sure we want that.
>
>
>  I'm not sure we want to add 100,000 .mk files either...
>
>  Ideally, the cpanminus module should be able to do the right thing for
> the -source, -source-check and -legal-info targets.
>

Perl is useless without a CPAN client.
The Perl packages are fine grained (compared to Python or Ruby ones),
for example the web framework Dancer (without any plugins) requires 22
dependencies (direct or indirect).
Debian has more then thousand Perl packages; I don't want to do the same thing.

Most of CPAN packages haven't a license file; usually the
documentation contains an information, like : "LICENSE - same as Perl
itself".

The reproductibility of a project (with an identified version of each
CPAN module) could be done with a local CPAN mirror.

Fran?ois

>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
