From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 15 Sep 2015 21:49:02 +0200
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <CAFOYHZAWy7NpB2eXw20RmRaw6j3ySvxeWf9n6mhKrGL_9jhdfw@mail.gmail.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <20150914155829.1d326cc0@free-electrons.com> <55F6D5C5.9090504@imgtec.com>
 <CAFOYHZAWy7NpB2eXw20RmRaw6j3ySvxeWf9n6mhKrGL_9jhdfw@mail.gmail.com>
Message-ID: <1442346542.1886.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2015-09-15 at 11:03 +1200, Chris Packham wrote:
> On Tue, Sep 15, 2015 at 2:12 AM, Vicente Olivert Riera
> <Vincent.Riera@imgtec.com> wrote:
> > Dear Thomas Petazzoni,
> > 
> > It shouldn't conflict as micropython installs the library files
> > under
> > /usr/lib/micropython/ directory. And the installed binaries are
> > /usr/local/bin/{pip-}micropython. Perhaps this should be changed to
> > install them in /usr instead of /usr/local.
> 
> The local part seems hard-coded to me. But we could always sed it on
> the way through.

Adding PREFIX=$(TARGET_DIR)/usr to MICROPYTHON_INSTALL_TARGET_CMDS
works for me:

$ ls output/target/usr/bin/
micropython  pip-micropython

Best regards
J?rg Krause
