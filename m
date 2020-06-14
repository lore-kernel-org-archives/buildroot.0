From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 14 Jun 2020 09:06:49 +0000
Subject: [Buildroot] [Bug 13001] openjdk-bin replaces libfreetype.so from
 host-freetype
In-Reply-To: <bug-13001-163@https.bugs.busybox.net/>
References: <bug-13001-163@https.bugs.busybox.net/>
Message-ID: <bug-13001-163-IMnvn5XTJo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Jared, All,

Thanks for the report and the proposed patch.

I think the removal of that file should be done in a post-extract hook instead.

Additionally, it would also be better to do the removal of unpack200 in that
same post-extract hook as well.

Can you send it to the list with those changes, please?

But note that ythere are a few other libraries that may be provided by other
packages:

- libzip.so, by package libzip, for which we do have a host variant, and so may
well start clashing too
- libnet.so, by package libnet; thats OK so far as we have no host variant for
it, but that should be fixed as well I think
- libsctp.so, by package lksctp-tools; thats OK so far as we have no host
variant for it, but that should be fixed as well I think

Could you also have a look into those, please?

Adam, some more feedback, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
