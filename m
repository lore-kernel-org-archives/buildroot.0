From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Sep 2014 12:34:30 +0200
Subject: [Buildroot] [PATCH 2 of 2] kmod: add patches to support build
	on Redhat 5
In-Reply-To: <CAAXf6LVzr2B-gF1RQiELS_vM52Boopv4X5H17XkJ99aXCX2Z6A@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 29 Sep 2014 11:31:25
 +0200")
References: <patchbomb.1409649944@localhost>
 <f2b8b2b5efec1b2340c4.1409649946@localhost>
 <87iok7wppd.fsf@dell.be.48ers.dk>
 <CAAXf6LVzr2B-gF1RQiELS_vM52Boopv4X5H17XkJ99aXCX2Z6A@mail.gmail.com>
Message-ID: <87vbo6r9zd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> > +-   sig_len = be32toh(get_unaligned(&modsig->sig_len));
 >> > ++   sig_len = bswap_32(get_unaligned(&modsig->sig_len));
 >> 
 >> Ehh, so what happens when we want to build kmod for a big endian target?

 > Hmm, indeed, that doesn't seem right.
 > I found another patch that looks better [1], sent to the linux-modules
 > mailing list in September 2013, received some comments and a v2 was
 > promised but never arrived (AFAICS). I will adopt the patch and fix
 > the comments, then resend to buildroot + linux-modules.

 > [1] http://www.spinics.net/lists/linux-modules/msg01127.html

Thanks, that patch (+ suggested changes) looks sensible to me.

-- 
Bye, Peter Korsgaard
