From: Ulf Samuelsson <ulfs@dof.se>
Date: Wed, 24 Jan 2007 02:13:17 +0100
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
References: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
	<20070124001104.GB17761@codepoet.org>
Message-ID: <053501c73f56$01663000$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik Andersen wrote:
> On Tue Jan 23, 2007 at 11:58:40PM +0100, Ulf Samuelsson wrote:
>> This adds a "buildroot/local" directory.
>> The structure of "local" is the same as that of "packages"
>> but the contents of "local" is never
>> intended to be merged upstream.
>>
>> It allows simple maintenance of those application
>> since you only need to move the local directory from
>> one version of buildroot to a newer.
>>
>> Best Regards
>> Ulf Samuelsson
>
> See package/customize/ which tries to do the same thing.
>

Package "customize" *copies* things into the file system
I think this is useful if you want to have things like
web pages into the root system.

"local" is for "building" packages which should be in the file system,
but may be of a prorprietary nature, or for testing purpose or whatever.

The purpose is mainly easy maintenance.
Anything in local could be in "packages", but since
it is never going into the mainstream,
so you have to update those packages every time
you update the buildroot.

By definition, this is the only patch for "local" there will ever be.
Anything going into mainstream buildroot should go into "packages"


> If you think perhaps package/customize/ should be renamed
> or better documented I'm open to that.  Adding a second
> directory doing the same thing however seems unwise.
>
>
> -Erik

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
