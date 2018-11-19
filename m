From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 19 Nov 2018 20:57:32 -0200
Subject: [Buildroot] [RFC 2/4] support/testing: add perl-time-hires test
References: <CAB0FRsuRPxXBA80jCnj8WLvNHvZEujWY+CA5-AqVG6q_u5RkTg@mail.gmail.com>
Message-ID: <5bf33fdc45405_133b3fef2209088448826@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Nov 19, 2018 at 05:29 PM, Fran?ois Perrad wrote:

> Le lun. 19 nov. 2018 ? 02:14, Ricardo Martincoski <
> ricardo.martincoski at gmail.com> a ?crit :
[snip]
>> Another way to test a perl package would be to have an script added to the
>> image
>> in build time, something like this:
>> sample_perl_time_hires.pl:
>> |use Time::HiRes;
>> |
>> |Time::HiRes::usleep(1_000_000)
>>
>> And call:
>> perl sample_perl_time_hires.pl
>>
>> This way we could test scripts with a few lines of code and keep it
>> readable in
>> the tree.
>>
>>
> With the current TestPerl class, this test could be written as:
>         self.module_test("Time::HiRes", "Time::HiRes::usleep(1_000_000);")
> A long oneliner script could be written with a multiline layout, like this:
>         self.module_test("Time::HiRes", "use strict;" +
>                                         "use warnings;" +
>                                         "Time::HiRes::usleep(1_000_000);")
> So, we don't need to handle sample_perl_*.pl scripts.
> Same thing with Lua.

This is (kind of) how we were handling the tests for python packages before.

But you have a point.

Testing python packages got really messy when a class was needed in the script
because of the indentation. In those cases a oneliner was not enough.
Lua and Perl packages can always be tested with oneliners AFAIK.

Another issue that made python scripts less readable was the escaping for string
delimiters.
I guess that for lua and perl scripts we can always use those fancy quotes
([[string]], q{string}) when needed.

If Thomas and Arnout don't disagree, let's keep using oneliners to test lua and
perl packages, as you originally proposed.


Regards,
Ricardo
