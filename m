From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:00:08 +0200
Subject: [Buildroot] [PATCH 2/2] dl-wrapper: Fix support for URIs
 containing '+'
In-Reply-To: <1528119150-28659-2-git-send-email-bbeckett@netvu.org.uk>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <1528119150-28659-2-git-send-email-bbeckett@netvu.org.uk>
Message-ID: <20180604220008.563afc4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 14:32:30 +0100, Robert Beckett wrote:
> '+' is a valid character in a url. The current dl-wrapper gets the
> URI scheme by dropping everything after the last '+' character, with
> the intension of finding 'git' from e.g. 'git+https://uri'.
> 
> If a uri has a '+' anywhere in it, it ends up using too much of the
> string as a scheme, and fails to match the handler properly.
> 
> An example of where this form of URI is used is when using deploy tokens
> in gitlab. It uses a form like https://<username>:<password>@gitlab.com/<group>/<repo.git>
> where username for deploy token is of the form 'gitlab+deploy-token-<number>'.
> 
> Use the %% operator to search backwards until the last '+' character when
> dropping the rest of the string as we know that the first '+'
> in the string should be the scheme.
> 
> Signed-off-by: Robert Beckett <bbeckett@netvu.org.uk>
> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
