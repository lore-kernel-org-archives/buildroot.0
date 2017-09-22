From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 17:44:09 +0200
Subject: [Buildroot] [PATCH] libidn: add fix for CVE-2017-14062
In-Reply-To: <282d433579419f522c6daa7c1bdaf60574ef3d4f.1505450420.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 15 Sep 2017 07:40:20 +0300")
References: <282d433579419f522c6daa7c1bdaf60574ef3d4f.1505450420.git.baruch@tkos.co.il>
Message-ID: <871smysppy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing CVE-2017-14062:
 > Integer overflow in the decode_digit function in puny_decode.c in
 > Libidn2 before 2.0.4 allows remote attackers to cause a denial of
 > service or possibly have unspecified other impact.

 > This issue also affects libidn.

 > Unfortunately, the patch also triggers reconf of the documentation
 > subdirectory, since lib/punycode.c is listed in GDOC_SRC that is defined
 > in doc/Makefile.am. Add autoreconf to handle that.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
