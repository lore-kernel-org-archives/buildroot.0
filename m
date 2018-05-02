From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 May 2018 21:34:43 +0200
Subject: [Buildroot] [PATCH 1/1] libgsasl: add mandatory dependency on
 wchar
In-Reply-To: <20180502155857.2933-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 May 2018 17:58:57 +0200")
References: <20180502155857.2933-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvrpdf70.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libgsasl needs wctomb, if not available it will define it to
 > rpl_wctomb. However, as there is no rpl_wctomb implementation, the .so
 > ends up with an undefined reference to wctomb.

 > This will cause linker errors for packages trying to use it such as
 > msmtp:
 > /home/peko/autobuild/instance-0/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr//lib/libgsasl.so:
 > undefined reference to `wctomb'

 > Fixes:
 >  - http://autobuild.buildroot.net/results/1bc7cb9a2dd1af746c78f3150528206b7256e40f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
