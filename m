From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Dec 2019 16:59:22 +0100
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <09654893-fe44-76f0-da65-3f29bc758c6f@mind.be>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
 <20191202152601.4ab1c8cd@windsurf>
 <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
 <09654893-fe44-76f0-da65-3f29bc758c6f@mind.be>
Message-ID: <20191209165922.335b2af1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 3 Dec 2019 22:15:47 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  To kick off the bikeshedding, here's my opinion on what the package should look
> like.
> 
> * It should be a single package, toolchain-external-bootlin. Maybe two (-stable
> and -bleeding-edge) but I think there'll be enough shared infrastructure to
> warrant creating a single package.

Agreed. My initial start of work in this area looked exactly like this:
a single package. See
https://github.com/tpetazzoni/buildroot/commit/58413ab16c6b203dca48db182e74e59ae73c958a.
Note: this commit is far from being something that works. If I had
something that worked, I would have submitted it.

> * It should offer a choice in Config.in.options for libc and stable/bleeding-edge.

See commit above :-)

> * For now, it should be limited to *exactly* the same architecture suboptions as
> what the toolchain was built for. Later we can decide how to expand this to
> compatible options (e.g. the core-i7 toolchain will also work for core-avx2) -
> but I'm pretty sure that that is something that will require help from
> toolchain-builder itself.

Pretty much what I did, yes :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
