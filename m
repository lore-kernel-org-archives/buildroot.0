From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Feb 2021 19:06:20 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-CNHicZHUon@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
A very brief description...., please describe exactly what (and how) did you
test, which result did you expect and which result did you get?

I suspect you did test something like the following:

  #include <QDebug>
  int main(int argc, char* argv[]) {
      qInfo() << "\u25C0";
      return 0;
  }

Please compile and run on the target and provide the output of the following
call:

  $ ./test 2>&1 | hexdump -C

On my desktop system I get:

  00000000  e2 97 80 0a                                       |....|
  00000004

Which is the expected UTF-8 output for the Unicode/UTF-16
Black-Left-Pointing-Triangle ([1])...

[1] https://codepoints.net/U+25C0?lang=en

-- 
You are receiving this mail because:
You are on the CC list for the bug.
