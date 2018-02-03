From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 22:54:44 +0100
Subject: [Buildroot] [PATCH v1 2/2] dhcp: disable isc assertions
 (reproducible builds)
In-Reply-To: <20180130175402.GA3468@scaer> (Yann E. MORIN's message of "Tue,
 30 Jan 2018 18:54:02 +0100")
References: <20171027192424.19760-1-ps.report@gmx.net>
 <20171027192424.19760-2-ps.report@gmx.net>
 <20180108211857.2166f95e@windsurf> <20180130175402.GA3468@scaer>
Message-ID: <877ert20yj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Peter, Arnout, Yann, what do you think, especially about the
 >> assertions ?

 > Assertions are supposed to be usefull during development, not during
 > production use, so I would be fine with disabling them, yes.

 > At least, I would hope that no sane developer uses assertions to check
 > for normal error conditions in normal operation mode... ;-]

Agreed, and the space savings are quite big - So committed, thanks.

 > Now, about reproducibility... We could at least pass -DFILE=\"\" and so
 > on from inside our gcc-wrapper, like we already do for __DATE__ and
 > __TIME__. Yes, that would give an empty filename in assertions and the
 > likes, but do we care in the end?

It would be nicer if we could pass basename($file), but that would break
with compilations with multiple source files passed to gcc or header
files, so yeah, perhaps that is the best way forward.

How does E.G. Debian handle it?

-- 
Bye, Peter Korsgaard
