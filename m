From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 27 Nov 2016 17:58:37 -0500
Subject: [Buildroot] [PATCH v2] package/pseudo: update version
In-Reply-To: <20161127231918.6a07ab13@free-electrons.com>
References: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
 <20161127231918.6a07ab13@free-electrons.com>
Message-ID: <20161127225837.k6ciykf7zie7pdql@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 27, 2016 at 11:19:18PM +0100, Thomas Petazzoni wrote:
> Now that we no longer use pseudo, and have gotten back to fakeroot
> instead, we don't need to apply this patch to the master branch. But of
> course, it doesn't apply to the next branch, because this branch
> doesn't have all the previous updates to the pseudo package.
> 

Okay. It seems my patch came too late... Too bad, I would like this patch merged
before the revert.

> Generally speaking, pseudo is now an "orphan" host package, which we
> generally don't like in Buildroot, since it means it is never tested.
> What should we do about it? Remove it until it gets used again in the
> future?

The main point of this patch is to add the -S argument to tell the server to
shutdown (and wait for its completion (bump)). But this part no longer applies
because the wrapper script has gone (master, next). So we should drop this patch
and the package as well.

(In case of we decide latter to come back to pseudo, we should remember to add
the -S argument to the wrapper script.)
