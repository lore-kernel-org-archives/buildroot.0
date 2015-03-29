From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2015 17:18:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150329171857.58CC48046A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-03-29 17:18:57 UTC ---
Tom,

Could you attach your .config pleae, so I can try to reproduce here?

And yes, this check is here on purpose: we do not want two packages
to try to install the same user with different groups. For example,
the following is clearly wrong:

    define FOO_USERS
        foo_u - foo_g - * - - -
    endef

    define BAR_USERS
        foo_u - bar_g - * - - -
    endef

because the user 'foo_u' can have only one main group. And we want to
catch this.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
