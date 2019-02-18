From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:13:26 +0100
Subject: [Buildroot] [PATCH 2/2] support/scripts/setlocalversion: ignore
 user settings for Mercurial
In-Reply-To: <20190130201508.10304-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 30 Jan 2019 21:15:08 +0100")
References: <20190130201508.10304-1-patrickdepinguin@gmail.com>
 <20190130201508.10304-2-patrickdepinguin@gmail.com>
Message-ID: <8736olaxcp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > setlocalversion will use 'hg id' to determine whether or not the current
 > revision is tagged. If there is no tag, the Mercurial revision is printed,
 > otherwise nothing is printed.

 > The problem is that the user may have custom configuration settings (in
 > their ~/.hgrc file or similar) that changes the output of 'hg id' in a way
 > that the script does not expect. In such cases, the Mercurial revision may
 > not be printed or printed incorrectly.

 > It is good practice to ignore the user environment when calling Mercurial
 > commands from a well-defined script, by setting the environment variable
 > HGRCPATH to the empty string. See also 'hg help environment'.

 > In the particular case of Nokia, a custom extension adds dynamic tags in the
 > repository, i.e. tags that are stored in a file external to the repository
 > and only visible when the extension is active. These tags should not
 > influence the behavior of setlocalversion as they are not official Buildroot
 > tags, i.e. even if a revision is tagged, the Mercurial revision should still
 > be printed.

 > Note that this still does not solve the problem where an organization adds
 > _real_ tags in their Buildroot repository. For example, there might be a
 > moving tag 'last-validated' or tags indicating in which product release that
 > Buildroot revision was used. In these cases, setlocalversion will still not
 > behave as expected, i.e. show the Mercurial revision.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
