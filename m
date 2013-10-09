From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 23:05:23 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpowerlink: new package
In-Reply-To: <524F228E.9070602@openwide.fr> (Romain Naour's message of "Fri,
 04 Oct 2013 22:18:22 +0200")
References: <524F228E.9070602@openwide.fr>
Message-ID: <87k3hmxii4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 Romain> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 Romain> ---

 Romain> v3:
 Romain>   - Add CPP depends
 Romain>   - Add build fix for kernels > 3.5
 Romain>   - Fix lib install

[snip]

 Romain> +++ b/package/openpowerlink/openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch

[snip]

 Romain> @@ -0,0 +1,88 @@
 Romain> +From 9990e19bc554d11c4123986692c5e0572682467a Mon Sep 17 00:00:00 2001
 Romain> +From: Josef Baumgartner <josef.baumgartner@br-automation.com>
 Romain> +Date: Wed, 14 Aug 2013 10:22:21 +0200
 Romain> +Subject: [PATCH 1/1] [FIX] Fix compilation issue for kernels > 3.5
 Romain> +
 Romain> +@@ -1244,8 +1258,8 @@ tEplKernel      Ret = kEplSuccessful;
 Romain> +     }
 Romain> + #elif (TARGET_SYSTEM == _VXWORKS_)
 Romain> +     semDelete(pCopyJob_p->m_Event.m_semCompletion);
 Romain> +-
 Romain> +-#else
 Romain> ++
 Romain> ++#else
 Romain> + #error "OS currently not supported by EplApiProcessImage!"
 Romain> + #endif
 Romain> +
 Romain> +--
 Romain> +1.8.4

Something went wrong here (your mailer ate trailing spaces?):

Applying openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch using patch: 
patching file EplStack/EplApiProcessImage.c
Hunk #4 FAILED at 1258.
1 out of 4 hunks FAILED -- saving rejects to file EplStack/EplApiProcessImage.c.rej
Patch failed!  Please fix openpowerlink-0002-Fix-compilation-issue-for-kernels-3.5.patch!

But as this last hunk was just white space changes, I simply dropped it.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
