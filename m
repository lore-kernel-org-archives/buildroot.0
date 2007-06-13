From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 13 Jun 2007 20:16:01 +0200
Subject: [Buildroot] uclibc.mk breaks target .config
In-Reply-To: <20070613135634.GA6911@z1.synertronixx>
References: <20070613124624.GA10380@z1.synertronixx>
	<20070613134054.GA28888@aon.at>
	<20070613135634.GA6911@z1.synertronixx>
Message-ID: <20070613181601.GB4847@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 13, 2007 at 03:56:34PM +0200, Konstantin Kletschke wrote:
>Am 2007-06-13 15:40 +0200 schrieb Bernhard Fischer:

>> >The version I am trying to use is a uclibc-snapshot.
>> 
>> The files you're supposed to read is docs/*
>
>Well, there is mentioned to make a "make uclibc-menuconfig" but I need
>to supply one by myself.

This is ment to help to create your personal uClibc.config
>
>Second way is to pass UCLIBC_CONFIG_FILE=<path/to/.config> what is what
>I try to do. But this particular file is patched in a way uclibc's "make
>oldconfig" is hosed.

I assume that you buildroot config just clashes with your "custom"
uClibc.config. The ABI has to come from buildroot since it is also used
for other packages, so rather fix your buildroot .config and leave the
ABI setting of uClibc.config alone.

>
>Oh sorry! My question was intended to be only a question, not a rant at

ack.
>
>What I did now is:

no, that's really wrong. See above.

HTH,
