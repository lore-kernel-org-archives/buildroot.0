From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 16:50:23 +0200
Subject: [Buildroot] [PATCH 2 of 5 v4 for 2014.08] gendoc infra: use
 $(pkgname) instead of explicitly passing 'manual'
In-Reply-To: <9d9af165df7bfedeefb6.1408110035@localhost>
References: <patchbomb.1408110033@localhost>
 <9d9af165df7bfedeefb6.1408110035@localhost>
Message-ID: <CAHXCMMJWPdoxi9bMyHRDVeKHVGseB0vDJ-N2Mz4C9n8v58nZtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 15, 2014 at 3:40 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> In the gendoc infrastructure, using an assignment of the form
>     FOO = docs/$(1)/bar
> inside GENDOC_INNER does not work as expected: the $(1) value is empty here
> and the value of FOO becomes 'docs//bar'.
>
> Parameters $(2), $(3), etc. do not have this problem. The specific thing
> about $(1) is that it is a parameter to GENDOC itself (indicating the
> document to create) and passed transparently to GENDOC_INNER.
>
> This is different from the package infrastructures, where $(1) is set from
> $(pkgname). In fact, the same strategy could be used by the gendoc
> infrastructure as well, as $(pkgname) resolves to 'manual' for file
> docs/manual/manual.mk. This has the advantage that the described problem
> does not occur.
>
> Note that this means that if we want to use the same GENDOC infrastructure
> for another document, it will have to reside in a separate directory than
> the manual.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
