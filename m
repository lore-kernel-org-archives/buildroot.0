From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 22:45:26 +0100
Subject: [Buildroot] [PATCH 1/2] libupnp: add upstream security fix for
	CVE-2016-6255
In-Reply-To: <20161219223022.489e8546@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 19 Dec 2016 22:30:22 +0100")
References: <20161219131324.19811-1-peter@korsgaard.com>
 <20161219223022.489e8546@free-electrons.com>
Message-ID: <87eg13a8zt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 19 Dec 2016 14:13:23 +0100, Peter Korsgaard wrote:
 >> If there's no registered handler for a POST request, the default behaviour
 >> is to write it to the filesystem. Several million deployed devices appear
 >> to have this behaviour, making it possible to (at least) store arbitrary
 >> data on them. Add a configure option that enables this behaviour, and change
 >> the default to just drop POSTs that aren't directly handled.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> ...-unhandled-POSTs-to-write-to-the-filesyst.patch | 73 ++++++++++++++++++++++
 >> package/libupnp/libupnp.mk                         |  2 +
 >> 2 files changed, 75 insertions(+)
 >> create mode 100644 package/libupnp/0001-Don-t-allow-unhandled-POSTs-to-write-to-the-filesyst.patch

 > I've applied both to master, thanks!

 > I have to say that these security issues are terrible. The first one
 > because the feature by itself is really silly and one may wonder why
 > someone would implement such a feature in the first place. The second
 > one because when you see what the URL parsing code looks like, no
 > wonder why there are some security bugs in it...

Yeah, libupnp isn't really what I would best of class code :/

Thanks for applying the patches!

-- 
Bye, Peter Korsgaard
