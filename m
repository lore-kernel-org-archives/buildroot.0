From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Apr 2019 12:11:01 +0200
Subject: [Buildroot] [GSoC19] Motivation
In-Reply-To: <CAGCTLNRDiCJXoNOintN_BayTD0SL3QSUZGBcTLHEWsO6wozkgw@mail.gmail.com>
 (Mohamed Dawod's message of "Thu, 4 Apr 2019 09:08:35 +0200")
References: <CAGCTLNTuWB7E_txmWm9s+fOU5EJsyU1guWNOUM8c40B5WDOoog@mail.gmail.com>
 <20190401214416.1e265d6f@windsurf>
 <CAGCTLNQiJT9j3yxha=X3vm4pK33W82P=iemytFQ6ja7wJcKAag@mail.gmail.com>
 <CAGCTLNSv3LqM07UJ_Swg9-tXGDYEBTGbjw29gpNmeqSEdApu=Q@mail.gmail.com>
 <87v9zue2jn.fsf@dell.be.48ers.dk>
 <CAGCTLNRDiCJXoNOintN_BayTD0SL3QSUZGBcTLHEWsO6wozkgw@mail.gmail.com>
Message-ID: <87imvunkqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mohamed" == Mohamed Dawod <mhm.dawod@gmail.com> writes:

 >> 
 >> >>>>> Peter Korsgaard <peter at korsgaard.com <mhm.dawod@gmail.com>> writes:
 >> > Sorry, I bumped wget yesterday:
 >> 

 > No problem, I will find some other package to update.
 > But I noticed that my patch is slightly different of yours

 > This id my patch :

 > Signed-off-by: Mohamed Dawod <mhm.dawod@gmail.com>
 >> ---
 >> diff -Naur wget/wget.hash wget2/wget.hash
 >> --- a/package/wget.hash    2019-04-03 14:38:50.133423838 +0200
 >> +++ b/package/wget.hash    2019-04-03 15:09:44.834238846 +0200
 >> @@ -1,6 +1,6 @@
 >> # Locally calculated after checking pgp signature
 >> -# https://ftp.gnu.org/gnu/wget/wget-1.20.1.tar.lz.sig
 >> +# https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz.sig
 >> # with key 1CB27DBC98614B2D5841646D08302DB6A2670428
 >> -sha256 0f63e84dd23dc53ab3ab6f483c3afff8301e54c165783f772101cdd9b1c64928
 >> wget-1.20.1.tar.lz
 >> +sha256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
 >> wget-1.20.2.tar.lz
 >> # Locally calculated
 >> sha256 e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b
 >> COPYING
 >> diff -Naur wget/wget.mk wget2/wget.mk
 >> --- a/package/wget.mk    2019-04-03 14:38:50.133423838 +0200
 >> +++ b/package/wget.mk    2019-04-03 14:40:12.080507178 +0200
 >> @@ -4,7 +4,7 @@
 >> #
 >> 
 >> ################################################################################
 >> 
 >> -WGET_VERSION = 1.20.1
 >> +WGET_VERSION = 1.20.2
 >> WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 >> WGET_SITE = $(BR2_GNU_MIRROR)/wget
 >> WGET_DEPENDENCIES = host-pkgconf
 >> 


 > The difference is new sha256sum of the new package.
 > I downloaded the new package from the link "
 > https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz"
 > then I run the command $sha256sum wget-1.20.2.tar.lz
 > how can the checksum be different ?

Ehh, I don't know. I just tried it again here:

wget https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz
--2019-04-04 12:09:23--  https://ftp.gnu.org/gnu/wget/wget-1.20.2.tar.lz
Resolving ftp.gnu.org (ftp.gnu.org)... 209.51.188.20, 2001:470:142:3::b
Connecting to ftp.gnu.org (ftp.gnu.org)|209.51.188.20|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2134961 (2.0M) [application/x-tar]
Saving to: ?wget-1.20.2.tar.lz?

wget-1.20.2.tar.lz                               100%
[===================================================================>]   2.04M  2.12MB/s    in 1.0s

2019-04-04 12:09:24 (2.12 MB/s) - ?wget-1.20.2.tar.lz? saved [2134961/2134961]

sha256sum wget-1.20.2.tar.lz
84d3cbece8c08e130a8da0a72cf6e543a2adf58ca8ecf28726560b06243d4ce6  wget-1.20.2.tar.lz

Which matches current git.

-- 
Bye, Peter Korsgaard
