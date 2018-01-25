From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jan 2018 21:05:54 +0100
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
In-Reply-To: <1601364457.72803.1516896858319.JavaMail.zimbra@datacom.ind.br>
 (Carlos Santos's message of "Thu, 25 Jan 2018 14:14:18 -0200 (BRST)")
References: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
 <1601364457.72803.1516896858319.JavaMail.zimbra@datacom.ind.br>
Message-ID: <87lgglln4t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

 >> sys-utils/rfkill.c:67: error: ?RFKILL_TYPE_FM? undeclared here (not in a
 >> function)

 > RFKILL_TYPE_FM should be defined in /usr/include/linux/rfkill.h, which is
 > included by sys-utils/rfkill.c (line 26).

 > Please edit package/util-linux/util-linux.mk and add "--disable-rfkill"
 > to HOST_UTIL_LINUX_CONF_OPTS.

We should probably do that unconditionally, there is no need for rfkill
for the host.

Will you send a patch for this?

-- 
Bye, Peter Korsgaard
