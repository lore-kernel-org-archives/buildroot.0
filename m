From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Jan 2011 10:02:32 +0100
Subject: [Buildroot] [PATCH 06/10] autotools: allow host package to use
	<pkg>_MAKE_ENV and <pkg>_MAKE
In-Reply-To: <20110125085533.35bd27e1@surf> (Thomas Petazzoni's message of
	"Tue, 25 Jan 2011 08:55:33 +0100")
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<cover.1295866866.git.thomas.petazzoni@free-electrons.com>
	<178a42636fdb3c6119ca718a24b14a22c9c9df28.1295866866.git.thomas.petazzoni@free-electrons.com>
	<87ei82qaho.fsf@macbook.be.48ers.dk> <20110125085533.35bd27e1@surf>
Message-ID: <87d3nlpd93.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Mon, 24 Jan 2011 22:04:35 +0100
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Hmm, I don't really like this. Packages might be adding target specific
 >> stuff to their $PKG_MAKE_ENV - E.G.:
 >> 
 >> lvm2/lvm2.mk:LVM2_MAKE_ENV = CC="$(TARGET_CC)"
 >> 
 >> Wouldn't it make more sense to add a HOST_$PKG_MAKE_ENV and use it just
 >> like we do for $PKG_MAKE_ENV (E.G. at build and install time)?

 Thomas> $$(PKG) is already HOST_FOOBAR. So, when I do:

Ahh yes, true - Thanks.

-- 
Bye, Peter Korsgaard
