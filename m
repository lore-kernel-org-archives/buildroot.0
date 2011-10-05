From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 22:40:01 +0200
Subject: [Buildroot] Question: := vs = in package *.mk files
In-Reply-To: <20111005090428.34c8f565@skate> (Thomas Petazzoni's message of
 "Wed, 5 Oct 2011 09:04:28 +0200")
References: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6DB@AUSP01VMBX24.collaborationhost.net>
 <20111005090428.34c8f565@skate>
Message-ID: <87wrcjmau6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> In package definition, Peter has said that he preferred the usage of
 Thomas> '=' except when it would create a noticeable performance problem. So
 Thomas> for all package definitions such as _SITE, _VERSION, _SOURCE,
 Thomas> _AUTORECONF, _INSTALL_STAGING, etc. the '=' sign is the one to choose.

Indeed. And the reason for this is that it fixes ordering issues because
of the late bindings, so you don't need to be careful about using
"outside" variables within a package .mk

-- 
Bye, Peter Korsgaard
