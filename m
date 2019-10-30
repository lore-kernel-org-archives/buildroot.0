From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 11:19:53 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <20191030090924.GB2604@scaer>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
 <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be> <20191030090924.GB2604@scaer>
Message-ID: <e39aac32-a53c-0b21-c980-07c50d1bdc00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/2019 10:09, Yann E. MORIN wrote:
[snip]
> On 2019-10-29 23:40 +0100, Arnout Vandecappelle spake thusly:
>> On 29/10/2019 10:51, Micka?l Tansorier wrote:
>>> `web-legal-info` depend on `legal-info`, because it use output
>>> of legal info to generate html web page.
> [--SNIP--]
>>> +.PHONY: web-legal-info
>>> +web-legal-info: legal-info
>>
>>  I was going to suggest to put this directly into the legal-info target.
>> However, since we no longer have a dependency on Python, we shouldn't rely on
>> Python scripts in our "normal" path, so it's OK as is.
> 
> Well, this is not what we concluded during the devdays, and Thomas
> already replied that we wanted to have this included in the existing
> legal-info target. Also, the manual already states:
> 
>     http://nightly.buildroot.org/#requirement-optional
> 
>     Some features or utilities in Buildroot, like the legal-info, or
>     the graph generation tools, have additional dependencies. Although
>     they are not mandatory for a simple build, they are still highly
>     recommended:
> 
>      * python (version 2.7 or any later)
> 
> So, I agree with Thomas that this should be included in legal-info, and
> not a new separate target.

 The problem is: I would like to have some autobuilders without installed
python. Since the autobuilders do run legal-info, that would not be possible...

 Maybe we should autodetect if python is available and skip this if not?


> 
> Also, have you had a look at Nicolas' alternate proposal, which is much
> more lightweight and simple:
>     http://lists.busybox.net/pipermail/buildroot/2019-October/264344.html

 Ah, yes, I was conflating the two.

 Mickae?l, could you look at Nicolas' proposal and check if it fits your needs?

 Note that that patch is missing a documentation update (which could be done in
a separate patch).

> 
> Basically, it justs creates an xml file from the csv, and when one opens
> it in a browser, it is properly rendered thanks to the accompanying xsl
> template. We don't want to make it too complex
> 
> [--SNIP--]
>>> +# and folders:
>>> +#   - `sources`
>>> +#   - `host-sources`
>>> +#
>>> +# Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>
>>
>>  Small nit: copyright statement should come before the rest.
>>
>>  I would also like to this opportunity to start using SPDX license identifiers
>> in our code. So it should start with
>>
>> # SPDX-License-Identifier: GPL-2.0-or-later
>> #
>> # Copyright (C) 2019 Micka?l TANSORIER <mickael.tansorier@smile.fr>
> 
> Such copyright identifiers are not required: the Berne Convention states
> that the copyright is implicit, that is, a work does not have to carry a
> copyright identifier to be properly copyrighted [https://en.wikipedia.org/wiki/Berne_Convention].

 However, all open source licenses (GPL, BSD, MIT, ...) kind of require it,
because they require to mention the authors. Some projects (e.g. CMake) keep an
explicit list of authors in the top-level LICENSE file. Other projects just say
"the FOO contributors". Oh, and REUSE [1] requires it as well. And finally:
(almost?) all our existing scripts do have a copyright line.


> Also, as time passes, other contributors will modify this script. We do
> not want to have a copyright identifier for each and every contribution
> that will be made to this script. Especially since the git log keeps an
> accurate authorship of all contributors.
> 
> So I would suggest we do add such new copyright identifiers, and get rid
> of the existing ones (as time passes).

 We should decide on a convention and stick to it :-)

 Regards,
 Arnout


> 
> Regards,
> Yann E. MORIN.

[1] https://reuse.software/
