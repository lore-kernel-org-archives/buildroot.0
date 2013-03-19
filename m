From: =?ISO-8859-1?Q?Jesper_Birks=F8_B=E6kdahl?= <jbb@gamblify.com>
Date: Tue, 19 Mar 2013 14:23:13 +0100
Subject: [Buildroot] [PATCH 000/120] x11: update to R7.7
In-Reply-To: <20130318160415.704c31a2@skate>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
 <20130318160415.704c31a2@skate>
Message-ID: <CALnvph238b9O2Db3DoOYPw6VLPpW39Tz2z3HcM=C+og=q-bH5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Mon, Mar 18, 2013 at 4:04 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
>
> I had a look at your patch set from your Git repository, I guess the
> version of the patches you're posting now haven't changed much.
>

Thanks for taking a look at it. Yes the patches have not changes since.


>  * xcb-util removal? We have new packages that depend on it, so it
>    looks strange... See xcb-util-wm


>  * xproto_fontcacheproto removal: it is still being used as a
>    dependency in xlib_libXfont.mk.
>

Yes, I missed that. Im going to undo those.

 * xutil_util_macros, the commit log says it bumps the revision to
>    X11R7.7, but the commit only adds a patch (which also happens to
>    lack a description).
>

Will take a look at it.


>  * xproto_xf86rushproto: same problem as other packages, it is removed
>    while it is still being used by the X.org server (which gets
>    changed only later in the patch series).
>
> Generally speaking, I would suggest to put all the version bumps and
> related dependency removals first, and then the package removals.
>
> That said, achieving complete bisectability may be difficult: many of
> the version bumps are related, and it may be hard to find the right
> ordering. Maybe there should be one big patch that does all the version
> bumps at once, and then patches to remove the packages that are no
> longer useful.
>

I going to do as you suggest and make one big patch with version bumps,
followed by individual patches removing packages starting with the leaves
in the dependency tree.
Did not know that you would accept ONE patch with version bumps for
several packages, but I think it is appropriate in this situation.

Regards,

Jesper
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130319/b15aa8ce/attachment.html>
