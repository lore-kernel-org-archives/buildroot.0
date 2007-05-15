From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 15 May 2007 10:53:55 +0200
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <1179215247.21753.43.camel@localhost.localdomain>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
	<1179120085.21753.1.camel@localhost.localdomain>
	<20070514071131.GA11391@aon.at>
	<1179156353.21753.31.camel@localhost.localdomain>
	<20070514153409.GA27033@aon.at>
	<1179215247.21753.43.camel@localhost.localdomain>
Message-ID: <20070515085355.GB13889@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2007 at 09:47:27AM +0200, Hans-Christian Egtvedt wrote:
>On Mon, 2007-05-14 at 17:34 +0200, Bernhard Fischer wrote:
>> On Mon, May 14, 2007 at 05:25:53PM +0200, Hans-Christian Egtvedt wrote:
>
><cut>
>
>> >Aha, setting SHELL to /bin/bash makes this work, thanks.
>> >
>> >Perhaps the top level Makefile should modify SHELL for you?
>> 
>> The user is supposed to set the environment he wants to use.
>> This includes but is not limited to SHELL, HOSTCXX, HOSTCC, MAKE etc,
>> etc.
>
>I understand HOST..., MAKE, etc. But since some of the scripts really
>depend on you using the bash shell, then I think it should be either
>forced or at least given a warning when starting to build.
>
>Will keep the noise a bit down on this email list if people know why
>some parts of the build process fails :)

I don't think depending on bash is desirable. The scripts should also
work at least with ash, imo. Short of that, $(wildcard ) comes to mind,
which would fix this proper in the realm of make (patches welcome).
