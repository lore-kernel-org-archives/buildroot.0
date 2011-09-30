From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Sep 2011 08:31:43 +0200
Subject: [Buildroot] [PATCH 09/15] Makefile.package.in: Pass
	non-prefixed name as argument to GENTARGETS_INNER.
In-Reply-To: <18450fde69c3d4bc8e309ddf4dfedc78ff4e60a0.1317325743.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 29 Sep 2011 21:57:45 +0200")
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
 <18450fde69c3d4bc8e309ddf4dfedc78ff4e60a0.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bou2o81c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Quotient Remainder <quotientvremainder@gmail.com>

 Thomas> Instead of effectively running s/^host-// on the package name,
 Thomas> just pass the non-prefixed name to GENTARGETS_INNER.  This
 Thomas> removes the need to ban packages with names starting with
 Thomas> "host-".

 Thomas> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>

As I said before, real name please.
 
 Thomas>  #
 Thomas>  # Build step. Only define it if not already defined by the package .mk
 Thomas>  # file.
 Thomas>  #
 Thomas> -ifndef $(2)_BUILD_CMDS
 Thomas> -ifeq ($(5),target)
 Thomas> -define $(2)_BUILD_CMDS
 Thomas> +ifndef $(4)_BUILD_CMDS

I believe this should be 3 and not 4. Even with this fixed I have the
build breaking in various odd ways, so I'm dropping this patch for now.

-- 
Bye, Peter Korsgaard
