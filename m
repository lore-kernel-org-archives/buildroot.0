From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2020 23:30:50 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/exim: fix build error during
 install step
In-Reply-To: <20200210214840.15023-4-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Mon, 10 Feb 2020 22:48:40 +0100")
References: <20200210214840.15023-1-luca@lucaceresoli.net>
 <20200210214840.15023-4-luca@lucaceresoli.net>
Message-ID: <87d0akiwo5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > exim builds some files during the 'make install' step, and these fail with
 > an error:

 >   lookups/lf_quote.c:49:3: error: 'for' loop initial declarations are only allowed in C99 mode
 >      for (int j = 0; j < vlength; j++)
 >      ^

 > Fix by passing the -std=c99 here, as it is already passed in the build
 > step.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

 > ---
 > Changes since v1: none.

Committed, thanks.

-- 
Bye, Peter Korsgaard
