From: Alexander Kriegisch <Alexander@Kriegisch.name>
Date: Tue, 09 Oct 2007 02:03:17 +0200
Subject: [Buildroot] usage of '-rm -f ...' in .mk files
In-Reply-To: <0710090011020.20512@somehost>
References: <0710090011020.20512@somehost>
Message-ID: <470AC545.5070605@Kriegisch.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Isn't it so that we want to know if an attempt to remove unremovable
> files occurs, instead of ignoring errors by using '-rm -f'?

I would say it depends on the situation. Normally the inability to
remove files during a cleanup might not be considered worthy of turining
into a show-stopper for the whole make process. In other cases that
might well be so, and I guess it should be up to the developer writing
the makefile to decide if she wants a possible error printed, but
continue with whatever target is being built, or if she regards a failed
unlink severe enough to yield an error.

Having said that, I concede that "rm -f" usually does not exit with an
error anyway, thus rendering "-rm -f" kind of useless. But on the other
hand, double safety never hurts, and explicit coding helps understand
what the author intends with a certain line of code. The leading dash is
a clear statement saying "whatever happens, go on". Furthermore, there
might be improbable cases in which a certain "rm" implementation might
yield an error anyway. Given the fact that Busybox sometimes is very
terse in error handling, leaving out improbable error conditions in
order to save space, I would not say that an error during "rm -f" is
absolutely impossible. I have not looked into the source code, though.

Regards
--
Alexander Kriegisch
