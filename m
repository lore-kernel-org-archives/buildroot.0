From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 22:40:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/rsh-redone: disable rlogind on
 musl
In-Reply-To: <20200927093940.1491555-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 27 Sep 2020 11:39:40 +0200")
References: <20200927093940.1491555-1-fontaine.fabrice@gmail.com>
Message-ID: <877ds81hw6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit f89ca996b6deb660b53c33196b8b309fac659bf9 enabled linux-pam on
 > musl however rlogind fails to build on musl because it uses logwtmp:

 > /home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: rlogind.c:(.text.startup+0x9ec): undefined reference to `logwtmp'

 > As this package is unmaintained, just disable back rlogind on musl

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f2eb1c0bab7c6c32d6c561da0f85a530bd419206

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
