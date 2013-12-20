From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Dec 2013 16:46:54 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <20131220163423.4574d257@skate>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>	<52B32DF1.2010702@mind.be>	<CAHkwnC9J_4GOPSLtP2KWLD9YipFV+hVadXc_RrkjvNoYQ2oJew@mail.gmail.com>
 <20131220163423.4574d257@skate>
Message-ID: <52B4666E.5080207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/13 16:34, Thomas Petazzoni wrote:
> Dear Fabio Porcedda,
>
> On Fri, 20 Dec 2013 15:36:56 +0100, Fabio Porcedda wrote:
>
>> The autobuild does not try to test allpackageyesconfig, does it?
>
> But, the autobuild is not designed for that. However, an
> allyespackageconfig configuration is something we could add to the
> Jenkins if you want.

  If you do that, expect it to fail :-)

  It will certainly fail if you include a kernel in that config: some 
packages (Xenomai, rtnet, some modules) only work with certain kernel 
versions and AFAIK there is no single kernel that works for all these 
packages.

  Not building a kernel excludes many packages so may give you more luck.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
