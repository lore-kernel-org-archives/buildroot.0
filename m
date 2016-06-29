From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 16:43:36 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <CAHfJR7iZpPnpVB0NqQPCEvYU7myCsdW2x=m5aoi1KGZk0p_MTg@mail.gmail.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <CAHfJR7h01DTkHetP0W196NbmeHCNZZjw6Ju-D9uP3pA6+A1gNw@mail.gmail.com>
 <20160629161137.5b5a13b3@free-electrons.com>
 <CAHfJR7iZpPnpVB0NqQPCEvYU7myCsdW2x=m5aoi1KGZk0p_MTg@mail.gmail.com>
Message-ID: <20160629164336.67a86168@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 16:30:34 +0200, Julien Floret wrote:

> It surely needs some rework, sorry for the noise!

No problem, this cleanup effort is definitely welcome.

> From your comments, I also understand some host packages should be kept
> even if they are unused in buildroot upstream (e.g. jsmin), so I guess it's not
> trivial for me to know which packages could be removed.

Yes, there are some tricky cases. Normally the rule should indeed be
that a host package should either:

 1/ Be described in a Config.in.host file and therefore visible in
    menuconfig ;

 2/ Be a dependency of another package.

However, there are other situations:

 */ Host packages that we merge, even if they are not *yet* used by
    target packages. We sometimes do this to help people reduce the
    size of their patch series by merging some initial patches, while
    the remaining patches are still under discussion/review. Normally
    this is only a temporary situation (but for sepolgen, it's a
    temporary situation that lasts since many months).

 */ Host packages that are not used by other packages in Buildroot, but
    might be used by private, company/project-specific packages. I
    don't like this situation, because there is really no way these
    host packages will ever be built/tested. But I'm not sure what to
    do about these: adding an entry in menuconfig is a bit weird since
    they are not really needed for anything else but a build dependency.

What do others think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
