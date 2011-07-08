From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Jul 2011 20:11:20 +0200
Subject: [Buildroot] [PATCH 04/28] linux: use the defconfig mechanism
	after tuning the config
In-Reply-To: <20110708190853.126e7e3a@skate> (Thomas Petazzoni's message of
 "Fri, 8 Jul 2011 19:08:53 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <505d71eb153b750e7af08640a90e2efec8cbcf39.1309895466.git.thomas.petazzoni@free-electrons.com>
 <87pqllpxw5.fsf@macbook.be.48ers.dk> <20110708190853.126e7e3a@skate>
Message-ID: <87pqlkwsl3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Thu, 07 Jul 2011 23:46:18 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Why don't we just call 'make silentoldconfig' instead?

 Thomas> No, silentoldconfig, despite its name, will ask many questions when
 Thomas> the .config is simply a minimal defconfig. See below:

 Thomas> thomas at skate:~/projets/linux-2.6$ cp ../buildroot/board/qemu/arm-versatile/linux-2.6.38.config .config
 Thomas> thomas at skate:~/projets/linux-2.6$ make ARCH=arm silentoldconfig

But it isn't a minimal config anymore, as we're doing make
<blah>_defconfig, tweak, make silentoldconfig.

Or am I missing something?

-- 
Bye, Peter Korsgaard
