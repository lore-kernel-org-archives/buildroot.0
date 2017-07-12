From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 17:36:44 +0200
Subject: [Buildroot] RFC: ASLR
In-Reply-To: <CANQCQpb32H5XF+DtgYcuu=JFdgGCE3gEm+pHffWYk0yno6w0pg@mail.gmail.com>
 (Matthew Weber's message of "Mon, 10 Jul 2017 11:10:34 -0500")
References: <CANQCQpb32H5XF+DtgYcuu=JFdgGCE3gEm+pHffWYk0yno6w0pg@mail.gmail.com>
Message-ID: <87inixpsz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Peter,
 > I have a patchset we're starting to assemble for enabling hardening
 > across specific packages in Buildroot.  I hear you may have already
 > looked at this problem/feature?

Well, it is on my todo list - But I haven't done any actual work on it
yet - So your timing is perfect ;)


 > What I'm seeing is that these changes are considered "optional" at a
 > package build level.  Plus I'm not advocating we carry specific
 > Buildroot patches for items where it doesn't make sense for the
 > package upstream to default to them.  Instead, could we add a
 > conditional in the .mk that adds the FLAGS update on specific packages
 > which have the ability to enable it? Sort of in a similar way to how
 > we enable libcurl and other dependencies automatically in other
 > packages if that package/option is enabled.  This would allow us to
 > grow support over time and not force all packages to build with the
 > option (plus keep it optional in general for those that want it
 > enabled).

Do you see actual breakage with packages if these flags are added
globally to TARGET_CFLAGS? From a quick look at lede, they seem to
enable it globally:

https://git.lede-project.org/?p=source.git;a=blob;f=config/Config-build.in#l175

There seems to be some some hooks (E.G. PKG_RELRO) to disable this for
specific packages, but I don't see it getting used anywhere:

https://git.lede-project.org/?p=source.git;a=blob;f=include/hardening.mk

-- 
Bye, Peter Korsgaard
