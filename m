From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Feb 2018 01:28:31 -0200
Subject: [Buildroot] [PATCH 12/14] size-stats-compare: fix code style
References: <20180203152413.GK2369@scaer>
Message-ID: <5a825b5fea220_51963fbb9ca374f047327@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Feb 03, 2018 at 01:24 PM, Yann E. MORIN wrote:

> On 2018-01-29 23:13 +0100, Thomas Petazzoni spake thusly:
>> On Sun, 21 Jan 2018 22:44:40 -0200, Ricardo Martincoski wrote:
>> > Fix these warnings:
>> > E129 visually indented line with same indent as next logical line
>> 
>> Really?
>> 
>> >      header = next(reader)
>> >      if (header[0] != 'File name' or header[1] != 'Package name' or
>> > -        header[2] != 'File size' or header[3] != 'Package size'):
>> > +            header[2] != 'File size' or header[3] != 'Package size'):
>> 
>> This looks totally bogus to me. The code was properly and nicely
>> indented before the change, and now it looks badly indented. Is this
>> really what flake8 wants? If so, flake8 is very strange.

Sorry. I failed to explore all possible acceptable formats, see below...

> 
> I guess it 's probably more about the following line than about hte
> previous one:
> 
>     if (header[0] != 'File name' or header[1] != 'Package name' or
>         header[2] != 'File size' or header[3] != 'Package size'):
>         print(("Input file %s does not contain the expected header. Are you "
> 
> ... where there could be confusion with the 'printf' line.

Yes. I think that's it.

> 
> Maybe the printf line could be indented one-level mnore, instead? Nope,
> that does not solve the issue. I guess flake8 does not do look-ahead...

Maybe one of these?

This I think it is uglier:

    if (
            header[0] != 'File name' or header[1] != 'Package name' or
            header[2] != 'File size' or header[3] != 'Package size'):
        print(("Input file %s does not contain the expected header. Are you "

... This is present in other scripts and I missed that in v1. I plan to use it
if you don't oppose to.

    if header[0] != 'File name' or header[1] != 'Package name' or \
       header[2] != 'File size' or header[3] != 'Package size':
        print(("Input file %s does not contain the expected header. Are you "

> 
> In this case, I would be happy with an exception...  # noqa E129

If we don't agree with this rule, perhaps is better to ignore it for any new
script, by adding this line to .flake8:
ignore=E129

Regards,
Ricardo
