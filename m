From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 00:00:20 +0100
Subject: [Buildroot] [PATCH 06/17] i2c-tools: ensure binaries are
	installed in the right place
In-Reply-To: <20101208201055.3debc42f@surf> (Thomas Petazzoni's message of
	"Wed, 8 Dec 2010 20:10:55 +0100")
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
	<20101208201055.3debc42f@surf>
Message-ID: <87vd2yk35n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed,  8 Dec 2010 10:53:58 +0100
 Thomas> llandwerlin at gmail.com wrote:

 >> define I2C_TOOLS_INSTALL_TARGET_CMDS
 >> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin

 Thomas> In some packages you're doing mkdir -p, in others $(INSTALL) -m 755 -d.
 Thomas> Maybe we should standardize on one or the other ?

Actually, the nicest would imho be to use install -D (E.G. create parent
dirs if not available).

-- 
Bye, Peter Korsgaard
