From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 3 Jan 2007 15:39:12 +0100
Subject: [Buildroot] [PATCH] Re: offline buiding
In-Reply-To: <ed4892840701030628i2bc06d36k5b7cfa70a5911475@mail.gmail.com>
References: <ed4892840701030051q6893bf0bq4ac3f7427532f970@mail.gmail.com>
	<024c01c72f1a$7ee6f970$060514ac@atmel.com>
	<ed4892840701030149m2a6c6a61p45ebf139b8db30ab@mail.gmail.com>
	<20070103121556.GC24482@aon.at>
	<20070103131009.GH12033@ibawizard.net>
	<20070103134732.GD24482@aon.at>
	<ed4892840701030628i2bc06d36k5b7cfa70a5911475@mail.gmail.com>
Message-ID: <20070103143912.GF24482@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 03, 2007 at 10:28:13PM +0800, Steven Woody wrote:
>On 1/3/07, Bernhard Fischer <rep.nop@aon.at> wrote:
>>On Wed, Jan 03, 2007 at 02:10:09PM +0100, Petr Stetiar wrote:
>>>Bernhard Fischer <rep.nop@aon.at> [2007-01-03 13:15:56]:
>>>
>>>> Note that several packages are a bit buggy in this respect since they 
>>lack a
>>>> foo-source: target. These need to be fixed. Patches are -- as always --
>>>> welcome.
>>>
>>>Attached patch should add these missing targets.
>>
>>The convention is to put the foo-source target just below the rule to
>>download the source (plus eventual patches) so it's easier to see if the
>>-source needs adjustment to include eventual patches.
>>
>>I corrected your patch accordingly (r17143).
>>Thanks!
>>_______________________________________________
>>buildroot mailing list
>>buildroot at uclibc.org
>>http://busybox.net/mailman/listinfo/buildroot
>>
>
>:-( i cann't understand what you said 'foo-source' and the purpose of
>the patch.  i think i will go to manually grab the tallballs needed.
>it might be easier to me.

The foo-source was directed to Petr.

Either download the tarballs manually, or use a host with an
internet-connection. On that connected host, adjust your .config that
you want to build offline and issue
$ make source

Then transfer the content of the "dl" dir to your offline-host.

HTH,
