From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 29 Sep 2014 00:02:49 +0200
Subject: [Buildroot] [PATCH] pkg-utils: the MESSAGE macro already
	double-quotes the message
In-Reply-To: <1411079328-30097-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 19 Sep 2014 00:28:48 +0200")
References: <1411079328-30097-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <874mvrs8s6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > ... so passing a double-quoted message to the macro defeats the quoting
 > altogether.

 > Remove double-quotation of messages. Change made with:
 >     $ sed -r -i -e 's/(call MESSAGE,)"(.*)"\)/\1\2)/g' \
 >           $(git grep -l -E 'call MESSAGE."')

Thanks. I think it would be nicer to leave all the call sites alone and
just use qstrip in the MESSAGE implementation.

That way it doesn't break if we ever call MESSAGE with a string
containing a ",".

-- 
Bye, Peter Korsgaard
