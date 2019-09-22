From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 09:01:24 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: allow
 setting rootpath from parameters.
In-Reply-To: <CAJ4jsaeV46L0mCiZH2zVq4c8d9CNLasOKRHEP-yTaiAc6h7c7g@mail.gmail.com>
References: <20190903120951.3318-1-raphael.melotte@essensium.com>
 <20190918104223.2222432b@windsurf>
 <CAJ4jsaeV46L0mCiZH2zVq4c8d9CNLasOKRHEP-yTaiAc6h7c7g@mail.gmail.com>
Message-ID: <20190922090124.752d63c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Sep 2019 21:55:19 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> Currently there are thirty board/*/post-image.sh files. Twenty of them
> are variants of genimage.sh and three of them call it so I believe
> that a more versatile genimage.sh would reduce some code duplication.

I believe plenty of those post-image.sh predate the time we had
genimage.sh and could simply be converted to use it, without changes to
genimage.sh.

For the remaining cases that need special things not provided by
genimage.sh, I don't see the point of replicating all the options of
the genimage tool in genimage.sh: in that case you'd better call
genimage directly. It would just seem to be an extra layer that doesn't
bring anything useful.

As usual, this is just a personal opinion, and others can disagree, and
I will not strongly oppose as what I'm exposing here is a weak feeling.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
