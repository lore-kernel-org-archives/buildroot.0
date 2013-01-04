From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 21:31:07 +0100
Subject: [Buildroot] [PATCH 1/1] target: add different methods to encode
	passwords
In-Reply-To: <50E73970.8000404@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 04 Jan 2013 17:20:00 -0300")
References: <cover.1356890711.git.yann.morin.1998@free.fr>
 <4286e89fcb929e0f8280fe2da2782c93227c0353.1356890711.git.yann.morin.1998@free.fr>
 <50E73970.8000404@zacarias.com.ar>
Message-ID: <87lic8n110.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 12/30/2012 03:08 PM, Yann E. MORIN wrote:
 >> Passwords can be encoded in different ways (from the weakest
 >> to the strongest): des, md5, sha-256, sha-512
 >> 
 >> Add a choice entry to select the method, defaulting to 'md5'.
 >> 
 >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Gustavo> Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 Gustavo> However i'd like to see an option where the root password is untouched,
 Gustavo> probably as default.

 Gustavo> A slippy finger might get a bad surprise when upgrading to a
 Gustavo> new buildroot version and sees it's skeleton root password
 Gustavo> zapped away to nothing by surprise - an error that might take
 Gustavo> some time to get noticed and might even get shipped.  Regards.

Hmm, the root passwd stuff should only only be active if the default
rootfs skeleton is used (so no passwd). I see that's not the case today,
will fix.

-- 
Bye, Peter Korsgaard
