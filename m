From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 21:56:22 +0100
Subject: [Buildroot] add option to enable AI_ADDRCONFIG support
In-Reply-To: <20120308091714.5d60b715@skate> (Thomas Petazzoni's message of
 "Thu, 8 Mar 2012 09:17:14 +0100")
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
 <20120308091714.5d60b715@skate>
Message-ID: <87wr6q26x5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I don't know if this question has been asked in the past, but do you
 Thomas> know what is the binary size impact of enabling AI_ADDRCONFIG in
 Thomas> uClibc? If the impact is rather minimal, then I'd rather have it
 Thomas> enabled in our default configuration instead of adding yet another
 Thomas> toolchain config knob.

I believe it's a fairly small impact, but the problem is external uClibc
toolchains (made by BR, ct-NG or elsewhere) which most likely won't have
AI_ADDRCONFIG enabled, so mrouted (and gupnp) will fail at build time.


 Thomas> Anyway some comments about your patches (but don't work on updating
 Thomas> them before we decide if a new option is really needed) :

 Thomas>  * Your PATCH 1/2 also needs to address the cases of external
 Thomas>    toolchains and crosstool-ng toolchains ;

 Thomas>  * Your PATCH 2/2 should use a depends on rather than a select. We use
 Thomas>    depends on for all the dependencies of packages on toolchain
 Thomas>    options, together with a comment displayed when the toolchain
 Thomas>    options isn't present, so that the user is aware that mrouted is
 Thomas>    available, but only if AI_ADDRCONFIG is enabled as a toolchain
 Thomas>    option.

I agree.

-- 
Bye, Peter Korsgaard
