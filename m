From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:26:13 +0200
Subject: [Buildroot] [PATCH] package/polkit: properly autoreconf
In-Reply-To: <20200404130812.3307956-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 4 Apr 2020 15:08:12 +0200")
References: <20200404130812.3307956-1-thomas.petazzoni@bootlin.com>
Message-ID: <87wo5peiru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > 0001-make-netgroup-support-optional.patch patches configure.ac, but we
 > don't autoreconf the package, which is not good.

 > However, simply adding AUTORECONF = YES is not sufficient: polkit
 > Makefile.am use the automake conditional HAVE_INTROSPECTION, which is
 > "available" only when the gobject-introspection m4 file is installed.

 > Since we don't want to make gobject-introspection a mandatory
 > dependency of polkit, we take a simpler route: add a copy of
 > introspection.m4 into the polkit source tree. This is only a 142 lines
 > file, and it can be dropped when
 > 0001-make-netgroup-support-optional.patch is merged upstream.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
