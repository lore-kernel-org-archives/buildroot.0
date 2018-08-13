From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2018 23:16:59 +0200
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <CALURroRRC9sPBLeAuv4=0XOwgGvnEZchKU03xxPtgn0Uheik3Q@mail.gmail.com>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
 <20180813185453.5b8bae4a@windsurf>
 <CALURroRRC9sPBLeAuv4=0XOwgGvnEZchKU03xxPtgn0Uheik3Q@mail.gmail.com>
Message-ID: <20180813211659.GG7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher, All,

On 2018-08-13 10:35 -0700, Christopher McCrory spake thusly:
> On Mon, Aug 13, 2018 at 9:54 AM, Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com> wrote:
>   > +? ? ? ? $license =~ s|lgpl|LGPL-2.1|;
>   Just "lgpl" always means it's LGPL-2.1 ?
> Apparently

IANAL...

Usually, if any license of the GPL familly is used without any version
specified, then it means just any version can be used:

    https://www.gnu.org/licenses/gpl.html

    14. Revised Versions of this License.

    [...]  If the Program does not specify a version number of the GNU
    General Public License, you may choose any version ever published
    by the Free Software Foundation.

Similar clauses can be had for each license. So I doubt 'lgpl' would
stand for LGPL-2.1.

Besides, see below...

>   > +? ? ? ? $license =~ s|bsd|BSD|;
>   "BSD" is not a license. There are several different BSD licenses.
>   Though with just "bsd" as an initial information, there's not much you
>   can do :-/
> 
> yea :(
> AFAICT, this is the source from Base.pm

What 'Base.pm' are you talink about? On my Ubuntu 17.10, I get:

    $ apt-file search /Base.pm |wc -l
    191

> ? my %licenses = (
> ??? perl???????? => 'Perl_5',
> ??? apache?????? => 'Apache_2_0',
> ??? apache_1_1?? => 'Apache_1_1',
> ??? artistic???? => 'Artistic_1',
> ??? artistic_2?? => 'Artistic_2',
> ??? lgpl???????? => 'LGPL_2_1',
> ??? lgpl2??????? => 'LGPL_2_1',
> ??? lgpl3??????? => 'LGPL_3_0',
> ??? bsd????????? => 'BSD',
> ??? gpl????????? => 'GPL_1',
> ??? gpl2???????? => 'GPL_2',
> ??? gpl3???????? => 'GPL_3',
> ??? mit????????? => 'MIT',
> ??? mozilla????? => 'Mozilla_1_1',
> ??? restrictive? => 'Restricted',
> ??? open_source? => undef,
> ??? unrestricted => undef,
> ??? unknown????? => undef,
> ? );
> 
> ?# TODO - would be nice to not have these here, since they're more
> ? # properly stored only in Software::License
> ? my %license_urls = (
> ??? perl???????? => 'http://dev.perl.org/licenses/',
> ??? apache?????? => 'http://apache.org/licenses/LICENSE-2.0',
> ??? apache_1_1?? => 'http://apache.org/licenses/LICENSE-1.1',
> ??? artistic???? => 'http://opensource.org/licenses/artistic-license.php',
> ??? artistic_2?? => 'http://opensource.org/licenses/artistic-license-2.0.php',
> ??? lgpl???????? => 'http://opensource.org/licenses/lgpl-license.php',
> ??? lgpl2??????? => 'http://opensource.org/licenses/lgpl-2.1.php',
> ??? lgpl3??????? => 'http://opensource.org/licenses/lgpl-3.0.html',
> ??? bsd????????? => 'http://opensource.org/licenses/bsd-license.php',
> ??? gpl????????? => 'http://opensource.org/licenses/gpl-license.php',
> ??? gpl2???????? => 'http://opensource.org/licenses/gpl-2.0.php',
> ??? gpl3???????? => 'http://opensource.org/licenses/gpl-3.0.html',
> ??? mit????????? => 'http://opensource.org/licenses/mit-license.php',
> ??? mozilla????? => 'http://opensource.org/licenses/mozilla1.1.php',
> ??? restrictive? => undef,
> ??? open_source? => undef,
> ??? unrestricted => undef,
> ??? unknown????? => undef,
> ? );

And at the same time, still on my Ubuntu 17.10, I was looking at
/usr/share/perl/5.26.0/CPAN/Meta/Converter.pm, which has;

    # The "old" values were defined by Module::Build, and were often vague.
    # I have
    # made the decisions below based on reading Module::Build::API and how
    # clearly
    # it specifies the version of the license.
    my %license_map_2 = (
      (map { $_ => $_ } @valid_licenses_2),
      apache      => 'apache_2_0',  # clearly stated as 2.0
      artistic    => 'artistic_1',  # clearly stated as 1
      artistic2   => 'artistic_2',  # clearly stated as 2
      gpl         => 'open_source', # we don't know which GPL; punt
      lgpl        => 'open_source', # we don't know which LGPL; punt
      mozilla     => 'open_source', # we don't know which MPL; punt
      perl        => 'perl_5',      # clearly Perl 5
      restrictive => 'restricted',
    );

So... The resolution is not that clear-cut IMNSHO...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
