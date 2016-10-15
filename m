From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 17:13:37 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
	from the legal-info
In-Reply-To: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 15 Oct 2016 15:28:22 +0200")
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878ttpbq72.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > It might be necessary to not even mention a package in the output of
 > legal-info:

 >   - virtual packages have virtually nothing to save in the legal-info
 >     output;

 >   - for proprietary packages, it might not even be legal to even
 >     mention them, being under NDA or some other such restrictive
 >     conditions.

 > Introduce the new FOO_GEN_LEGAL_INFO variable that a package can set
 > to 'NO' (default to 'YES') to indicate that the package should be
 > completely ignored from the legal-info output, in which case the
 > package is not mentioned in the maniufest, its source archive,
 > patches and license files are not saved into legal-info/ .

Couldn't / shouldn't the 2nd part already be handled by
<foo>_REDISTRIBUTE = NO and/or <foo>_LICENSE = PROPRIETARY?

-- 
Bye, Peter Korsgaard
