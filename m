From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 12:01:15 +0100
Subject: [Buildroot] [PATCH 1/1] support/download: Fix tarball
 generation - master branch patch
In-Reply-To: <20210318072817.403558-1-jpcartal@free.fr> (Jean-pierre Cartal's
 message of "Thu, 18 Mar 2021 08:28:16 +0100")
References: <20210318072817.403558-1-jpcartal@free.fr>
Message-ID: <87wntwn7d0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-pierre" == Jean-pierre Cartal <jpcartal@free.fr> writes:

 > fix tarball generation with symlinks pointing to ./something
 >     When a --transform expression is provided, it is by default also applied
 >     to the target of a symlink.

 >     When we create tarballs (from git or svn checkouts), we use a --transform
 >     expression to replace the leading ./ with the package name and version.

 >     This causes issues when a package contains symlinks that points to
 >     ./something, as the leading './' is also replaced.

 >     Fix that by using the 'S' transformation scope flag, as described in the
 >     tar manual:
 >         https://www.gnu.org/software/tar/manual/html_node/transform.html#transform

 >         In addition, several transformation scope flags are supported, that
 >         control to what files transformations apply. These are:

 >         ?r? Apply transformation to regular archive members.
 >         ?R? Do not apply transformation to regular archive members.
 >         ?s? Apply transformation to symbolic link targets.
 >         ?S? Do not apply transformation to symbolic link targets.
 >         ?h? Apply transformation to hard link targets.
 >         ?H? Do not apply transformation to hard link targets.

 >         Default is ?rsh? [...].

 >     Fixes: #13616

 > Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
