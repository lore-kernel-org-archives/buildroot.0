From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:13:16 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/setlocalversion: fix
 detection of hg revision when _not_ on branch 'default'
In-Reply-To: <20190130201508.10304-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 30 Jan 2019 21:15:07 +0100")
References: <20190130201508.10304-1-patrickdepinguin@gmail.com>
Message-ID: <877edxaxcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > When Buildroot is stored in a Mercurial repository on a branch other than
 > 'default' ('master' in git terms), setlocalversion (used to populate
 > /etc/os-release) will incorrectly think that this is a tagged version and
 > will NOT print out the revision hash.

 > This is due to the fact that the output of 'hg id' is assumed to be
 >     "<revision> <tags-if-any>"
 > but when on a branch it actually is:
 >     "<revision> (<branch>) <tags-if-any>"

 > To let setlocalversion receive the output it expects, explicitly ask 'hg id'
 > to retrieve only the revision hash and any tags, ommitting any branch
 > information.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
