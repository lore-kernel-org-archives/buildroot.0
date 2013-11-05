From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 00:09:09 +0100
Subject: [Buildroot] [PATCH v2] sconeserver: Can't be built with uClibc.
In-Reply-To: <1383665533-2430-1-git-send-email-sonic.adi@gmail.com> (Sonic
 Zhang's message of "Tue, 5 Nov 2013 23:32:13 +0800")
References: <1383665533-2430-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <87ppqemooa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>

 > General shadow password file API such as getspnam is not supported in
 > uClibc.

Ehh, they are?

./output/host/usr/bin/arm-linux-nm -D \
  output/target/lib/libuClibc-0.9.33.2.so | grep getspnam
0002a6c0 T getspnam
0002a6f0 T getspnam_r

They do require you to enable UCLIBC_HAS_SHADOW, but that option
defaults to y and our default config has it enabled.

-- 
Bye, Peter Korsgaard
