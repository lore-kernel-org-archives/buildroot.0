From: William Wagner <will_wagner@carallon.com>
Date: Tue, 14 Sep 2010 14:38:35 +0100
Subject: [Buildroot] gdb and external toolchain
In-Reply-To: <AANLkTimDzh0kHMk2fjBqMzW8r5r3EAk==q+A7QsH6S9L@mail.gmail.com>
References: <4C8E2777.7030202@carallon.com>
	<AANLkTimDzh0kHMk2fjBqMzW8r5r3EAk==q+A7QsH6S9L@mail.gmail.com>
Message-ID: <4C8F7ADB.6070601@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Thanks for the help. I basically did the same to copy over gdbserver.

I now have a problem where gdb is unable to debug thread creation, it 
hangs when stepping over pthread_create. Searching on the web I have 
found various comments that refer you to  point 6 in the FAQ at 
http://sourceware.org/gdb/wiki/FAQ

It says that gdb needs un stripped libpthread and libthread_db libraries 
to work. I'm not sure if this is on the target with gdbserver or on the 
host running gdb. Currently buildroot strips the libraries on the target.

I've never had a problem debugging with an internal buildroot toolchain 
so presumably buildroot is correct in stripping the libraries on the 
target. Has anyone seen this before and able to point me in the right 
direction?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
