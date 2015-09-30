From: Alex Suykov <alex.suykov@gmail.com>
Date: Thu, 1 Oct 2015 01:52:34 +0300
Subject: [Buildroot] [RFC 1/2] non-versioned packages
In-Reply-To: <20150930221517.GA3702@free.fr>
References: <39cc9541d430e29d38dc07ef2c1d975687cf2af3.1443645945.git.alex.suykov@gmail.com>
 <20150930221517.GA3702@free.fr>
Message-ID: <20150930225234.GA29781@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thu, Oct 01, 2015 at 12:15:17AM +0200, Yann E. MORIN wrote:

> And yes, I would like to keep being able to have packages without a
> version.Even if  upstream are not playing by the rules, it is perfectly
> legit that we have support for that.

Sorry, bad wording in patch description. Packages with explicitly
set (PKG)_SOURCE are ok, they only get build dir name change:
output/build/initscripts-undefined -> output/build/initscripts and so on.

The change is for packages that lack both _VERSION and _SOURCE.
Current BR behavior is to assign (PKG)_SOURCE = (pkg)-undefined.tar.gz
and try to download that, which I think is never correct.
It's either explicitly-set custom SOURCE, or no sources at all.
