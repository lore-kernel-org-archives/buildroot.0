From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 8 Nov 2019 17:11:10 +0200
Subject: [Buildroot] Problems compiling host-ninja
Message-ID: <CALFsTFWeR83+f6aLVpR3Cy=wYsrVXGygQ+WahHAmMyEUFmbCGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I don't have Python 2 installed on my machine, only Python 3, and
recently I faced a problem when I tried to compile host-ninja.
host-ninja executes the configure.py script that has "/usr/bin/env
python", which can't be found. I also found out that the link file
output/host/usr/bin/python will be created only when Python is
selected for the target. Since I don't have any Python application on
my board, Python is not selected for the target in my config.
Moreover, I realized that even when Python is selected and the link
exists, the script won't locate python. I guess it's related to the
fact that HOST_MAKE_ENV seems to be missing and hence PATH won't
contain "python".

Generally speaking, if the machine has python 3 only, I think every
config that contains a meson package and doesn't contain python for
target will fail. Is that correct?
Does it mean that many configurations that don't select python for
target mistakenly run configure.py with python2 (of the machine),
although we meant to run it with python3?
Should we run configure.py with explicit "python3" in order to make it
use the host-python3 dependency we compiled?
Any other thoughts for that case?

Regards,
Asaf
