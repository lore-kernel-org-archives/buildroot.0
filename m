From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 23:10:51 +0100
Subject: [Buildroot] [PATCH] sysvinit/inittab: adjust shutdown
In-Reply-To: <1416511120-29954-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 20 Nov 2014 16:18:40 -0300")
References: <1416511120-29954-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbm9ed5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The previous shutdown sequence was basically a no-op, it did't call rcK
 > to stop anything and dumped users back into shell.
 > So do the proper thing by calling rcK for levels 0 (halt) and 6
 > (reboot), then swapoff, then remount ro.
 > After that call halt for 0 and reboot for 6.

 > Also make 3 the default runlevel as in normal distributions, for all
 > intents and purposes it changes nothing except aesthetics/convention.

 > And make the labels a context sequence rather than just a short form
 > of the actions which IMHO looks horrible.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
