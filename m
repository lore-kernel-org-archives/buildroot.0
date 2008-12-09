From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 9 Dec 2008 11:41:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20081209114152.174362da@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Author: jacmet
> Date: 2008-12-05 07:27:42 -0800 (Fri, 05 Dec 2008)
> New Revision: 24288
>
> Log:
> toolchain/binutils: honour HAVE_MANPAGES / HAVE_INFOPAGES
> 
> Based on b157db55 in Bernhard's tree.
> 
> Modified:
>    trunk/buildroot/toolchain/binutils/binutils.mk
>
> 
> Changeset:
> Modified: trunk/buildroot/toolchain/binutils/binutils.mk
> ===================================================================
> --- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05
> 15:27:38 UTC (rev 24287) +++
> trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05
> 15:27:42 UTC (rev 24288) @@ -106,6 +106,8 @@ --build=$(GNU_HOST_NAME) \
>  		--host=$(GNU_HOST_NAME) \
>  		--target=$(REAL_GNU_TARGET_NAME) \
> +		--mandir=/usr/share/man \
> +		--infodir=/usr/share/info \
> 

Sure this is correct? I get an error about binutils trying to install
manpages into my systems /usr/share/man directory. And I do not have
write permissions there. Is it intended to go into $(STAGING_DIR)?

<snipp>

PS! Sorry for leaving out In-Reply-To, I could not find the tag
in the archive.

-- 
Best regards,
Hans-Christian Egtvedt
