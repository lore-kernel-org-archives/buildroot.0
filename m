From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 13:41:33 +0100
Subject: [Buildroot] [git commit] erlang: use libatomic_ops if available
In-Reply-To: <20141216132618.5c19cb84@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 16 Dec 2014 13:26:18 +0100")
References: <20141215215003.A758F80403@busybox.osuosl.org>
 <20141216132618.5c19cb84@free-electrons.com>
Message-ID: <8761dbkbr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 15 Dec 2014 22:36:24 +0100, Peter Korsgaard wrote:

 >> Erlang can either provide its own atomic_ops implementation or use the
 >> one in libatomic_ops. This patch ensures that it only uses the one from
 >> libatomic_ops if it is available.

 > Is this really what we want to do? In such cases, we normally always
 > force to use the "system" version of the library rather than the
 > built-in one. Why should Erlang be treated differently, especially if
 > using the "system" version of the library works fine?

So in other words, make erlang select libatomic_ops? That sounds fine to
me.

-- 
Bye, Peter Korsgaard 
