From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 22:02:58 +0200
Subject: [Buildroot] [External] Re: Issues with cross-compiling from
 x86_64 to a different x86_64
In-Reply-To: <34C69F44FE4EA4498813EAECDBF40C1623A47405@GUSALE0B.na.utcmail.com>
References: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
 <20160720000154.4132543d@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A47405@GUSALE0B.na.utcmail.com>
Message-ID: <20160720220258.46331635@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jul 2016 02:49:45 +0000, Arguin, Christopher P     UTAS
wrote:

> I dug into it more and found the source of the problem, which is in
> ncftp itself. As part of the 'configure' script it actually creates a
> 'ccdv.c' file and compiles it, apparently using the wrong compiler.
> Then this 'ccdv' tool is used throughout the build process instead of
> CC. It was to make the compilation output prettier.

Thanks for the investigation!

> It's not directly AVX-related, but from the BMI instruction set...
> the actual failure is the "andn" instruction. I still need to dig
> into it more to understand what's going on there.
> 
> There is a configure option to disable use of ccdv, so I may give
> that shot. Then I have to go look at what is going on in openssl. I
> guess you can probably expect a patch or two from me this week :)

Looks like indeed passing --disable-ccdv is the best way forward.

However, I don't understand why on my system, ccdv doesn't get built,
while it does get built for you.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
