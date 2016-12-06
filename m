From: Nielsen, David Marqvar <david.nielsen@cobham.com>
Date: Tue, 6 Dec 2016 07:07:36 +0000
Subject: [Buildroot] [PATCH 1/1] tftpd: make installation of tftp client
 optional
In-Reply-To: <20161205222952.1ae0c4ea@free-electrons.com>
References: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8E8F554@ly-ex-02.thrane.tt.ad>
 <20161205222952.1ae0c4ea@free-electrons.com>
Message-ID: <6A3F8AF4AF06764EBB67BDF72AE0FB4701F8EA38FE@ly-ex-02.thrane.tt.ad>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas Petazzoni,

> Your commit log is empty, so I'm not sure what you're trying to do
> here. If I understand correctly, you want a sub-option to
> enable/disable the installation of the "tftp" binary, so that you can
> have a configuration where:
> - tftpd is the one coming from the tftpd package
> - tftp remains the one provided by Busybox

Exactly.
The (rather unusual) situation is that the Busybox implementation has
features that the "full" tftpd package does not support - features that
we have come to rely on (set block size).

> However, in Buildroot, we try to avoid having one sub-option per binary
> program. We do have that in a few packages, and it's often very painful
> and annoying to maintain.

Ok.

> If you really, really don't like the tftp
> program from the tftpd package, you can also add in your post-build
> script:
> rm /usr/bin/tftp
> ln -s /bin/busybox /usr/bin/tftp

Thank you for this idea.

> But I just checked and the tftp program installed by the tftp package
> is only 22 KB in size:
> So I really don't think it's worth the effort having yet another
> sub-option for 22 KB, especially when you can handle such tweaking in
> your post-build script if you really really want to.

I agree.
Thank you very much for your response.

/David
