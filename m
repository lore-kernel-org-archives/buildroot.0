From: Hajime Branko Yamasaki Vukelic <branko@brankovukelic.com>
Date: Tue, 24 Nov 2015 19:27:12 +0100
Subject: [Buildroot] Overriding Buildroot packages
In-Reply-To: <20151124164107.3570084a@free-electrons.com>
References: <CAPER3A0P1Qyd_=ktyHt=udawndUfHue8SE_zDQxMHjz+r+pPtg@mail.gmail.com>
 <20151124164107.3570084a@free-electrons.com>
Message-ID: <CAPER3A0tE2_edxtE65MaVUVUh3BOdqywb4jUANOe_4Jm+0fihw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 24, 2015 at 4:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

[SNIP]

> Are you able to give more details about which specific package you need
> to override and why? It would be useful for us to understand such use
> cases, and see if there is a different solution/option, or if the use
> case is really too specific.

I have a need to ship postgresql 9.5 beta instead of the stable 9.4.5.
Current solution is to create a postgres-95 package and modify
dependencies accordingly. Fortunately, this is currently just one
package, so it wasn't a big issue. Another package was bottle, on
which we gave up as not critical.

Ideally, ability to override some aspect of an existing package (e.g.,
only its version, or only the source URL, or something along those
lines) would be great to have. If not, then, a mechanism to make two
packages equivalent (something like virtual packages but applicaable
to packages that are not explicitly virtual) would also work (e.g.,
`POSTGRES_95_PROVIDES = postgres`, that causes having postgres-95
selected to satisfy dependency requirement for a package that
selects/depends on postgres).

-- 
Branko
branko at brankovukelic.com

/dev/blog: brankovukelic.com
