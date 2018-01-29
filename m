From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 22:50:26 +0100
Subject: [Buildroot] [PATCH 1/1] domoticz: depends on NPTL
In-Reply-To: <20180129222516.22768129@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 29 Jan 2018 22:25:16 +0100")
References: <20180120112824.12236-1-fontaine.fabrice@gmail.com>
 <87k1w05sww.fsf@dell.be.48ers.dk>
 <20180129222516.22768129@windsurf.lan>
Message-ID: <874ln449nh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 29 Jan 2018 21:09:03 +0100, Peter Korsgaard wrote:

 >> > boost 1.66 uses pthread_condattr_setclock in
 >> > boost/asio/detail/impl/posix_event.ipp so add a dependency to
 >> > BR2_TOOLCHAIN_HAS_THREADS_NPTL  
 >> 
 >> Shouldn't boost then depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL (and
 >> domoticz enherit it), or is this code only used in special cases?

 > Well, Boost is mostly a header-only library, in particular the asio
 > stuff I believe. While we have sub-options for the parts of Boost that
 > are not purely headers, we don't have any sub-options for the parts of
 > Boost that are just headers.

 > So, the options are either to add sub-options to Boost, or to make
 > Boost as a whole only available on NPTL toolchains. The latter is a bit
 > annoying as it would mean adding this dependency to all Boost reverse
 > dependencies, even those not using asio.

 > So I think Fabrice's patch is the best solution we can have today. I'm
 > not saying it's perfect, but it's good enough IMO.

Ok, fine by me - But please mention this in the commit message.

-- 
Bye, Peter Korsgaard
