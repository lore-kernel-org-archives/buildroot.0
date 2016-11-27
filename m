From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 23:19:18 +0100
Subject: [Buildroot] [PATCH v2] package/pseudo: update version
In-Reply-To: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
References: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
Message-ID: <20161127231918.6a07ab13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 20:12:02 -0500, Ga?l PORTAY wrote:
> Brings in fix about shutdown synchronization with the server.
> 
> See commit message:
>     If you're running pseudo in docker, a script that creates a pseudo
>     daemon can exit, causing docker to kill pseudo before it's done writing
>     the database.
> 
>     Since the client sending the shutdown request doesn't have its socket
>     closed explicitly by the server, we can just read from the socket in
>     the client to create a delay until the actual exit, which can take
>     a while if there's an in-memory DB.
> 
> Furthermore, the patch add the -S argument that tells the server to
> shutdown and waits for its completion.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Now that we no longer use pseudo, and have gotten back to fakeroot
instead, we don't need to apply this patch to the master branch. But of
course, it doesn't apply to the next branch, because this branch
doesn't have all the previous updates to the pseudo package.

Generally speaking, pseudo is now an "orphan" host package, which we
generally don't like in Buildroot, since it means it is never tested.
What should we do about it? Remove it until it gets used again in the
future?

I've added Arnout, Yann and Peter in Cc so we can have a discussion
about this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
