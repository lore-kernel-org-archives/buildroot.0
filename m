From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 4 Mar 2013 21:15:06 +0100
Subject: [Buildroot] [PATCH] <pkg>-rsync: exclude version control files
In-Reply-To: <871ubv9bk0.fsf@dell.be.48ers.dk>
References: <f9ac20b69b1bfd3f77ef.1362169598@BEANTN0L019720>
 <871ubv9bk0.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LXoVUisH8k2bUobe4i9Z2PwURG=HCG2YxYZc0apRrPsow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 4, 2013 at 9:04 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
>  Thomas> When using rsync to import package sources (typically with
>  Thomas> PKG_OVERRIDE_SRCDIR), it often happens that these external sources
>  Thomas> are under version control, and contain directories like .git,
>  Thomas> .hg, etc.
>
>  Thomas> Depending on the project, these directories can become pretty large
>  Thomas> and typically have a lot of files. Moreover, they are not necessary
>  Thomas> in the context of building the package. Therefore, this commit adds
>  Thomas> the --cvs-exclude option to the rsync call, saving both disk space
>  Thomas> and sync time.
>
> I don't personally use this, but doesn't that break stuff using the
> version info (like E.G. the kernel storing the git id)?

Hmm, it probably will. Are people actually relying on this when using local.mk?
I have always thought of local.mk to be a personal developer way of
working, not something you'd rely on for a real project. In these
cases, I'd define the version number in the defconfig.

Input from other users could be welcome here.
If needed, we can make this a configurable option?

Best regards,
Thomas
