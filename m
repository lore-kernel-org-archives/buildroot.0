From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2015 14:50:56 +0100
Subject: [Buildroot] Need help in enabling the ulimit command to
	busybox-1.23.2
In-Reply-To: <C9AC9E8BC6C75F478EDF2670B45767282A3B3E88@NOIMEX10.barco.com>
 (Rajneesh Gaur's message of "Fri, 11 Dec 2015 07:50:06 +0000")
References: <C9AC9E8BC6C75F478EDF2670B45767282A3B3E88@NOIMEX10.barco.com>
Message-ID: <878u51hz5r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gaur," == Gaur, Rajneesh <Rajneesh.Gaur@barco.com> writes:

 > Dear,
 > We wanted to enable the core dump on our target which is buildroot based.
 > We searched a lot on the web but we were not able to get it so far.

 > Can you please update me with the steps to do the above mentioned.

Ehh, the default buildroot configuration uses busybox ash as the shell,
which does support ulimit:

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
