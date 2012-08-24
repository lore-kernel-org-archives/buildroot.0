From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Aug 2012 16:48:53 +0200
Subject: [Buildroot] [PATCH 2/4] zeromq: add license information
In-Reply-To: <CAHt8ZCN0P9_xEWzKhWcKLy=WixYoE8ZtVS0WYkmxT_Cu8ufrow@mail.gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
 <1345406924-6574-2-git-send-email-spdawson@gmail.com>
 <20120821124200.59ffab03@skate>
 <CAHt8ZCN0P9_xEWzKhWcKLy=WixYoE8ZtVS0WYkmxT_Cu8ufrow@mail.gmail.com>
Message-ID: <50379455.8090907@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon Dawson wrote:
> On 21 August 2012 11:42, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Le Sun, 19 Aug 2012 21:08:42 +0100,
>> spdawson at gmail.com a ?crit :
>>
>>> +ZEROMQ_LICENSE = GPLv3+
>>> +ZEROMQ_LICENSE_FILES = COPYING
>>
>> No. Most of ZeroMQ is apparently under the LGPLv3+, but the
>> COPYING.LESSER contains a special exception. This needs to be encoded
>> differently.
>
> Okay; thanks Thomas. It's not clear to me how properly to express that
> using the package license variables; I'll wait to see if there are any
> suggestions.

ZeroMQ COPYING.LESSER defines the project license in a quite complex way:
a GPLv3+ with exceptions, plus some parts licensed under the MIT (X11)
license:

 > Parts of the software are licensed under the MIT (X11) license as 
follows:
 >
 > Copyright (c) 2007-2010 Contributors as listed in AUTHORS
 >
 >  Permission is hereby granted, free of charge, to any person
 >  obtaining a copy of this software and associated documentation
...
(From COPYING.LESSER, bottom part)

However, their Wiki has a clarifying page:
http://www.zeromq.org/blog:rfc-0mq-contributions

Briefly:
  - ZeroMQ used to be "open source" (license not reported) with comtributor
    agreement;
  - then they started accepting contributions under the MIT/X11 license;
  - in august 2010 they chose to switch to LGPLv3+, and converted all file
    headers accordingly.

So, it looks like the license is an "LGPLv3+ with exceptions", and the
"Parts under the MIT/X11" do not exist anymore. But I'm not sure my
understanding is correct.

It may be worth asking if the MIT/X11 part of COPYING.LESSER can be
considerednot applicable anymore, and so if it can be dropped to simplify
their license.

Of course searching their mail archives for more such info, or other
clarification, is the best thing. The period around august 2010 may be
interesting.

Simon, would you mind doing this research?

Luca
