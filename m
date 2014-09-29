From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Sep 2014 08:44:39 +0200
Subject: [Buildroot] [PATCH] pkg-utils: qstrip MESSAGE
In-Reply-To: <1411942116-1045-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 29 Sep 2014 00:08:36 +0200")
References: <1411942116-1045-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zjdjq620.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, the MESSAGE macro double-quotes the message. But a few call
 > sites also double-quote the message, resulting in a borked call to echo,
 > like:
 >     $(call MESSAGE,"user text")
 > would expand to:
 >     echo "Leading text "user message" trailign text"

 > Just use qstrip on the user message, so we get protected from either a
 > comma in the user text (so make does not interpret it), or a semi-colon
 > (so the shell does not interpret it.)

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
