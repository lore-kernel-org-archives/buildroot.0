From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Sep 2019 15:09:18 +0000
Subject: [Buildroot] [Bug 12116] console prompt does not appear after login
In-Reply-To: <bug-12116-163@https.bugs.busybox.net/>
References: <bug-12116-163@https.bugs.busybox.net/>
Message-ID: <bug-12116-163-66I0NxzQDt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12116

Christophe Priouzeau <christophe.priouzeau@st.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Christophe Priouzeau <christophe.priouzeau@st.com> ---
Same issue as https://bugs.busybox.net/show_bug.cgi?id=11746

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
