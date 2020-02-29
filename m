From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 17:45:59 +0100
Subject: [Buildroot] [PATCH] package/openrc: needs kmod
In-Reply-To: <20200228202552.14788-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 28 Feb 2020 21:25:52 +0100")
References: <20200228202552.14788-1-yann.morin.1998@free.fr>
Message-ID: <87wo85gx4o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > openrc provides scritps that have been written for the big-gun kmod, and
 > so use options unknown to the biusybox' provided applets:

 >   - Busybox modprobe does not have a "--first-time" option,
 >   - the "--verbose" option is just "-v",
 >   - the "--use-blacklist" option is just "-b". Also blacklist support is
 >     not selected in our default busybox configuration.

 > One of two options, is to "fix" or "adapt" openrc's scripts to busybox,
 > which means for the openrc package to go peek into files from the
 > busybox package, which is not nice, and can't work because that is not
 > available by the time we scan our Makefiles.

 > The other option, which this patch implements, is to just add a
 > dependency onto kmod and its tools.

 > Reported-by: Carlos Santos <unixmania@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
