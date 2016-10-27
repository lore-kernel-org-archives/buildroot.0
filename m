From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 10:46:58 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
 installation
In-Reply-To: <878ttajief.fsf@dell.be.48ers.dk>
References: <20161026203713.9732A7FD9B@busybox.osuosl.org>
 <878ttajief.fsf@dell.be.48ers.dk>
Message-ID: <20161027104658.6edfaae3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 10:38:48 +0200, Peter Korsgaard wrote:

>  > commit: https://git.buildroot.net/buildroot/commit/?id=938f47c7e89362e7b824dbd0bd1ee9839d56d603
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master  
> 
>  > Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
>  > or in $(TARGET_DIR)/$(O) .  
> 
>  > One common reason for that is that pkgconf now prepends the sysroot path
>  > to all the paths it returns. Other reasons vary, but are mostly due to
>  > poorly writen generic-packages.  
> 
>  > And a new step hooks to check that no file gets installed in either
>  > location, called after the install-target and install-staging steps.  
> 
> Didn't we just discuss that this duplicates the proposed
> leak-of-host-paths stuff Samuel is working on?

It does, but Samuel's work is not merged, and this is already useful by
itself. It can always be removed once Samuel's work is merged.

I guess Samuel is working first on the host rpath relativization, then
the target rpath cleanup, and finally the target "leak of host path"
stuff. So it might be a while before Samuel's patches are ready and
merged.

And Yann's patch has already uncovered an issue with the Bellagio
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
