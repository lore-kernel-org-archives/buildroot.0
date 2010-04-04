From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 21:18:38 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404211838.9E20E8B5E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #7 from Yann E. MORIN <yann.morin.1998@anciens.enib.fr>  2010-04-04 21:18:38 UTC ---
Grant,

[wrt sysroot]
> Isn't it always going to be "$(BR2_TOOLCHAIN_EXTERNAL_PATH)/.."?

IIRC, $(BR2_TOOLCHAIN_EXTERNAL_PATH) is the place where to find the
executables, eg. target-gcc et al.

So, no, the sysroot should not be in $(BR2_TOOLCHAIN_EXTERNAL_PATH)/.. That
would have been the place to find target includes/libraries for the old,
non-sysroot case.

There is no way to know where the sysroot is, except by asking gcc where it was
previously installed into, subtract that from the configured sysroot prefix,
and re-add the current toolchain prefix.

Of course, that rules out a toolchain in which the sysroot was configured
out-side the gcc prefix, in which case I have absolutely no clue what could
happen if the toolchain gets relocated...


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
