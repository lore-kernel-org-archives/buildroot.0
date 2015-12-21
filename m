From: Gaur, Rajneesh <Rajneesh.Gaur@barco.com>
Date: Mon, 21 Dec 2015 10:59:43 +0000
Subject: [Buildroot] Need help in enabling the ulimit command to
	busybox-1.23.2
In-Reply-To: <878u51hz5r.fsf@dell.be.48ers.dk>
References: <C9AC9E8BC6C75F478EDF2670B45767282A3B3E88@NOIMEX10.barco.com>
 <878u51hz5r.fsf@dell.be.48ers.dk>
Message-ID: <C9AC9E8BC6C75F478EDF2670B45767282A3B46F7@NOIMEX10.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter

I was able to set up core dump to be able to analyse the possible crash of one of linux processes on our Linux target.
I deliberately put a bug inside the code and I could get the line where the process crashed after seeing the core dump file.
Thereafter, I created an EMMC image to reproduce the crash scenario in the real environment.
However, after 2 days of continuous running, today the specific process hanged instead of getting crashed.
Could you suggest some way so as to analyse the target so as to figure out the point at which the process hanged.

Br
Rajneesh Gaur

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: 11 December 2015 19:21
To: Gaur, Rajneesh
Cc: buildroot at busybox.net
Subject: Re: Need help in enabling the ulimit command to busybox-1.23.2

>>>>> "Gaur," == Gaur, Rajneesh <Rajneesh.Gaur@barco.com> writes:

 > Dear,
 > We wanted to enable the core dump on our target which is buildroot based.
 > We searched a lot on the web but we were not able to get it so far.

 > Can you please update me with the steps to do the above mentioned.

Ehh, the default buildroot configuration uses busybox ash as the shell, which does support ulimit:

Welcome to Buildroot
buildroot login: root

# ulimit -a
-f: file size (blocks)             unlimited
-t: cpu time (seconds)             unlimited
-d: data seg size (kb)             unlimited
-s: stack size (kb)                8192
-c: core file size (blocks)        0
-m: resident set size (kb)         unlimited
-l: locked memory (kb)             64
-p: processes                      978
-n: file descriptors               1024
-v: address space (kb)             unlimited
-w: locks                          unlimited
-e: scheduling priority            0
-r: real-time priority             0

--
Bye, Peter Korsgaard
This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
