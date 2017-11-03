From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 09:03:16 +0100
Subject: [Buildroot] [PATCH v4] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <bd5262d5-19d7-fdcd-dd0d-5fd6b00bffaa@microchip.com>
References: <1509658876-29888-1-git-send-email-joshua.henderson@microchip.com>
 <20171102230302.26744909@windsurf>
 <bd5262d5-19d7-fdcd-dd0d-5fd6b00bffaa@microchip.com>
Message-ID: <20171103090316.66922552@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 16:06:12 -0700, Joshua Henderson wrote:

> > Who did the backport of this patch in Buildroot? It should carry the
> > Signed-off-by from the person who did this backport. I don't know if
> > it's you or S?bastien Szymanski.  
> 
> I am the one guilty. Sigh.

Thanks, seen your v5, looks good.

> qt5declarative depends on qt5base.  If mesa3d is configured, qt5base depends
> on mesa3d and is told to build with opengl.  Then, we leave buildroot. qt5base
> build will try to find various incarnations of opengl through its own build
> tests.  qt5base and qt5declarative use the result of those config tests
> through qtConfig() to see if opengl is available.  If you build qt5base you
> can see config.log and the actual tests under config.tests/ in the build_dir.
> 
> Now, you can still build QT with opengl support, and still opt to not use it
> and instead use the software renderer at runtime with the environment variable
> QMLSCENE_DEVICE=softwarecontext.  This patch is all about not making opengl a
> requirement, where it is not.

Thanks for the extended explanation!

I'll apply your v5.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
