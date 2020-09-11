From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:19:17 +0200
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: use the
 compiler as "LD"
In-Reply-To: <20200909213404.1105535-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 9 Sep 2020 23:34:04 +0200")
References: <20200909213404.1105535-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfhgvwoa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since commit efa95b19aeab6bdcd7d5a620e199c2c32cf2516b
 > ("package/libxml-parser-perl: make host build use correct compiler"),
 > we pass $(HOST_CONFIGURE_OPTS) when building host-libxml-parser-perl,
 > in order to use the correct host compiler.

 > However, this means that LD="$(HOSTLD)" is passed. However, the
 > host-libxml-parser-perl passes compiler arguments to LD, so it really
 > assumes that LD is gcc, not ld. For example, it tries to pass
 > -mtune=generic.

 > So, let's tell host-libxml-parser-perl that LD is "$(HOSTCC)".

 > Fixes:

 >   http://autobuild.buildroot.net/results/2ed2e5ccefe9047c597f84d5880de2e8de2bdd94/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
