From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Oct 2013 12:37:50 +0200
Subject: [Buildroot] [PATCHv2] toolchain-external: add a specific check
 to avoid Angstrom toolchains
In-Reply-To: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LW+hio2zjRy5LaxRPyKQ2bXeNKdVPB8zgQONmBn04YD-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 13, 2013 at 10:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The Angstrom toolchains available at
> http://www.angstrom-distribution.org/toolchains/ are not usable as
> external toolchains in Buildroot, because they are not pure toolchains
> with just the C library, but instead complete SDKs with many
> cross-compiled libraries (Gtk, Qt, glib, neon, sqlite, X.org, and many
> more, approximately 200 MB of libraries).
>
> Buildroot cannot use such toolchains, and while this is documented in
> our manual, some users still try to do this. Today, one such user came
> on the IRC channel, reporting a build problem, which we started
> investigating, only to realize after a long time that he was using an
> Angstrom toolchain.
>
> To avoid this problem in the future, we explicitly check if the
> toolchain is from Angstrom by looking at the vendor part of the tuple
> exposed by the toolchain: as soon as it is
> <something>-angstrom-<something-else>, we reject the toolchain with an
> explanation.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>
>  * Fix typos in the comments (Thomas DS)
>  * Rename function to check_unusable_toolchain (Thomas DS)
>  * Use -dumpmachine instead of -v and some nasty sed'ing (Thomas DS)
>  * Add quotes around $${vendor} (Thomas DS)
>
>  toolchain/helpers.mk                               | 18 ++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk |  1 +
>  2 files changed, 19 insertions(+)

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
