From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 07:29:56 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <52337C1B.3090108@mind.be>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
 <52322C8E.7010501@mind.be>
 <OFD093CE04.A9291FB9-ON86257BE4.007504CF-86257BE4.00762929@rockwellcollins.com>
 <5232351D.3030703@mind.be>
 <OFCA626374.83240A5A-ON86257BE4.0077C33E-86257BE4.00781ADF@rockwellcollins.com>
 <523238B0.3050500@mind.be>
 <OFC3B467E6.5C4667CC-ON86257BE4.0078D9C7-86257BE4.0079F00F@rockwellcollins.com>
 <52337C1B.3090108@mind.be>
Message-ID: <20130914072956.20018a94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 13 Sep 2013 22:56:59 +0200, Arnout Vandecappelle wrote:

> > O= is stored in the generated makefile (as you know). However, it gets very
> > annoying to type BR2_EXTERNAL=/path/to/external and I don't always want to
> > export it as shell environment variable. Thus, adding that line to
> > mkmakefile is handy since usually when you specify O= you are doing a
> > specific build which BR2_EXTERNAL would definitely be a part of.
> 
>   My point is: it should (and can) be made part of the .config. It really 
> has to be part of the .config, because some options in the .config will 
> refer to the packages that are defined in the external directory.

I believe it cannot be part of the .config, because there is a
chicken-and-egg problem due to the fact that running 'make menuconfig'
requires to already know the BR2_EXTERNAL value.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
