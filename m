From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 13 Oct 2017 16:59:27 +0000
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20171012180819.GI7617@waldemar-brodkorb.de>
References: <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk> <20170715214809.2158c3e2@windsurf>
 <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
 <20170718230641.479308e9@windsurf>
 <20170718210704.GO1482@waldemar-brodkorb.de>
 <1507770391.3839.67.camel@synopsys.com>
 <20171012095248.1c9839a8@windsurf.lan>
 <20171012180819.GI7617@waldemar-brodkorb.de>
Message-ID: <1507913966.3810.38.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-10-12 at 20:08 +0200, Waldemar Brodkorb wrote:
> Hi,
> Thomas Petazzoni wrote,
> 
> > 
> > > 
> > > 3. Regarding purity of standards I may agree that we as more knowledgeable
> > > ? ?engineers need to educate our users and resist temptation to return to
> > > ? ?deprecated things. But as an advocate of my users I'd say that usability
> > > ? ?and support of wider packages might be even more important.
> > 
> > Yes, I agree that there is a balance between "purity" and "pragmatism".
> > 
> > I don't have a very strong opinion on this FTS enabled or not. I don't
> > remember the size measurements with FTS enabled/disabled. Perhaps we
> > should just enable all features needed by Buildroot packages in our
> > uClibc configuration.
> 
> That would be indeed the best policy!
> 
> And I don't think a lot is missing. May be just FTS!

Well there might be more things but still I'd prefer to enable more
packages by default if it doesn't affect entire system (especially with
those "special" packages not enabled) a lot.

I mean as long as we don't introduce significant increase of either
memory footprint of existing system or cause run-time overhead it's
good to allow more packages to be built.

That said if someone wants more stripped down system it's easier
to disable uClibc options (directly via uclibc-menuconfig) compared
to:
?a) Enabling extra options in uClibc plus
?b) Patch Buildroot
to get some extra packages.

-Alexey
