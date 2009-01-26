From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 06:56:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
In-Reply-To: <20090126001204.39959775D3@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Mon\, 26 Jan 2009 00\:12\:03 +0000 \(UTC\)")
References: <20090126001204.39959775D3@busybox.osuosl.org>
Message-ID: <87skn6d2zs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-26 00:12:02 +0000 (Mon, 26 Jan 2009)
 ulf> New Revision: 25035

 ulf> Log:
 ulf> Deprecate xfsprogs, no support for XFS in Buildroot

But that doesn't mean people aren't using it for initramfs'es needing
xfs support. It it builds and works and there isn't an alternative
implementation in busybox, then I don't see any reason to deprecate
it.
 ulf> +++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-26 00:12:02 UTC (rev 25035)
 ulf> @@ -46,7 +46,7 @@
 ulf>  		--host=$(GNU_TARGET_NAME) \
 ulf>  		--build=$(GNU_HOST_NAME) \
 ulf>  		--prefix=/usr \
 ulf> -		--exec-prefix=/ \
 ulf> +		--exec-prefix=/usr \

Please don't check in unrelated stuff in the same commit (atleast
without describing them in the commit msg)

-- 
Bye, Peter Korsgaard
