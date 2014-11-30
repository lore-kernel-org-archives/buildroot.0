From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 09:33:14 +0100
Subject: [Buildroot] [PATCH V3 2/5] package/squid: add init script
In-Reply-To: <547A2180.2000905@oliseo.fr>
References: <1415808993-2394-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1416322487-14247-3-git-send-email-guillaume.gardet@oliseo.fr>
 <20141123221807.48818807@free-electrons.com>
 <547A2180.2000905@oliseo.fr>
Message-ID: <20141130093314.2804d081@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Nov 2014 20:41:52 +0100, Guillaume GARDET - Olis?o wrote:

> >> +# (Re)create log directory and give access to squid user (nobody)
> >> +if [ ! -d $SQUID_LOG_DIR ]; then
> >> +	mkdir -p $SQUID_LOG_DIR
> >> +	chmod 777 $SQUID_LOG_DIR
> > Clearly, this doesn't look good. Don't we have a better option than 777
> > the log directory?
> 
> Maybe create a squid user? Not sure how to handle this in buildroot. What do you think?

Well, if squid currently runs as root, why do you need to "chmod 777"
the log directory?

But indeed, it would be nicer to run squid as a user. Look at
<pkg>_USERS and <pkg>_PERMISSIONS in the Buildroot manual, or grep
through the packages for such definitions, you'll see some examples on
how to achieve that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
