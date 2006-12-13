From: Andre <armcc2000@yahoo.com>
Date: Wed, 13 Dec 2006 00:24:03 -0800 (PST)
Subject: [Buildroot] ARM softfloat patch for gcc 4.2
In-Reply-To: <20061212090202.GB5002@aon.at>
Message-ID: <20061213082403.9137.qmail@web35612.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer <rep.nop@aon.at> wrote:
> 
> Did you read the PRs mentioned above? Especially the thread
> mentioned in PR16314, comment #1 ?

Yes, I did. It refers to problems associated with creating softfloat
toolchains for ARM cores supporting "Maverick Crunch" floating point
hardware, which are _very_much_ in the minority (only the Cirrus
Logic EP9312 as far as I know, which isn't even a supported 'Target
Architecture Variant' from buildroot's point of view...).

Certainly doesn't seem like a good reason to hold back on softfloat
for the rest of the ARM community...

> If binutils defaults to not creating softfloat code in a toolchain
> that was ment to be softfloat-(only?), then that sounds like a
> glitch, yes. Does that work as expected with 2.17.50.0.8?

No, binutils 2.17.50.0.8 has the same problem.

Although buildroot tries to configure binutils with
'--with-float=soft' binutils seems to silently ignore that option...

Andre
--



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
