From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:15:34 +0200
Subject: [Buildroot] host-lzop failing when host is using gcc-6
In-Reply-To: <ba2ba1aa-3774-89b9-f8bf-270bc3ebac78@jcz.nl> (Jaap Crezee's
 message of "Thu, 19 May 2016 22:08:53 +0200")
References: <ba2ba1aa-3774-89b9-f8bf-270bc3ebac78@jcz.nl>
Message-ID: <87twhn9pqx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jaap" == Jaap Crezee <jaap@jcz.nl> writes:

 > Hi all,
 > host-lzop seems to be failing when Archlinux switched to gcc-6.x
 > recently. One can see the attached logfile. Anybody willing to
 > investigate? I don't have time at the moment.
 > HOSTCC=gcc-4.8 bypasses the issue for me...


 > regards,


 > Jaap Crezee

 > checking whether your compiler passes the ACC conformance test... FAILED
 > configure: 
 > configure: Your compiler failed the ACC conformance test - for details see 
 > configure: `config.log'. Please check that log file and consider sending
 > configure: a patch or bug-report to <lzop-bugs@oberhumer.com>.
 > configure: Thanks for your support.

This sounds like this:

http://patchwork.openembedded.org/patch/122249/
https://build.opensuse.org/package/view_file/Archiving/lzop/lzop-1.03-gcc6.patch?expand=1

Care to give it a try?

-- 
Bye, Peter Korsgaard
