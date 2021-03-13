From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:39:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to
 version 2.66.7
In-Reply-To: <20210227090424.429843-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Feb 2021 10:04:24 +0100")
References: <20210227090424.429843-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2er3yon.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-27218: An issue was discovered in GNOME GLib before
 >   2.66.7 and 2.67.x before 2.67.4. If g_byte_array_new_take() was called
 >   with a buffer of 4GB or more on a 64-bit platform, the length would be
 >   truncated modulo 2**32, causing unintended length truncation.
 > - Fix CVE-2021-27219: An issue was discovered in GNOME GLib before
 >   2.66.6 and 2.67.x before 2.67.3. The function g_bytes_new has an
 >   integer overflow on 64-bit platforms due to an implicit cast from 64
 >   bits to 32 bits. The overflow could potentially lead to memory
 >   corruption.

For 2020.02.x / 2020.11.x I have instead backported the CVE-2021.27218
fix. The CVE-2021-27219 fix adds a g_memdup2() function and changes a
bunch of callers to use that instead of g_memdup(), which is not quite
trivial to backport, so I have left that for now.
-- 
Bye, Peter Korsgaard
