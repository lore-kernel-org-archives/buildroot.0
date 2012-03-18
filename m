From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Mar 2012 21:40:34 +0100
Subject: [Buildroot] [PATCH] netsnmp: add option to enable debugging code
In-Reply-To: <201203181837.30186.arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 18 Mar 2012 18:37:30 +0100")
References: <1331845467-5100-1-git-send-email-luca@lucaceresoli.net>
 <201203181837.30186.arnout@mind.be>
Message-ID: <87pqc9mym5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Thursday 15 March 2012 22:04:27 Luca Ceresoli wrote:
 >> +ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 >> +       NETSNMP_CONF_OPT += --disable-debugging
 >> +endif

 Arnout>  Peter, is it correct that you prefer to have both the positive
 Arnout> and the negative option in such a situation?  I.e.

 Arnout> ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
 Arnout>        NETSNMP_CONF_OPT += --enable-debugging
 Arnout> else
 Arnout>        NETSNMP_CONF_OPT += --disable-debugging
 Arnout> endif

I don't feel strongly about it, but the 2nd approach means you don't
need to look at configure.ac to check if it defaults to --enable (and it
won't break if the default is ever changed).

-- 
Bye, Peter Korsgaard
