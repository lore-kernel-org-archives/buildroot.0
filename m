From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Mar 2015 23:54:55 +0100
Subject: [Buildroot] [PATCH v1] evtest: fix
	program_invocation_short_name undeclared
In-Reply-To: <20150324002632.3aeef6e7@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 24 Mar 2015 00:26:32 +0100")
References: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
 <20150320140947.38980613@free-electrons.com>
 <1426881775.2897.10.camel@synopsys.com>
 <20150320212213.21f2881e@free-electrons.com>
 <87bnjjgx9n.fsf@dell.be.48ers.dk>
 <20150324002632.3aeef6e7@free-electrons.com>
Message-ID: <874mpagg5c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Mon, 23 Mar 2015 23:32:52 +0100, Peter Korsgaard wrote:

 >> > Yes, it works. In the mean time, there is a way to avoid the build
 >> > errors: add an exception to the autobuilder script. See
 >> > http://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run#n346
 >> > for a bunch of examples.
 >> 
 >> Or simply make the packages depend on
 >> !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12. Peter will you send
 >> patches to do that for evtest and libevdev?

 > This is indeed OK for packages such as evtest that don't have, or don't
 > have many, reverse dependencies. But this is hardly a sustainable
 > solution in general, especially for packages that have a high number of
 > reverse dependencies.

True, with lots of reverse deps it becomes very painful.

 > We simply can't handle all the little possible variations of uClibc
 > configurations that exist in every external toolchain, it's not
 > workable in a general fashion.

We don't support that many external uClibc based toolchains (only arc,
bfin and sh) so I think it's still doable, but ok.

 > I know we're already doing it to some extent, but I'd like to avoid
 > doing it when possible, especially when we have a good cooperation with
 > the upstream developers (in this case, the Synopsys folks).

If we can remove the arc 2014.12 toolchain and add the new 2015 one
before 2015.05-rc1 (E.G. end of April) then I'm fine with just disabling
it in the autobuilders for now, otherwise I still think we should add
the depends on !arc-2014-12 to not break it for users.

-- 
Bye, Peter Korsgaard 
