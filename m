From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 10:55:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/dtc: add optional libyaml
 dependency
In-Reply-To: <20190729121638.6270-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Jul 2019 14:16:37 +0200")
References: <20190729121638.6270-1-fontaine.fabrice@gmail.com>
Message-ID: <87y30d1czp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since bump to version 1.5.0 with commit
 > b2f4dc7bc15bcf2cc0282e6a226d97f050975c35, dtc binary optionally depends
 > on libyaml which is enabled if it is found by pkgconfig so:
 >  - add host-pkgconf and libyaml dependencies only if
 >    BR2_PACKAGE_DTC_PROGRAMS and BR2_PACKAGE_LIBYAML are set
 >  - disable yaml for host build (and so remove host-pkgconf from
 >    HOST_DTC_DEPENDENCIES)

I was going to say that pkg-config is also used by the valgrind logicm
but as you disable that in patch 2..

Committed, thanks.

-- 
Bye, Peter Korsgaard
