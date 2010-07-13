From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jul 2010 20:08:20 +0200
Subject: [Buildroot] [PATCH/RFC] Download sources from Git (and more)
In-Reply-To: <1279032219.2887.78.camel@dubciaranr1.verifone.com>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
	<1279032219.2887.78.camel@dubciaranr1.verifone.com>
Message-ID: <20100713200820.1a5fcc60@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Jul 2010 15:43:39 +0100
Quotient Remainder <quotientvremainder@gmail.com> wrote:

>  - Do you see any way of making it possible to use the clone as the
> actual working copy used by buildroot?  That is, if I clone a
> repository (as opposed to archive) and then want to make changes, I
> can edit the source and build/test the change in-place (in
> output/build/package/) . As it stands with this patch set, I think it
> would be necessary to make a change in the source in
> $(PKG_NAME).git/, commit the change, note the new version, change the
> package version in package/Makefile to the same and make will then
> copy an entire snapshot to a new build-dir/pkg-newversion/.

I understand this need: use Buildroot not only as an integration system
to produce the final system, but also during the development of the
application. For the moment, our recommended practice for this is to
work on the application outside of Buildroot, as Buildroot is not
well-suited for doing this.

Adding such a capability to Buildroot requires a fairly wide
brainstorming and discussion to propose a global design that solves
this question. What do we want to achieve ? What is the exact use
case ? How all development steps are going to work ?

For that reason, I think Maxime's patch is saner: it adds the simple
capability of downloading a package from GIT/SVN, without changing the
existing Buildroot workflow.

I'm really open to changing the Buildroot workflow, but:

 1. I think it requires a much more detailed discussion about *what* we
    need and then *how* we implement it.

 2. I'd prefer to do such major changes once the Buildroot cleanup
    phase (started in January 2009) is more or less completed, so that
    we start with a Buildroot from which we are satisfied in terms of
    quality before starting adding major features such as turning
    Buildroot into a development system and not only an integration
    system. I think it's more important to make Buildroot work properly
    with the feature-set we have today than having dozens of
    half-thought features.

As such a change wouldn't probably occur before 2010.08, I'd prefer to
have a solution similar to Maxime's merged into the tree for the
moment, and having someone seriously starting the discussion on the
Buildroot future as a development system.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
