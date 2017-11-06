From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 18:43:14 +0100
Subject: [Buildroot] [PATCH] libssh2: revert to previous crypto defaults
In-Reply-To: <20171105213402.26615-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 5 Nov 2017 22:34:02 +0100")
References: <20171105213402.26615-1-peter@korsgaard.com>
Message-ID: <87y3njwbf1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The recent crypto handling change (commit 04a1031d3: package/libssh2: Add
 > selectable crypto libraries) had the unfortunate side effect that it no
 > longer automatically selects the most suitable crypto backend (E.G.  one
 > where the dependency is already enabled), so all users not wanting to use
 > the mbedtls backend need to explicitly configure this.

 > Fix this by inverting the logic so the crypto backend sub options use
 > 'depends on' their dependencies instead of 'select', so only the available
 > backends are displayed.

 > Like before, default to openssl if no crypto backend dependencies are
 > currently enabled.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

I've also adjusted CHANGES.

-- 
Bye, Peter Korsgaard
