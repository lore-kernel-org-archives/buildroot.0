From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Dec 2010 17:17:48 +0100
Subject: [Buildroot] Build failure on msgfmt
In-Reply-To: <20101220150052.662a3707@surf> (Thomas Petazzoni's message of
	"Mon, 20 Dec 2010 15:00:52 +0100")
References: <393933.14584.qm@web121804.mail.ne1.yahoo.com>
	<20101220150052.662a3707@surf>
Message-ID: <871v5c1kr7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> This is because your gettext package from your distribution is
 Thomas> too old, and msgfmt doesn't understand some newer keywords of
 Thomas> the libglib2 .po files.

 Thomas> Peter, maybe we should build gettext for the host instead of
 Thomas> relying on the distribution msgfmt ? What do you think ? Or
 Thomas> should be add a check to verify that msgfmt is sufficiently
 Thomas> recent ?

Like always, it's a question about pros/cons:

- How many packages need it?
- How uncommon is the dependency? Are there any version dependencies?
- How long does it take to build? Does it have a lot of dependencies?

If gettext comes out positive, then I don't have any issue adding it.

-- 
Bye, Peter Korsgaard
