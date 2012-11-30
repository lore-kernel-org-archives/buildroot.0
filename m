From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 11:53:20 -0800
Subject: [Buildroot] [PATCHv2] flex: fix build for nommu systems
In-Reply-To: <1354272363-10162-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 30 Nov 2012 07:46:03 -0300")
References: <1354272363-10162-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txs6amvj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The flex binary uses fork() so it breaks on !MMU builds.
 Gustavo> Since we usually don't require flex in the target and the common
 Gustavo> scenario is that we just want libfl in staging reverse the options so
 Gustavo> that BR2_PACKAGE_FLEX just builds and install libfl.a and change the
 Gustavo> LIBFL option to BR2_PACKAGE_FLEX_BINARY to install the binary in the
 Gustavo> target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
