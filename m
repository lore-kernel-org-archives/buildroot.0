From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 10:36:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141113103618.39DECB445D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #8 from Beyonlo <beyonlo@gmail.com> 2014-11-13 10:36:17 UTC ---
Hello, I did the tests with wcsftime. I used this example
http://www.cplusplus.com/reference/cwchar/wcsftime/

$ cat wcsftime_test1.c 
/* wcsftime example */
#include <wchar.h>
#include <time.h>

int main ()
{
  time_t rawtime;
  struct tm * timeinfo;
  wchar_t buffer [80];

  time ( &rawtime );
  timeinfo = localtime ( &rawtime );

  wcsftime (buffer,80,L"Now it's %I:%M%p.",timeinfo);
  wprintf (L"%ls\n",buffer);

  return 0;
}


Compiled and run on host:
$ ./wcsftime_test1 
Now it's 08:30AM.

Compiled on host (using cross compile - same process used in test2.c) to run on
target (buildroot):
# uname -a
Linux buildroot 3.13.5 #1 Wed Nov 12 09:42:52 BRST 2014 armv5tejl GNU/Linux
# ./wcsftime_test1 
# 

Ps: Show nothing on buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
