From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 22:19:26 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <20170710213516.GB22898@scaer> (Yann E. MORIN's message of "Mon, 
 10 Jul 2017 23:35:16 +0200")
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan> <20170710213516.GB22898@scaer>
Message-ID: <87pod6rak1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,
 > On 2017-07-10 23:24 +0200, Thomas Petazzoni spake thusly:
 >> On Mon, 10 Jul 2017 18:26:19 +0200, Yann E. MORIN wrote:
 >> > The Linux kernel will refuse to mount a squashfs image/partition that is
 >> > not padded to a 1MiB boundary.
 >> 
 >> Besides experimental evidence, do you have a pointer to a place in the
 >> Linux kernel documentation / code that confirms this statement ?
 >> 
 >> If you don't, that's fine, but if you have such a reference, it would
 >> be useful to add it to the commit log.

 > Sorry, I have no such reference. As you say, it is experimental
 > evidence... Which turns out to be wrong.

 > Now I tried to round it to 128KiB (the block size), but it was no good.

 > Then I tried to round it to 256KiB (just for fun). And it works.

Yes, I also find this quite odd. I haven't personally used squashfs
forin years, but have never run into such issues.

-- 
Bye, Peter Korsgaard
