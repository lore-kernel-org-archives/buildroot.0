From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 8 Feb 2014 10:00:01 +0100
Subject: [Buildroot] [pkg-perl infra V5 7/8] manual: adding packages perl
In-Reply-To: <CAAXf6LUo+6h9HF8C+S9wgcqzL=Zjjz4BqtA2nj-xMcxmRzA=mg@mail.gmail.com>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
 <1391763337-30660-8-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LUo+6h9HF8C+S9wgcqzL=Zjjz4BqtA2nj-xMcxmRzA=mg@mail.gmail.com>
Message-ID: <CAB0FRsujUD_8cR4EzPuZtdGGd=O8=kESsZaboQXoE-AcYkeVrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-07 21:49 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> Hi Francois,
>
> On Fri, Feb 7, 2014 at 9:55 AM, Francois Perrad <fperrad@gmail.com> wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  docs/manual/adding-packages-perl.txt |  110 ++++++++++++++++++++++++++++++++++
>>  docs/manual/adding-packages.txt      |    2 +
>>  2 files changed, 112 insertions(+)
>>  create mode 100644 docs/manual/adding-packages-perl.txt
>>
>> diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
>> new file mode 100644
>> index 0000000..1e48df9
>> --- /dev/null
>> +++ b/docs/manual/adding-packages-perl.txt
>> @@ -0,0 +1,110 @@
>> +// -*- mode:doc; -*-
>> +// vim: set syntax=asciidoc:
>> +
>> +Infrastructure for Perl/CPAN packages
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +[[perl-package-tutorial]]
>> +
>> ++perl-package+ tutorial
>> +^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +First, let's see how to write a +.mk+ file for a Perl/CPAN package,
>> +with an example :
>> +
>> +------------------------
>> +01: ################################################################################
>> +02: #
>> +03: # perl-foo-bar
>> +04: #
>> +05: ################################################################################
>> +06:
>> +07: PERL_FOO_BAR_VERSION = 0.02
>> +08: PERL_FOO_BAR_SOURCE = Foo-Bar-$(PERL_FOO_BAR_VERSION).tar.gz
>> +09: PERL_FOO_BAR_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MO/MONGER/
>> +10: PERL_FOO_BAR_DEPENDENCIES = perl-strictures
>> +11: PERL_FOO_BAR_LICENSE = perl_5
>> +12: PERL_FOO_BAR_LICENSE_FILES = LICENSE
>
> Is 'perl_5' an actual license? Is it different than the Artistic License?
> SPDX specifies an 'Artistic-1.0-Perl':
> http://spdx.org/licenses/Artistic-1.0-Perl
>
> Is this the same license?
> In that case, I would prefer to use that identifier in the manual and
> all packages using this. Additionally, the list of identifiers in
> buildroot could be updated with that identifier too.
>

Here is an example with Compress-Snappy
The CPAN page http://search.cpan.org/~gray/Compress-Snappy-0.23/ contains :
        License     The Perl 5 License (Artistic 1 & GPL 1)
The result of http://explorer.metacpan.org/?url=/release/Compress-Snappy
contains :
      "license" : [
         "perl_5"
      ],
The script `scancpan` retrieves data from metacpan, so 'perl_5'.

The tarball Compress-Snappy contains no license file, but both
http://cpansearch.perl.org/src/GRAY/Compress-Snappy-0.23/README and
http://search.cpan.org/~gray/Compress-Snappy-0.23/lib/Compress/Snappy.pm
contain this statement :
    "This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself."

And Perl has 2 licenses : Artistic (v1) and GPL v1.

This is the Perl way.

Fran?ois

> Other than that:
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
