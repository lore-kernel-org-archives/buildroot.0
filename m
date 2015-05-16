From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 13:55:58 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix static linking with OpenSSL
In-Reply-To: <5556FA75.60903@openwide.fr> (Romain Naour's message of "Sat, 16
 May 2015 10:06:13 +0200")
References: <1431464533-15795-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87sib0gb28.fsf@dell.be.48ers.dk> <5556FA75.60903@openwide.fr>
Message-ID: <87zj54busx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

Hi,

 > It doesn't work for BR2_SHARED_LIBS only:

 > http://autobuild.buildroot.net/results/483/48345d936c7972dc27ea12bdccfe0d02bbc4112b/build-end.log

 > -lcrypto is required for PEM_read_X509 and X509_free symbols.

 > What's about using 'pkg-config --libs openssl' instead ?

Or pkg-config --libs libssl libcrypto like I did for vsftpd in
205f07755661b64da215.

-- 
Venlig hilsen,
Peter Korsgaard 
