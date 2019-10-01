From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Oct 2019 13:24:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: use host-xxx-package
 macros
In-Reply-To: <20191001113705.458ad371@windsurf.home>
References: <20191001091628.7760-1-heiko.thiery@gmail.com>
 <20191001113705.458ad371@windsurf.home>
Message-ID: <CAEyMn7YP5yeXboAgftpDqdPuqu_tjx-ggc1CrSG-DA9+iz7Ciw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Why ? Why do you need the host variant of this library ?
>

I need this(these) library(ies) as a dependency for a tool that is also
used in the installation step to prepare binary data.

I detail it is used for the integration of a netconf server. This server
has to prepare some YANG models during the installation phase where the
host tool of the sysrep project is needed as requirement.

I know the better solution would be to only compile the needed tool (that
in fact does not need the libev and libssh) but the build environment of
this package has no option to only compile the helper tools.

--
Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191001/4f5b0cb5/attachment.html>
