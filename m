From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 30 Dec 2012 09:03:27 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-29
In-Reply-To: <87r4m7uacj.fsf@dell.be.48ers.dk>
References: <20121230073456.2BCF452C08C@lolut.humanoidz.org>
 <87r4m7uacj.fsf@dell.be.48ers.dk>
Message-ID: <50E02D8F.7020504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/30/2012 07:02 AM, Peter Korsgaard wrote:

> These two looks related to your recent gnutls version bump. Care to have
> a look?

Running a failing config now, i don't think i'll hit it barebones though
since they look like a pretty regular config.
Probably have to debootstrap.

> This is probably also related to it, but perhaps that gets fixed by
> Thomas' e17 update.

Seems unlikely from looking at the source of ecore.
Since people have been using and accustomed to gnutls-2.x which required
libgcrypt they've been including it blindly.
I'll test to see if it really requires libgcrypt (like ntfs-3g) or it's
just probably following old gnutls instructions and fix accordingly.

> Did you have a look at the host-gawk issue?

Yes, it seems peko-specific so my hunch says it's a distro toolchain
thing. I've asked Thomas and it seems it's runnig gcc 4.3.2.
Looks like the new gawk DFA is triggering a bug or using a newer feature
that it shouldn't.
Couldn't reproduce yet, so an old gentoo stage or debootstrap might help me.
So also looking into it.
A puny dual-core won't help me with getting these things solved quickly
though, except libecore :)
Regards.
