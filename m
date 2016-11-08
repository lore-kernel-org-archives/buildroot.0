From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 16:38:47 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
 toolchain-external-package
In-Reply-To: <9b5894c1-e895-1bab-ea4d-da880ee0323f@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-5-arnout@mind.be>
 <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
 <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
 <20161108092049.45aa1609@free-electrons.com>
 <9b5894c1-e895-1bab-ea4d-da880ee0323f@mind.be>
Message-ID: <20161108163847.76ce7e6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Nov 2016 13:30:16 +0100, Arnout Vandecappelle wrote:

>  That would be useful if such a toolchain uncovers problems that we can fix in
> Buildroot. If all it does is to add autobuilder exceptions, there isn't much
> point... Well, the other thing we can do is to add *_AT_LEAST_NNN options,
> that's true.

Yes, that's what I'm thinking of: it allows us to realize when a
package needs gcc 4.7 or 4.8, or when some fairly recent kernel headers
are needed, for example. If all we test is gcc 4.9 with 4.0 kernel
headers, then all our users that are stuck with 4.7 (or older
toolchains) with 3.0 kernel headers will have a really bad experience.

>  Those autobuilder exceptions for ct-ng, what kind of errors are they for? Not
> something covered by *_AT_LEAST? Like bugs in libc, for which we don't have
> _AT_LEAST?

Looking quickly at the autobuild-run exceptions, we have:

 - Toolchains with gcc affected by various PRs

 - Toolchains with too old eglibc (2.18)

 - Toolchains that fail to build this or that package, with no
   documented reason (might be explained in the commit log, though).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
