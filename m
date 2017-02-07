From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 14:24:00 +0100
Subject: [Buildroot] [PATCH v2 1/2] bctoolbox: new package
In-Reply-To: <1486472049.1692.1.camel@embedded.rocks> (=?utf-8?Q?=22J?=
 =?utf-8?Q?=C3=B6rg?= Krause"'s message
 of "Tue, 07 Feb 2017 13:54:09 +0100")
References: <20170122210021.9463-1-joerg.krause@embedded.rocks>
 <87mvdytffw.fsf@dell.be.48ers.dk>
 <1486472049.1692.1.camel@embedded.rocks>
Message-ID: <87efzat9qn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> Samuel/J?rg, any idea how this should work?

 > I already had a look at this, but had no time to prepare a fix for it
 > so far. The problem is that `-lmbedtls` is missing after `-L`. So it
 > should be:

 > set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}?-lmbedtls")

Yes, that and the fact that mbedtls_library_path is empty, so gcc errors
out with a missing path.

-- 
Bye, Peter Korsgaard
