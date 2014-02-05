From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 18:45:55 +0100
Subject: [Buildroot] [pkg-perl infra V3 09/12] manual: adding packages
 perl
In-Reply-To: <20140204105740.GF3454@free.fr>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <1385198749-6249-10-git-send-email-francois.perrad@gadz.org>
 <20140204105740.GF3454@free.fr>
Message-ID: <52F278D3.1020104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 11:57, Yann E. MORIN wrote:
> Fran?ois, All,
> 
> On 2013-11-23 10:25 +0100, Francois Perrad spake thusly:
>> diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
>> new file mode 100644
>> index 0000000..4efc53a
>> --- /dev/null
>> +++ b/docs/manual/adding-packages-perl.txt
>> @@ -0,0 +1,91 @@
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
>> +First, let's see how to NOT write a +.mk+ file for a Perl/CPAN package,
>> +with an example :
> 
> I don't really like the way you introduce this by stating "how NOT to [...]".
> 
> I would prefer that you straight from the start state that they are
> generated files, and still describe all the entries later. Maybe
> something like:
> 
>     ---8<---
>     The +.mk+ files for perl packages are generated files, by running
>     the script +support/scripts/scancpan+ fron Buildroot's top
>     directory:
> 
>     ---
>     support/scripts/scancpan foo-bar
>     ---
> 
>     In most cases, this script will generate a correct +.mk+ file,
>     but in some cases (eg. when adding a native C dependency), manual
>     editing might be needed.

 Actually, in most cases manual editing is needed to add _LICENSE_FILES.

[snip]
>> +The main macro of the Perl/CPAN package infrastructure is
> 
> Since you here mix perl and cpan, I wonder if the best name for this
> infra is perl or cpan.
> 
> For example, the luarocks infra we recently added is called 'luarocks',
> as per the repository of lua paclage, not 'lua' as per the language
> name.
> 
> So maybe we should call this perl infdra cpan instead. Any comment
> against that?

 Sounds like a good idea to me. Then you also see the relation between
package/pkg-cpan.mk and package/cpan (like for cmake).


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
