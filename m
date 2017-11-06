From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 07:22:46 +0100
Subject: [Buildroot] [PATCH] libssh2: revert to previous crypto defaults
In-Reply-To: <20171106044905.dmcl4skovwtypj63@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 6 Nov 2017 06:49:05 +0200")
References: <20171105213402.26615-1-peter@korsgaard.com>
 <20171106044905.dmcl4skovwtypj63@sapphire.tkos.co.il>
Message-ID: <874lq8ylhl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Nov 05, 2017 at 10:34:02PM +0100, Peter Korsgaard wrote:
 >> The recent crypto handling change (commit 04a1031d3: package/libssh2: Add
 >> selectable crypto libraries) had the unfortunate side effect that it no
 >> longer automatically selects the most suitable crypto backend (E.G.  one
 >> where the dependency is already enabled), so all users not wanting to use
 >> the mbedtls backend need to explicitly configure this.
 >> 
 >> Fix this by inverting the logic so the crypto backend sub options use
 >> 'depends on' their dependencies instead of 'select', so only the available
 >> backends are displayed.
 >> 
 >> Like before, default to openssl if no crypto backend dependencies are
 >> currently enabled.

 > The CHANGES file needs an update. It currently says:

 >   The default is mbedtls, even if you didn't have mbedtls selected before.

Correct, that needs to adjusted when/if this gets applied.

-- 
Bye, Peter Korsgaard
