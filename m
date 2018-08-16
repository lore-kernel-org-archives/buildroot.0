From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Aug 2018 22:45:37 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-CvalW9GkPG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

--- Comment #4 from Frank Hunleth <fhunleth@troodon-software.com> ---
I agree with your assessment. 

I did a quick test on a 32-bit target (64-bit host) locally and Erlang's Uint64
is compiled to "unsigned long long" which is correct for my target. Looking
through the Erlang source code, I can see how if SIZEOF_LONG were detected
incorrectly that you'd have the problem that you're seeing. It seems to be fine
for me. 

Can you check that sizeof(Uint64) is 8 in both your NIF and in Erlang when
they're compiled? You can modify the Erlang source code in your
output/build/erlang directory and then do a "make erlang-rebuild all".

Also, is your simple example and Buildroot tree somewhere public?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
