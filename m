From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 13:57:35 +0200
Subject: [Buildroot] [PATCH] chrony: fix build failure due to missing
 inclusion of util.h
In-Reply-To: <20180927101544.9495-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Thu, 27 Sep 2018 12:15:44 +0200")
References: <20180927101544.9495-1-giulio.benetti@micronovasrl.com>
Message-ID: <87pnwzw3tc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > During build package stops with linker error:
 > hash_intmd5.o: In function `HSH_Hash':
 > hash_intmd5.c:(.text+0x963): undefined reference to `MIN'

 > This is due to missing util.h inclusion.
 > util.h contains MIN() macro definition.

 > Add upstream patch:
 > https://git.tuxfamily.org/chrony/chrony.git/commit/?id=948ecf84314f78da82e0e2b07b6570ca9cff86c8
 > to add #include "util.h" in hash_intmd5.c

 > Fixes:
 > http://autobuild.buildroot.net/results/8f0/8f0d53b1d5a899e56540c859b908cbc1eaa223d5/
 > http://autobuild.buildroot.net/results/3c6/3c609f94aff182c9ab47ef8ec4b9de03a4d20ffb/
 > http://autobuild.buildroot.net/results/f1f/f1fcae399fb640c19cf88c9333a92cbfab547932/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
