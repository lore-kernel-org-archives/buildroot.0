From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 8 Sep 2015 14:49:49 +0100
Subject: [Buildroot] [PATCH] gdb: prevent building the documentation
In-Reply-To: <55EEE52F.4020904@mind.be>
References: <1441718565-24492-1-git-send-email-Vincent.Riera@imgtec.com>
 <55EEE52F.4020904@mind.be>
Message-ID: <CA+BsyQ6edT36JYL7nJCfv1ZChbrO-Z9t8RWQ4kXmZ8ypqy4FAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Since it is patching the source, it should be POST_PATCH_HOOKS rather than
> PRE_CONFIGURE_HOOKS.
>
>  That does mean that people using OVERRIDE_SRCDIR should do this fix in the
> overridden source, but I think that's OK.

I was looking at this in parallel and was about to start looking at
adding a host-texinfo package (which includes makeinfo).

I was a little hesitant, as I think most buildroot users don't care
about building documentation. On the other hand, adding the dependency
avoids patches and makes life a little easier when using
OVERRIDE_SRCDIR as you noted.

regards

Brendan
