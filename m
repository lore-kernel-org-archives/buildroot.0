From: john <john.osullivan@cloudiumsystems.com>
Date: Mon, 27 May 2013 10:49:33 +0100
Subject: [Buildroot] Environment Variables and CMAKE
In-Reply-To: <CAHXCMMLF5OcqGrYpxuAH=-9+By7CfLTCzc1C9yha5Jn+S4JgQw@mail.gmail.com>
References: <1369239715.2814.31.camel@john-ubu>
 <CAHXCMMLF5OcqGrYpxuAH=-9+By7CfLTCzc1C9yha5Jn+S4JgQw@mail.gmail.com>
Message-ID: <1369648173.2814.53.camel@john-ubu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Samuel and Arnout, I have gotten something working now using your
suggestions
On Sun, 2013-05-26 at 14:16 +0200, Samuel Martin wrote:
> Hi John,
> 
> 2013/5/22 john <john.osullivan@cloudiumsystems.com>:
> > Hi,
> >
> > I have a cmake based project which I am trying to incorporate into
> > buildroot-2012.05
> >
> > As part of the configuration of the code I need to pass it an
> > environment variable $(CLIENT_VER) which I generate at the time of
> > building in the source directory (which I check out of SVN).
> > I have tried various approaches without success.
> >
> > This is my mk file
> > #I first tried this approach by generating the cmake configuration
> > #command with a script and then executing that script
> > #but the problem here was I would need to know the location of the
> > #buildroot generated version of cmake and the toolchain file
> > #I could figure these out in the script but I felt there must be a
> > #simpler approach
> > #define CLIENT_BARROW_CONFIGURE_CMDS
> > #       (cd $(CLIENT_BARROW_SRCDIR) && source set_environment.sh \
> > #       && ./cmake_run \
> > #       )
> > #endef
> 
> Does the set_environment.sh script do anything else than setting the
> CLIENT_VER env. var.?
> If this version number is stored in its own file, then another way is:
> CLIENT_BARROW_CONF_OPT += -DCLIENT_VER_STR="$(shell cat
> version_file.txt 2>/dev/null)"
> 
> Regards,
> 
