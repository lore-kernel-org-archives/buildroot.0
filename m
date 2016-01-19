From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2016 22:54:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/triggerhappy: bump to latest
	commit to fix runtime issue
In-Reply-To: <1453197113-27321-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Tue, 19 Jan 2016 10:51:53
 +0100")
References: <1453197113-27321-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <87oach1bhu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Bump to latest commit to fix runtime issue with the Linux Kernel headers 4.4:
 >   Starting thd: Unable to parse trigger line: [..]

 > With version 4.4 of the Linux Kernel the input event codes are not defined in
 > 'linux/input.h' anymore, but in a seperate header file
 > 'linux/input-event-codes.h' leaving triggerhappys evtable_*.h header files
 > empty with no event codes defined.

 > This issue is fixed upstream by commit 7e5abc69f215678e93a6b999524981c8b40bdcd9
 > which also makes overwriting of the 'LINUX_INPUT_H' definition obsolet.

 > Tested with an internal Buildroot toolchain with Linux Kernel headers 4.4 and
 > an external Linaro ARM 2015.08 toolchain with Linux Kernel headers 4.0.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed after adding a .hash file, thanks.

-- 
Bye, Peter Korsgaard
