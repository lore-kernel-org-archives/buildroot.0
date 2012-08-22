From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 22 Aug 2012 16:10:08 +0200
Subject: [Buildroot] [PATCH 01/10] perl: new package
In-Reply-To: <CAB0FRstuezk2gsMk-CuhgiCzStj9YO3Ek8j9E8K+2kBo--9+6A@mail.gmail.com>
References: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
 <20120821131948.5e59085b@skate>
 <CAB0FRstuezk2gsMk-CuhgiCzStj9YO3Ek8j9E8K+2kBo--9+6A@mail.gmail.com>
Message-ID: <CAB0FRsuM_gVdCtQ-vTW-Gya-_vOgYihMs5akOyY9qXuJpWUEog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/21 Fran?ois Perrad <francois.perrad@gadz.org>:
> 2012/8/21 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Hello Fran?ois,
>>
>> Le Mon, 20 Aug 2012 10:55:00 +0200,
>> Francois Perrad <fperrad@gmail.com> a ?crit :
>>
>>> ---
>>>  package/Config.in                      |    1 +
>>>  package/perl/Config.in                 |   16 +++++
>>>  package/perl/perl-Makefile-SH.patch    |   28 ++++++++
>>>  package/perl/perl-configure-qemu.patch |   22 +++++++
>>>  package/perl/perl-fix-minitest.patch   |   96 +++++++++++++++++++++++++++
>>>  package/perl/perl-make-ext.patch       |   35 ++++++++++
>>>  package/perl/perl-mkppport.patch       |   36 ++++++++++
>>>  package/perl/perl.mk                   |  112 ++++++++++++++++++++++++++++++++
>>>  8 files changed, 346 insertions(+)
>>>  create mode 100644 package/perl/Config.in
>>>  create mode 100644 package/perl/perl-Makefile-SH.patch
>>>  create mode 100644 package/perl/perl-configure-qemu.patch
>>>  create mode 100644 package/perl/perl-fix-minitest.patch
>>>  create mode 100644 package/perl/perl-make-ext.patch
>>>  create mode 100644 package/perl/perl-mkppport.patch
>>>  create mode 100644 package/perl/perl.mk
>>
>> Thanks for this work on Perl. However, I find it lacks a bit of
>> background information. What is your patch series doing? Why would we
>> want to have three separate packages for Perl (perl, miniperl and
>> microperl)? We need some details to understand what you're proposing.
>>
>
> my goal is to run Dancer, a Perl web framework, see http://perldancer.org/
>
> microperl is an existing package, but Perl community want to remove it,
> because there is no use case for it. See
> http://www.nntp.perl.org/group/perl.perl5.porters/2012/08/msg190678.html
> I update (5.12.4 -> 5.14.2 -> 5.16.1) and try to improve this package.
> but microperl does not allow to run Dancer
>
> perl is obviously a full perl.
> miniperl is a perl without dynamic module loader (like microperl), so
> only pure Perl modules can be loaded (no XS module which contains
> native shared library).
> miniperl is usually used to bootstrap a full perl (so it is fully supported).
> miniperl and microperl are close, the difference is in the
> configuration step, microperl is zero-config, miniperl is configured
> like perl.
> after the removal of microperl, miniperl will be its replacement.
> (miniperl & microperl allows to run a web app based on the old fashion
> CGI module)
> the build process of perl and miniperl are close, but there don't
> share the same patches, it's the reason for 2 packages.

I refactor all my patches against perl distribution.
So, I could merge perl and miniperl packages.
I'll send a new patch serie.

Fran?ois

>
> finally, cpanminus is a CPAN client which allows me to fetch/install
> the module Dancer with its dependencies.
>
> Fran?ois.
>
> Note: please, don't apply the last patch 10/10 microperl: compatible
> with cpanminus
>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
