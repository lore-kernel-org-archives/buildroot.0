From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 6 May 2014 14:46:49 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <20140506143845.0c802ae9@skate>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <CAAXf6LXWCeGiH9bNsM=qaJ2bzH9RyOzu3FZpGxsmBsQyxHQMgw@mail.gmail.com>
 <20140506143845.0c802ae9@skate>
Message-ID: <CAAXf6LUsgmETOjUQhCZ1fPAhXOyneYFpuu8G=XKX0W9yx4nuKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 6, 2014 at 2:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 6 May 2014 14:26:31 +0200, Thomas De Schampheleire wrote:
>
>> > Shouldn't we instead migrate these to use the virtual package
>> > infrastructure, and make this infrastructure define this magic 'virtual'
>> > version?
>>
>> For toolchain and toolchain-buildroot that would be possible, but for
>> toolchain-external not, right?
>
> Right. But toolchain-external is not a virtual package, so setting its
> version to 'virtual' would anyway be strange, no?

Not more strange than setting the version to 'undefined' :-D

Any other string than 'undefined' is fine for me too.

Btw, for makedevs and mkpasswd, the version is also 'undefined' as the
source is included in buildroot.
I was first going to change their version to 'buildroot', but it makes
the messages a bit strange:

>>> host-makedevs buildroot Configuring...

etc.


Other ideas?
Thomas
