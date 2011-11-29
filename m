From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 29 Nov 2011 14:47:40 +0100
Subject: [Buildroot] [PATCH] manual: update download helper information
In-Reply-To: <6c839699d7bff0a18000.1321361169@devws108>
References: <6c839699d7bff0a18000.1321361169@devws108>
Message-ID: <CAAXf6LXP_=dqvbx296-44Hm7edakjjV+q-_VnEX4urht=asuBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 16, 2011 at 7:27 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> ?docs/manual/adding-packages-gentargets.txt | ?34 +++++++++++++++++++++-------------
> ?1 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
> --- a/docs/manual/adding-packages-gentargets.txt
> +++ b/docs/manual/adding-packages-gentargets.txt
> @@ -146,28 +146,36 @@ information is (assuming the package nam
> ? after extraction.
>
> ?* +LIBFOO_SITE+ may contain the Internet location of the package. It
> - ?can either be the HTTP or FTP location of a tarball, or the URL of a
> - ?Git or Subversion repository (see +LIBFOO_SITE_METHOD+ below). If
> - ?+HOST_LIBFOO_SITE+ is not specified, it defaults to
> + ?can either be the HTTP, FTP or SCP location of a tarball, or the URL
> + ?of a Git, Subversion, Mercurial or Bazaar repository (see
> + ?+LIBFOO_SITE_METHOD+ below). +
> + ?SCP URLs should be of the form +scp://[user@]host:filepath+. Note
> + ?that filepath is relative to the user's home directory, so you may want
> + ?to prepend the path with a slash for absolute paths:
> + ?+scp://[user@]host:/absolutepath+. +
> + ?If +HOST_LIBFOO_SITE+ is not specified, it defaults to
> ? +LIBFOO_SITE+. If none are specified, then the location is assumed
> ? to be
> ? +http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename+. +
> ? Examples: +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
> - ?+LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+
> + ?+LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
> + ?+LIBFOO_SITE=git://github.com/kergoth/tslib.git+
>
> ?* +LIBFOO_SITE_METHOD+ may contain the method to fetch the package
> ? source code. It can either be +wget+ (for normal FTP/HTTP downloads
> - ?of tarballs), +svn+, +git+ or +bzr+. ?When not specified, it is
> - ?guessed from the URL given in +LIBFOO_SITE+: +svn://+, +git://+ and
> - ?+bzr://+ URLs will use the +svn+, +git+ and +bzr+ methods
> + ?of tarballs), +scp+ (for downloads over SSH with scp), +svn+, +git+,
> + ?+hg+ or +bzr+. ?When not specified, it is guessed from the URL given
> + ?in +LIBFOO_SITE+: +scp://+, +svn://+, +git://+ and
> + ?+bzr://+ URLs will use the +scp+, +svn+, +git+ and +bzr+ methods
> ? respectively. All other URL-types will use the +wget+ method. So for
> ? example, in the case of a package whose source code is available
> - ?through Subversion repository on HTTP, one 'must' specifiy
> - ?+LIBFOO_SITE_METHOD=svn+. For +svn+ and +git+ methods, what
> - ?Buildroot does is a checkout/clone of the repository which is then
> - ?tarballed and stored into the download cache. Next builds will not
> - ?checkout/clone again, but will use the tarball directly. When
> - ?+HOST_LIBFOO_SITE_METHOD+ is not specified, it defaults to the value
> + ?through a Subversion repository on HTTP, one 'must' specifiy
> + ?+LIBFOO_SITE_METHOD=svn+. Similarly, for Mercurial repositories, one
> + ?'must' specify +LIBFOO_SITE_METHOD=hg+. For +svn+, +git+, +hg+ and
> + ?+bzr+ methods, what Buildroot does is a checkout/clone of the repository
> + ?which is then tarballed and stored into the download cache. Next
> + ?builds will not checkout/clone again, but will use the tarball directly.
> + ?When +HOST_LIBFOO_SITE_METHOD+ is not specified, it defaults to the value
> ? of +LIBFOO_SITE_METHOD+. See +package/multimedia/tremor/+ for an
> ? example.
>
>
>
>

bump
