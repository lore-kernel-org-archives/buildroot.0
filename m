From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 May 2018 17:01:01 +0200
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20180505144527.GA14524@scaer> (Yann E. MORIN's message of "Sat, 
 5 May 2018 16:45:27 +0200")
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer>
 <898911315.1288101.1525528062390.JavaMail.zimbra@datacom.ind.br>
 <20180505144527.GA14524@scaer>
Message-ID: <87h8nmuoya.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > So, I am pretty much reluctant to see this patch go in.
 >> 
 >> This change does not prevent the user from using a post-build but I'd
 >> prefer to let Buildroot check the correctness of user changes as much
 >> as possible instead of just prohibiting them.

 > It's not about prohibiting them.

 > But I'd prefer we keep things simple in Buildroot, and since there is
 > already a way to do it, I don't mind that overlays do not provide this
 > solution. A post-build script is way more versatile when it comes to
 > changing the layout.

Yes, with a post-build script you have full flexibility, but we have
quite a lot of helper functionality to handle "common" fixups in a
simpler way than though a post-build script, E.G. stripping, removing
.py files, overlays, ..

This restriction for overlays isn't obvious and wasn't originally there
(before the merged /usr support), so it is arguably a regression (but
for an edge case as this afaik is the first report of it).

-- 
Bye, Peter Korsgaard
