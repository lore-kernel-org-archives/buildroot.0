From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 19:50:03 +0200
Subject: [Buildroot] [PATCH] support/check-uniq-files: support weird
 locales and filenames
In-Reply-To: <20180331125250.19374-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 31 Mar 2018 14:52:50 +0200")
References: <20180331125250.19374-1-yann.morin.1998@free.fr>
Message-ID: <87bmeuewj8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when a filename contains characters not representable in the
 > user's locale, we fail hard, especially when the host python is python3.

 > This is because python2 and python3 handle encoding/decoding strings
 > differently, with python3 presumable doing the right thing, but it
 > breaks on some systems, while python2 presumable does the wrong thing,
 > but it works everywhere. (Just joking, obviously...)

 > Part of the issue being that the csv reader in python2 is broken with
 > UTF8.

 > We fix the issue by ditching the csv reader, and simply read the file in
 > binary mode, manually partitionning the lines on the first comma.

 > Then, we use the binary-encoded (really, un-encoded) package names and
 > filenames as values and keys, respectively.

 > Finally, for each filename of package we need to print, we try to decode
 > them with the default s for the usser settings, but catch any decoding
 > exception and fallback to dumping the raw, binary values. in that case.

 > Thanks a lot to Arnout for the live help doing this patch. :-)

 > Reported-by: Jaap Crezee <jaap@jcz.nl>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Jaap Crezee <jaap@jcz.nl>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
