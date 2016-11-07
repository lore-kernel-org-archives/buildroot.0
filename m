From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 07 Nov 2016 23:54:01 +0100
Subject: [Buildroot] [PATCH] ubifs: Fix regression in ubifs_readdir()
In-Reply-To: <d5f41448-c95c-54e3-69dc-ad3615580042@mind.be>
References: <1477648432-9543-1-git-send-email-richard@nod.at>
 <1477671544.8927.1.camel@embedded.rocks>
 <c542e099-0404-be8e-ebeb-d4265d3204d6@nod.at>
 <1477693395.31471.1.camel@embedded.rocks>
 <20161101232215.5bf7cabd@free-electrons.com>
 <1478116619.8549.1.camel@embedded.rocks>
 <20161102214927.30b0d74f@free-electrons.com>
 <1478126967.8549.4.camel@embedded.rocks>
 <87f68565-765b-4e9b-a3f0-34dae0b45e93@mind.be>
 <1478157814.9853.1.camel@embedded.rocks>
 <d5f41448-c95c-54e3-69dc-ad3615580042@mind.be>
Message-ID: <1478559241.1776.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2016-11-03 at 11:22 +0100, Arnout Vandecappelle wrote:
> 
> On 03-11-16 08:23, J?rg Krause wrote:
> > On Thu, 2016-11-03 at 03:46 +0100, Arnout Vandecappelle wrote:
> > > 
> > > On 02-11-16 23:49, J?rg Krause wrote:

[snip]

> ?Since version.o differs, it means the version.o doesn't end up in
> the zImage...
> Again, can you check for the intermediate files what happens to them?
> E.g.
> init/built-in.o, .tmp_vmlinux1, arch/arm/boot/Image. Maybe just do
> "mv
> output/build/linux-custom output/build/linux-custom.orig" before
> rebuilding and
> do a full tree compare to find which files are identical.

Got it! ccache <3.3.3 is affected by bug concerning rebuilding the
kernel [1].

So, I guess we should update ccache.

[1] https://github.com/ccache/ccache/issues/136

Many thanks for your help!
