From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 Aug 2014 11:44:21 -0500
Subject: [Buildroot] [PATCH v4] fio: add missing libaio dependency
In-Reply-To: <20140814184120.5ebc56d2@free-electrons.com>
References: <1408031710-18439-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140814184120.5ebc56d2@free-electrons.com>
Message-ID: <CANQCQpayxq9ZRggLvysN3s87R8BoJj-1+Lq-H06-z8=+eTviFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Aug 14, 2014 at 11:41 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Thu, 14 Aug 2014 10:55:10 -0500, Matt Weber wrote:
>> The fio package dlopen()s the libaio library at runtime
>> when the ioengine function is selected as libaio.
>>
>> Signed-off-by Matt Weber <Matthew.Weber@rockwellcollins.com>
>
> I had a quick look at the fio code base, and the configure script
> (which is not autoconf based) seems to have some code to detect whether
> libaio is present, and only use it when available.
>
> Also, what seems to be dlopen()ed is not the libaio library itself, but
> rather "external engines", i.e parts of fio.
>
> So I'm not sure about your patch, and I'd like to do some more testing
> about it.
Ok, I'll take a look a closer look and see if there is an approach
that could be added to make libaio an optional configuration.


Thanks,
-- 
Matthew L Weber / Sr Software Engineer / Platform Software
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
