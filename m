From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:32:17 +0200
Subject: [Buildroot] [git commit] dl-wrapper: Fix support for URIs
 containing '+'
In-Reply-To: <20180604195819.0165983860@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 4 Jun 2018 21:59:55 +0200")
References: <20180604195819.0165983860@busybox.osuosl.org>
Message-ID: <87d0vml3lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a5ba72946ebf597a163bae9b12453dfa68993d54
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > '+' is a valid character in a url. The current dl-wrapper gets the
 > URI scheme by dropping everything after the last '+' character, with
 > the intension of finding 'git' from e.g. 'git+https://uri'.

 > If a uri has a '+' anywhere in it, it ends up using too much of the
 > string as a scheme, and fails to match the handler properly.

 > An example of where this form of URI is used is when using deploy tokens
 > in gitlab. It uses a form like https://<username>:<password>@gitlab.com/<group>/<repo.git>
 > where username for deploy token is of the form 'gitlab+deploy-token-<number>'.

 > Use the %% operator to search backwards until the last '+' character when
 > dropping the rest of the string as we know that the first '+'
 > in the string should be the scheme.

 > Signed-off-by: Robert Beckett <bbeckett@netvu.org.uk>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
