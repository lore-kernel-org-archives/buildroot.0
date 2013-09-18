From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Sep 2013 13:15:41 +0200
Subject: [Buildroot] [PATCH 3 of 4 RFC] manual: add section about
 depending on toolchain options
In-Reply-To: <89b40887c8268e316399.1379494896@argentina>
References: <patchbomb.1379494893@argentina>
 <89b40887c8268e316399.1379494896@argentina>
Message-ID: <CAAXf6LXD_7jt42XAG_XgKWKi_+te40hgYNd4mTLbmCDMxfG0QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Sep 18, 2013 at 11:01 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Currently, the comments in Config.in files when depending on toolchain options
> are not at all lined up. This patch adds a section to the documentation that
> explains which format is to be used.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> Notes:
> - How we will specify the C library is currently marked as 'to be decided'.
> This patch series does not yet unify that, but I plan to do that in a new
> patch (or update this series if we can reach a decision shortly).  The problem
> is that not all packages that have a dependency on e.g. glibc add a comment to
> show this to the user. A proposal would be to have a comment like:
>     foo needs a (e)glibc toolchain w/ featA, featB, featC
> where the '(e)glibc' string would be left out if there is no constraint on the
> C library.
>
> - For the 'dynamic library' option: there are packages that depend on it but do
> not have a comment indicating that. If there is an agreement on the format as
> shown in this patch, then I will do that.
>
>
>  docs/manual/adding-packages-directory.txt |  75 ++++++++++++++++++++++++++++---
>  1 files changed, 67 insertions(+), 8 deletions(-)
>


In the original thread, there were a few outstanding questions:
- capitalization
  In this series I have opted for the mixed capitalization (one of the
options mentioned by ThomasP): mostly lowercase except for acronyms
like RPC, IPv6, C++.

- which features to mention in comments
  After thinking about it, it makes sense to me to mention C++,
thread, wchar, RPC, dynamic library, and IPv6 in comments, and not to
mention MMU and target architecture. My reasoning is that the last two
are not freely choosable for a given project, while the other options
can pretty easily be turned on when desired.

I'm open to discussing this, if you do not agree.

Best regards,
Thomas
