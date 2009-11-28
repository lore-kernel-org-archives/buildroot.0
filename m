From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 28 Nov 2009 21:41:33 +0100
Subject: [Buildroot] [PATCH] gcc: Add option to build final-gcc with
	sysroot option
In-Reply-To: <4B0FEA2F.9080508@st.com> (Carmelo AMOROSO's message of "Fri\,
	27 Nov 2009 16\:03\:11 +0100")
References: <1258969104-4217-1-git-send-email-carmelo.amoroso@st.com>
	<87ws1c58dl.fsf@macbook.be.48ers.dk> <4B0FEA2F.9080508@st.com>
Message-ID: <878wdq4c1u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carmelo" == Carmelo AMOROSO <carmelo.amoroso@st.com> writes:

Hi,

 >> I'm not convinced we need a user visible option for this - It's a very
 >> lowlevel detail that I don't think most users will know what to answer
 >> to - Any reason we cannot just automatically enable this if
 >> BR2_PTHREADS_NATIVE is enabled?
 >> 
 Carmelo> No at all, indeed it is the better choice. Feel free to
 Carmelo> rework/adapt it.

Hmm, looking closer at it you're having me confused. You changed
gcc-uclibc-3.x.mk (E.G. the build rules used when NOT using sysroot) to
add a --with-sysroot configure argument. I would imagine this belongs in
gcc-uclibc-4.x.mk (E.G. the build rules used when using sysroot), but
there we already pass --with-sysroot=$(STAGING_DIR) to the final gcc
build (the BR2_CONFIGURE_STAGING_SYSROOT variable).

So is this change really needed?

-- 
Bye, Peter Korsgaard
