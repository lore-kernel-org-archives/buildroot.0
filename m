From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 3 Apr 2018 00:29:03 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20180402003702.06275b9b@windsurf>
References: <20171215153830.4864-1-casantos@datacom.ind.br>
 <20180402003702.06275b9b@windsurf>
Message-ID: <1813842677.1293000.1522726143017.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Romain Naour" <romain.naour@gmail.com>
> Sent: Sunday, April 1, 2018 7:37:02 PM
> Subject: Re: [Buildroot] [PATCH v2 1/2] iqvlinux: bump to version 1.2.0.3

> Hello,
> 
> On Fri, 15 Dec 2017 13:38:29 -0200, Carlos Santos wrote:
>> This package is really annoying since the archive name doesn't contain
>> the version. Use a small trick to save it with a better name. Also add
>> hashes for license files.
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> So back on this driver. We looked at it with Arnout and Peter, and
> actually had a lot of fun reading the code. It is ugly as hell, uses
> copy_from/to_user inside spinlocks, and does lots of horrible things.
> 
> But more importantly, this driver does nothing, except provide a weird
> custom ioctl() interface, with no user-space program to use them.
> 
> How is this kernel driver meant to be used? Is it used with some
> non-public, closed-source, Intel utilities ?

It is used for testing/debug purposes by some closed-source binaries
that Intel distributes in its Quartzville Tools, under NDA.

> Also, in the bug tracker at https://sourceforge.net/p/e1000/bugs/589/,
> the person from Intel said: "I'm not really sure why you're trying to
> build this as it's only published here to conform with GPLv2. There's
> really no use for it.". So why are you using it ? Why do we have it in
> Buildroot ?

The code is distributed in a tarball along with Quartzville Tools so
anyone who signs the required NDA have access to it. I don't know why
the package exists in Buildroot but I'm glad it's there. I used it as
the base for the package we have in our br2_external to build the
driver and install the binaries provided by Intel. After doing that I
felt it would be fair to make a small contribution in return.

> Romain, since you originally contributed this driver, perhaps you can
> give some details about how you used it ?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
