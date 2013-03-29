From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 29 Mar 2013 16:14:36 +0100
Subject: [Buildroot] [PATCH] pkg-download with git and not VERSION set
	in package
In-Reply-To: <1364565071-29173-1-git-send-email-Patrick.Boettcher@parrot.com>
References: <1364565071-29173-1-git-send-email-Patrick.Boettcher@parrot.com>
Message-ID: <CAAXf6LU45qV6nzfbfyEP1WjwoJ7DT2K499sHZrMk=mwHuuRvTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Mar 29, 2013 at 2:51 PM, Patrick Boettcher <
pboettcher@kernellabs.com> wrote:

> I'm new to buildroot and was playing with a local git-tree. I noticed
> that things weren't working when VERSION is not set in the package.
>
> The following patch is trivial but solves the problem with the current
> implemenation.
>
> Please copy me on replies as I'm not yet subscribed.
>
> Patrick Boettcher (1):
>   pkg-download: take some more care of <PKG_>VERSION when METHOD is git
>
>  package/pkg-download.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

If the concept of this patch is accepted, then I think it should also be
done for Mercurial. The reasoning is the same, the only difference is that
HEAD is called 'tip'.

Also, I think you should put a comment about this in the code, because it
is not trivial at first reading that HEAD/tip will always be the version
specified in the package, if any.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130329/33fe2a45/attachment.html>
