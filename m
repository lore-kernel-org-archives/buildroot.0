From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 08:39:03 +0100
Subject: [Buildroot] [PATCH 1/3] package/xen: explicitly disable
 checkpolicy logic
In-Reply-To: <20200119170358.5408-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 19 Jan 2020 18:03:56 +0100")
References: <20200119170358.5408-1-peter@korsgaard.com>
Message-ID: <87v9p6pofc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/14af2dc3219847a92c6ec2db14ba387159b61fde

 > The Xen build system builds and embeds a default XSM FLASK (Flux Advanced
 > Security Kernel) security policy if it detects SELinux checkpolicy on the
 > build machine.

 > If enabled, a gen-policy.py python script is used to convert the binary
 > FLASK policy to a C array initialization list to embed it in the Xen binary.
 > Depending on the python version and locale available on the host, this fails
 > with byte values outside the 0..255 range:

 > policy.c:7:10: error: unsigned conversion from 'int' to 'unsigned char' changes value from '56575' to '255' [-Werror=overflow]
 >   0xdc8c, 0xdcff, 0x7c, 0xdcf9, 0x08, 0x00, 0x00, 0x00, 0x58, 0x65, 0x6e, 0x46, 0x6c,

 > To fix this and ensure a consistent build, pass XEN_HAS_CHECKPOLICY=n to
 > disable the checkpolicy detection.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
