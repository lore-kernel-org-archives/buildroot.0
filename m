From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Jan 2019 09:55:04 +0100
Subject: [Buildroot] [PATCH] scripts/autobuild-run: add --branches option
In-Reply-To: <20190115141131.22754-1-arnout@mind.be>
References: <20190115141131.22754-1-arnout@mind.be>
Message-ID: <20190116095504.434690f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Jan 2019 15:11:31 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
> 
> The autobuild-run script will retrieve the list of branches to test
> from autobuild.buildroot.org. However, it the autobuild script is used
> to test some local configuration, this is probably not appropriate. The
> new --branches option allows to override the URL of the branches CSV
> file. A file:/// URL can be used for a local file.
> 
> Signed-off-by: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>

I had an alternate patch ready for this, which consists in changing
http-url to be the base URL, and not the submission URL.

I.e:

   '--http-url': 'http://autobuild.buildroot.org/submit/',

would become:

   '--http-url': 'http://autobuild.buildroot.org/',

And so the branches file would be retrieved from $(--http-url)/branches.

Would this work for you, or do you have a set up where the branches
file is not located at the same place as the submission URL ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
