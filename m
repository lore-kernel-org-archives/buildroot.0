From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:47:59 +0100
Subject: [Buildroot] [PATCH 01/11] support/download: fix scp downloads
In-Reply-To: <20190103204026.23512-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Thu, 3 Jan 2019 21:40:16 +0100")
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-2-patrickdepinguin@gmail.com>
Message-ID: <874l9yib6o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > scp download is broken, because scp is called without filename argument and
 > only the server is specified. The call is:
 >     scp <server> <outputfile>

 > but should be:
 >     scp <server>/<filename> <outputfile>

 > Instead of assuming '-u' lists a full URL including filename (which it is
 > not), align with the wget helper where -u is the server URL and -f gives the
 > filename.

 > With this commit, an scp download can work if FOO_SITE_METHOD is explicitly
 > set to 'scp' and the server does not have a scheme prefix 'scp://'.
 > The next commit will handle the case where a scheme prefix is present.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
