From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 22:28:29 +0200
Subject: [Buildroot] [V4 1/3] libtommath: new package
In-Reply-To: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 10 Apr 2016 16:55:24 +0200")
References: <1460300126-11046-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87h9em23v6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

I was going to apply this, but I'm now not so sure after all.

- Dropbear linked with external libtom* is 25% bigger (375K vs 300K)
- We need to patch dropbear
- Libtomcrypt and dropbear need extra fixes to build without wchar
  (LTC_NO_WCHAR)
- Nothing else uses libtommath/crypt, and other distributions
  (E.G. Debian) also use the bundled libraries.

Can you explain if there's any strong reasons to not use the bundled
versions?

-- 
Bye, Peter Korsgaard
