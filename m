From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 22:32:11 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix bfin compile
In-Reply-To: <20160921202107.32301-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 21 Sep 2016 22:21:07 +0200")
References: <20160921202107.32301-1-joerg.krause@embedded.rocks>
Message-ID: <87intpro38.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > A GCC bug is triggered when the compiler is run with an optimization level
 > '-Os/-O2/-O3' for the Blackfin architecture:

 > ```
 > error: unable to find a register to spill in class 'CCREGS'
 > ```

 > Workaround this bug by forcing an optimization level of '-O1' when building
 > libxslt for the Blackfin architecture.

 > See GCC bug report:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed after adding references to the autobuilder failures, thanks.

-- 
Bye, Peter Korsgaard
