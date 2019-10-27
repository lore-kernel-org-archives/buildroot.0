From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 27 Oct 2019 16:28:04 +0100
Subject: [Buildroot] [PATCH] toolchain-external: restrict copying of
 dynamic loader to ld*.so.*
In-Reply-To: <20191027145921.3dc74718@windsurf.dhcp.lyon.intranet>
References: <20190205211544.26547-1-patrickdepinguin@gmail.com>
 <20191027145921.3dc74718@windsurf.dhcp.lyon.intranet>
Message-ID: <CAAXf6LU2z4Lye4uULJeX_7dMQdEPXrHBJdB6xyOW4mQdnERnRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 27, 2019, 14:59 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Tue,  5 Feb 2019 22:15:44 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
> > ("toolchain-external: copy ld*.so* for all C libraries") changed (among
> > other things) the glob pattern to catch the dynamic loader from
> >     ld*.so.*
> > to
> >     ld*.so*
> >
> > thus now matching files like 'ld-2.20.so' in addition to files like
> > 'ld.so.1'.
> >
> > However, there is no apparent reason why that change was made. It is not
> > explicitly mentioned in the commit message as to why that would be
> needed,
> > nor is clear based on the rest of the changes in that commit.
> >
> > The consequence of the change is that more files than needed end up in
> the
> > target root filesystem, adding extra unnecessary size to it.
> >
> > Therefore, revert the glob pattern back to what it was.
> >
> > Signed-off-by: Thomas De Schampheleire <
> thomas.de_schampheleire at nokia.com>
>
> Thanks Thomas! As you know, we like this kind of patch to bitrot for a
> few months in patchwork, to finally apply them.
>
> So this is what just happened: I applied your patch, after
> significantly extending the commit log with additional explanations
> from your lengthy reply in this thread.
>
> Thanks for your patience!
>

Thanks :-)

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191027/3fb05a10/attachment.html>
