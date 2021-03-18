From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2021 07:35:59 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-iGaYdiKtXc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #12 from Alfredo Pons Menargues <alfredo.pons@gmail.com> ---
Created attachment 8821
  --> https://bugs.busybox.net/attachment.cgi?id=8821&action=edit
My config file for buildroot-2021.02

Buildroot: buildroot-2021.02
CPU: eglfs/RPi3

In this scenario, if you run the tests of QT Console code:

  #include <QDebug>
  int main(int argc, char* argv[]) {
      qInfo() << "\u25C0";
      return 0;
  }

Run:

$ ./test 2>&1 | hexdump -C  --> NO UTF8


$ LANG=en_US.utf8 ./test 2>&1 | hexdump -C   --> UTF8 OK


In the console example the utf-8 text works if we pass in the environment the
variable LANG=en_US.utf8, but in QML test this does not happen:


$ ./testQML --> NO UTF8

$ LANG=en_US.utf8 ./testQML --> NO UTF8

-- 
You are receiving this mail because:
You are on the CC list for the bug.
