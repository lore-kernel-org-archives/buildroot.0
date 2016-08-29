From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 13:28:57 +0200
Subject: [Buildroot] [PATCH] package/neon: properly enable expat
In-Reply-To: <1472463566-10906-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 29 Aug 2016 11:39:26 +0200")
References: <1472463566-10906-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <8760qj7r0m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we forcibly tell neon's configure where to look for libexpat.
 > This means that neon does not search for it, and consequently forgets to
 > add -lexpat as its Libs.Private in its .pc file. As thus, a static link
 > against neon forgets to pull in -lexpat (it works for a dynamic link
 > because libneon has a NEEDED on libexpat).

 > The reason for specifying the explicit path in this case is lost to
 > history; neon's configure can correctly find libexpat nowadays.

 > Fixes:
 >     http://autobuild.buildroot.org/results/884/884746351fc47f4ad19fb3fda7c5e0ee85fcff15/
 >     http://autobuild.buildroot.org/results/0c5/0c584522c26640e29980150a87a5b5d8c02e5f8b/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
