From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jun 2017 12:01:42 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libv4l: upstream patches for
 noMMU platform
In-Reply-To: <a69f63ba-b2c9-6b25-560d-c5c0ad8fb995@st.com>
References: <1496830327-5235-1-git-send-email-hugues.fruchet@st.com>
 <1496830327-5235-2-git-send-email-hugues.fruchet@st.com>
 <20170608215446.3681e074@free-electrons.com>
 <a69f63ba-b2c9-6b25-560d-c5c0ad8fb995@st.com>
Message-ID: <20170609120142.6db8e35a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Jun 2017 09:33:24 +0000, Hugues FRUCHET wrote:

> > Thanks a lot for those patches! It's mostly good, but I have a few
> > comments. First of all, both of your patches should be squashed into
> > just one, because they serve the same purpose: enabling libv4l on
> > nommu/static linking configurations.  
> 
> I have done it this way in order that you can easily revert the patch 
> 1/2 when bumping to v4l-utils 1.12.6 release (or 1.12.7, I don't know 
> the frequency of releases).
> The patch 2/2 is specific to buildroot and must remain.

When we bump a package version and patches need to be dropped, we don't
revert the commit that was adding them. We simply drop the patches in
the commit doing the version bump, and indicate in the commit log why
they are dropped (ideally with a reference to the upstream commit).

> >> +Subject: [PATCH 4/9] configure.ac: clarify configure summary  
> > 
> > Please generate the package/libv4l/ patch series with "git format-patch
> > -N" so  that the prefix is just [PATCH] and not [PATCH X/Y].  
> Will do ! I'll miss also the prefix [buildroot]...

Not sure what you mean by the "prefix [buildroot]". The [Buildroot] is
added by the mailing list software, and has nothing to do with how
patches are generated/applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
