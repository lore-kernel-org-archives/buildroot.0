From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 01 Sep 2020 16:02:43 +0000
Subject: [Buildroot] [Bug 13171] make qt5base error
In-Reply-To: <bug-13171-163@https.bugs.busybox.net/>
References: <bug-13171-163@https.bugs.busybox.net/>
Message-ID: <bug-13171-163-0nRMoA1h9Q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13171

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to jack from comment #0)

Sorry, no picture (of the failure) attached...

Could you provide a .config or defconfig file of the failing buildroot
configuration (on which host system)? Could you provide the failure message
(and some lines around) simple by copying the message?

Do you mean the following change to configure (removing the double quotes):

     if [ "$OPT_VERBOSE" = yes ]; then
         # Show the output of make
-        (cd "$outpath/qmake"; "$MAKE") || exit 2
+        (cd "$outpath/qmake"; $MAKE) || exit 2
     else
         # Hide the output of make

If this is fixing your problem, this would mean that 'MAKE' is not single
command in your case...

Could you provide an link to your 'research' results?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
