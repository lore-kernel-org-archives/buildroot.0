From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 13 Jun 2014 11:23:14 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURzUZzenZMwfciAWQgQXFp7fbSg1wPHcJc54SCsmuUdhQ@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140606113148.464ff3c8@core2quad.morethan.org>
 <CAE9DZUTpc3+jAZKNi8mrDDTmZDyZUQ1Z_-aymUP6h743buZqRw@mail.gmail.com>
 <CAHkwnC8ZyLMTLeHH2CVDS__EQFU0bYcWWb12ppygreRDU70PPg@mail.gmail.com>
 <CAE9DZURzUZzenZMwfciAWQgQXFp7fbSg1wPHcJc54SCsmuUdhQ@mail.gmail.com>
Message-ID: <CAHkwnC8ud8QUt85XbHJfUnMvjXGbvWGtDqg_SuTyV_QJt2OUEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2014 at 7:41 PM, Dallas Clement
<dallas.a.clement@gmail.com> wrote:
> On Tue, Jun 10, 2014 at 4:32 AM, Fabio Porcedda <fabio.porcedda@gmail.com>
> wrote:
>>
>> On Fri, Jun 6, 2014 at 6:45 PM, Dallas Clement
>> <dallas.a.clement@gmail.com> wrote:
>> > On Fri, Jun 6, 2014 at 11:31 AM, Mike Zick <minimod@morethan.org> wrote:
<snip>
>> > This is a good idea.  I think I've exhausted most of the other options
>> > except for
>> > commenting out .NOTPARALLEL in the top-level make.  If that doesn't
>> > help,
>> > I will definitely try breaking things up.  Thanks for the tip.
>>
>> Please let me know if you have any issue using top-level parallel make.
>> I'm curently testing it and ironing it out.
>>
>> Best regards
>> --
>> Fabio Porcedda
>
>
>> Please let me know if you have any issue using top-level parallel make.
>> I'm curently testing it and ironing it out.
>
> So far, no serious issues.  It uncovered some hidden dependencies.  But I
> was warned about this.  ;)
>
> Surprisingly, it did not speed up my build times at all.  Perhaps this is
> due
> to a complex dependency graph.

Can you please send the graphs made by "make graph-depends" and
"make graph-build" for both serial and parallel and the output of the
time commands, i mean just the time command output not the complete
log:
"time make" and "time make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))"?

It's best if you don't attach those files to the email but use some
other way, e.g. dropbox.

Best regards
-- 
Fabio Porcedda
