From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 15 Aug 2007 13:29:20 +0200
Subject: [Buildroot] x11r7
	created$(BUILD_DIR)/<package-dir>/.stamp_downloaded
References: <1186864171.4742.15.camel@elrond.sweden.atmel.com><20070814142017.GA4242@firebird.dresden.micronet24.de><1187116207.13869.24.camel@elrond.sweden.atmel.com>
	<20070815092604.GA4252@firebird.dresden.micronet24.de>
Message-ID: <002a01c7dfdb$263b97a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Tue, Aug 14, 2007 at 08:30:07PM +0200, Ulf Samuelsson wrote:
>> tis 2007-08-14 klockan 16:20 +0200 skrev Benjamin Tietz:
>> > On Sat, Aug 11, 2007 at 10:29:31PM +0200, Ulf Samuelsson wrote:
>> > > The Makefile seems to create this file to indicate that it 
>> > > had downloaded the source code.
>> > > The $(BUILD_DIR) becomes really crowded this way.
>> > From this one file, I see.
>> > > 
>> 
>> Every package downloaded by make source, 
>> creates a directory in $(BUILD_DIR)
>> - And just to have a storage location for the
>> "<PACKAGE>/.stamp_downloaded".
> not just for this one file, the directory will also used far all other
> stamp-files as well as a target for the unpacked source, their build and
> so on
>> 

Yes if you select to use them, but if you enable everything
and "make sources" to have sources handy, just in case you need them,
then you get the directory anyway.
My access to Internet varies from 100 Mbps at home, and
to 50 kbps when I only have access to a Modem,
and downloading stuff in advance makes sense.

This is not how packages behave at the  moment, and introducing
this, just to store a stamp  is a real bad idea.
It is much better to use the fact that the tarball exist
or even to  store "downloaded" stamps in a dedicated directory
hidden away in some obscure place.

BR
Best Regards
Ulf Samuelsson
