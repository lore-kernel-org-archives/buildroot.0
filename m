From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:57:27 +0100
Subject: [Buildroot] [PATCH] support/download/svn: generate reproducible
 svn archives
In-Reply-To: <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
References: <20191222213148.13762-1-heiko.thiery@gmail.com>
 <20191222223650.1f44d3ca@windsurf>
 <CAEyMn7aZgVT2hmb8O4duNFeD4_x2_jkChOj9Cv3MAtVXZhQNLQ@mail.gmail.com>
Message-ID: <20191222225727.7e8f88d4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 22:40:43 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > Thanks. Could you check whether the tarballs that are now produced by
> > this are identical to the tarballs we already have on
> > sources.buildroot.org ?  
> 
> I checked this for the fis package and unfortunately this is not the
> case. Do you expect to have the same hashes?

Probably not, because with your change we now generate the tarballs
differently.

Normally, it is annoying because it means the hash has changed,
breaking the build for older Buildroot users, if we update the tarballs
on sources.buildroot.org.

However, in this case, current Buildroot does not have any hash (as far
as I can see) for Subversion-fetched packages. So we could introduce
your change and update the tarballs on sources.buildroot.org at the
same time, and then introduce hashes in those packages.

Peter, Yann, what do you think ?

We have only very few Subversion-fetched packages, I think we should
keep it simple.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
