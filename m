From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 3 Jan 2007 13:15:56 +0100
Subject: [Buildroot] offline buiding
In-Reply-To: <ed4892840701030149m2a6c6a61p45ebf139b8db30ab@mail.gmail.com>
References: <ed4892840701030051q6893bf0bq4ac3f7427532f970@mail.gmail.com>
	<024c01c72f1a$7ee6f970$060514ac@atmel.com>
	<ed4892840701030149m2a6c6a61p45ebf139b8db30ab@mail.gmail.com>
Message-ID: <20070103121556.GC24482@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 03, 2007 at 05:49:33PM +0800, Steven Woody wrote:
>On 1/3/07, Ulf Samuelsson <ulf@atmel.com> wrote:
>> > hi,
>> >
>> > i am about to use buidroot to build a cross toolchain on a linux host.
>> > but the host does not get an internet connection.  after read the
>> > intro of buildroot, i found it need to grab files on internet in the
>> > building process.  is there an offline building mode? thanks.
>> >
>> > --
>> > woody
>>
>> buildroot caches everything to the "buildroot/dl" directory
>> (This can be changed by "make menuconfig")
>> so if you put all needed packages in that directory, you
>> do not need to have to be online.
>>
>> Best Regards
>> Ulf Samuelsson
>>
>
>thank you all!

You can 
$ make source
to automatically download all configured source tarballs for later
offline use.

Note that several packages are a bit buggy in this respect since they
lack a
foo-source:
target. These need to be fixed. Patches are -- as always -- welcome.
