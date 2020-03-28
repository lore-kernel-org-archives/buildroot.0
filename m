From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 28 Mar 2020 09:58:16 +0100
Subject: [Buildroot] [PATCH 2/3] Makefile: fix package file list if
 FOO_SUBDIR is set
In-Reply-To: <87v9mpc4ik.fsf@dell.be.48ers.dk>
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
 <20200318155814.567-2-patrickdepinguin@gmail.com>
 <87v9mpc4ik.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LXBd1nK56h9eyymw1ck7zpVW_hQ4MYm6_eOkd3eyqu8hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 28, 2020, 08:39 Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com>
> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > If a package sets a FOO_SUBDIR (meaning its sources are not under
>  > output/build/foo-123 but under output/build/foo-123/$(FOO_SUBDIR)), the
>  > .files-list.txt file were also created under FOO_SUBDIR, due to which
> the
>  > logic in the Makefile would not find it.
>
>  > Change the instrumentation steps so that the file list is directly
> under the
>  > package dir, ignoring the subdir.
>
>  > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
>
> Committed to 2020.02.x, thanks.
>
> This is not applicable to the older releases, right?
>

No indeed, I think this code that handles the file lists differently was
new in 2020.02.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200328/44b4c0f9/attachment.html>
