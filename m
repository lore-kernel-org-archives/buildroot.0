From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:28:32 +0100
Subject: [Buildroot] [PATCH v3] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5333165D.90100@imgtec.com> (Vicente Olivert Riera's message of
 "Wed, 26 Mar 2014 18:03:09 +0000")
References: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
 <53330BEB.3090206@mind.be> <5333165D.90100@imgtec.com>
Message-ID: <87txakk5tr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 >>> +config BR2_MIPS_OABI32
 >>> +	bool
 >>> +	default y		if BR2_mips || BR2_mipsel
 >>> +	default n		if BR2_mips64 || BR2_mips64el
 >> 
 >> Did you forget to remove this or is there a reason to keep it? In the
 >> latter case, please add an explanatory comment.

 > Why would I want to remove this? The BR2_MIPS_OABI32 symbol is used by
 > glibc and uclibc packages.

Arnout is just asking about the 'default n' line. Symbols are 'n' by
default, so the line doesn't do anything as far as I can see.

-- 
Bye, Peter Korsgaard
