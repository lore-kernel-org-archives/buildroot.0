From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Aug 2019 07:14:21 +0000
Subject: [Buildroot] [Bug 11746] stm32f469 didn't work correctly......
In-Reply-To: <bug-11746-163@https.bugs.busybox.net/>
References: <bug-11746-163@https.bugs.busybox.net/>
Message-ID: <bug-11746-163-r3AHDrRwFf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11746

Christophe Priouzeau <christophe.priouzeau@st.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Christophe Priouzeau <christophe.priouzeau@st.com> ---
The issue are due to a bad assembler generation by binutils tools with thumb
code on kernel. 
There is two way to solver it:
1. use an old binutils tools 2.28 (see commit
b3dddb0a787352bb836ce972e4f07b59d79068e7 package/binutils: default to 2.28 for
Cortex-M targets)
2. use a more recent kernel which generate a correct assembler.


I will try to provide a new kernel configuration.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
