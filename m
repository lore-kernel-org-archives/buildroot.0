From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Oct 2010 15:24:24 +0200
Subject: [Buildroot] [PATCH] Makefile: generate a Makefile wrapper in
	$(O)
In-Reply-To: <1287232474.3927.190.camel@coalu.atr> (Lionel Landwerlin's
	message of "Sat, 16 Oct 2010 14:34:34 +0200")
References: <1285491372-19364-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1287232474.3927.190.camel@coalu.atr>
Message-ID: <87d3rae0dz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> Yann,
 Lionel> I'm having a problem with the last buildroot on git. I'm not sure this
 Lionel> is related to your patches.
 Lionel> In a clean buildroot repository (no output directory already present),
 Lionel> if you do :
 Lionel> 	$ make menuconfig 

 Lionel> The .config files are created in the root of the buildroot tree instead
 Lionel> of in the output/ directory.

That's how it has always been. It would be conceptually cleaner to put
it in output/, but we're keeping it in the toplevel dir for legacy
reasons (and because other projects using kconfig do that as well).

 Lionel> I might be wrong, but I was used to the second behavior.
 Lionel> Could you check this isn't a problem introduced by your patches ?
 Lionel> Otherwise I will try figure this out later.

No, we have never put it in output by default. If you want that, simply
run make O=output menuconfig.

-- 
Bye, Peter Korsgaard
