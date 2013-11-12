From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Nov 2013 23:21:30 +0100
Subject: [Buildroot] [PATCH 1 of 6 v3] legal info: fix saving of host
	package licenses
In-Reply-To: <ceeae60921411209ff53.1384246076@argentina> (Thomas De
 Schampheleire's message of "Tue, 12 Nov 2013 09:47:56 +0100")
References: <patchbomb.1384246075@argentina>
 <ceeae60921411209ff53.1384246076@argentina>
Message-ID: <87y54t2rdh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

> Due to some tricky make behavior, the license texts of host packages that
> did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
> The problem is that it is not straightforward to use a variable
> defined/updated inside an evaluated block as input to a foreach statement.
> If you try to use $(FOO) then only the original value of FOO is used for
> foreach, any update inside the block is ignored. However, if you use
> $$(FOO), the entire contents of FOO (typically a list of items) is passed
> as one item to foreach, thus causing just one iteration instead of several.

>> From Arnout Vandecapelle's explanation:
> Any variable referenced with a single $ inside the inner-generic-package
> macro is expanded before the resulting contents are eval'ed. Therefore, it
> is not possible to refer to variables defined by the inner-generic-package
> macro from within a single-$ function call.

> To fix the problem, one should defer the evaluation of the entire block
> using double dollar signs.

> Additionally, a few empty lines have been added to the legal-info-foo block
> for clarity.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> v3:
> - simplify solution based on Arnout's insight

Committed, thanks.

-- 
Bye, Peter Korsgaard
