From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 May 2021 16:39:45 +0200
Subject: [Buildroot] [PATCH] package/python3: security bump to version
 3.9.5
In-Reply-To: <20210507061536.2819-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 7 May 2021 08:15:35 +0200")
References: <20210507061536.2819-1-peter@korsgaard.com>
Message-ID: <87mtt5waq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - bpo-43434: Creating a sqlite3.Connection object now also produces a
 >   sqlite3.connect auditing event.  Previously this event was only produced
 >   by sqlite3.connect() calls.  Patch by Erlend E.  Aasland.

 > - bpo-43882: The presence of newline or tab characters in parts of a URL
 >   could allow some forms of attacks.
 >   Following the controlling specification for URLs defined by WHATWG
 >   urllib.parse() now removes ASCII newlines and tabs from URLs, preventing
 >   such attacks.

 > - bpo-43472: Ensures interpreter-level audit hooks receive the
 >   cpython.PyInterpreterState_New event when called through the
 >   _xxsubinterpreters module.

 > - bpo-36384: ipaddress module no longer accepts any leading zeros in IPv4
 >   address strings.  Leading zeros are ambiguous and interpreted as octal
 >   notation by some libraries.  For example the legacy function
 >   socket.inet_aton() treats leading zeros as octal notatation.  glibc
 >   implementation of modern inet_pton() does not accept any leading zeros.
 >   For a while the ipaddress module used to accept ambiguous leading zeros.

 > - bpo-43075: Fix Regular Expression Denial of Service (ReDoS) vulnerability
 >   in urllib.request.AbstractBasicAuthHandler.  The ReDoS-vulnerable regex
 >   has quadratic worst-case complexity and it allows cause a denial of
 >   service when identifying crafted invalid RFCs.  This ReDoS issue is on the
 >   client side and needs remote attackers to control the HTTP server.

 > - bpo-42800: Audit hooks are now fired for frame.f_code, traceback.tb_frame,
 >   and generator code/frame attribute access.

 > https://www.python.org/downloads/release/python-395/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
