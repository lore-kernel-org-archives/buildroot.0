From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:59:25 +0200
Subject: [Buildroot] [PATCH 06/28] package: fix patching procedure for
	host packages
In-Reply-To: <201107072355.44204.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Thu, 7 Jul 2011 23:55:43 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <04a4534f698a676c73be6f4ca82235cb1cce69c8.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87ei21pxpt.fsf@macbook.be.48ers.dk>
 <201107072355.44204.yann.morin.1998@anciens.enib.fr>
Message-ID: <87aacppxaa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Peter, Thomas, All,
 Yann> On Thursday 07 July 2011 23:50:06 Peter Korsgaard wrote:
 >> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
 Thomas> -$$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
 Thomas> +$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 >> 
 >> Here's to hoping we'll never have a package called 'host' ;)

 Yann> We already raised that potential issue with Thomas, and the conclusion is
 Yann> that we do not allow a package which name starts with 'host-'. See:
 Yann>   http://lists.busybox.net/pipermail/buildroot/2011-July/043880.html

Ahh ok, thanks - I'm still catching up on mails, and must have missed
that one..

-- 
Bye, Peter Korsgaard
