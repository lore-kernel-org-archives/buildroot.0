From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 10:21:43 +0100
Subject: [Buildroot] [PATCH] package/syslogd: workaround a compiler bug
	with CS powerpc 2012.03
In-Reply-To: <56C79979.9080604@gmail.com> (Romain Naour's message of "Fri, 19
 Feb 2016 23:38:49 +0100")
References: <1455447313-14334-1-git-send-email-romain.naour@gmail.com>
 <8760xonw41.fsf@dell.be.48ers.dk> <56C79979.9080604@gmail.com>
Message-ID: <87povrhh3s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> Does this mean that sysklogd isn't using our TARGET_CFLAGS (where we
 >> most likely pass -Os)?

 > -O3 is added by SKFLAGS variable which is used as CFLAGS.
 > TARGET_CFLAGS is not taken into account :-/

 >> 
 >> Why don't we fix that instead?
 > We could try to replace SKFLAGS by CFLAGS...

Yes, I believe simply passing SKFLAGS="$(TARGET_CFLAGS)" would work.

Can you give it a try?

-- 
Venlig hilsen,
Peter Korsgaard 
