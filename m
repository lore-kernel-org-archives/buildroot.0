From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 14:57:34 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <5252A958.6010001@zacarias.com.ar>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate> <5252A7DF.5020008@zacarias.com.ar>
 <20131007142614.45304395@skate> <5252A958.6010001@zacarias.com.ar>
Message-ID: <20131007145734.781254cd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 07 Oct 2013 09:30:16 -0300, Gustavo Zacarias wrote:
> On 10/07/2013 09:26 AM, Thomas Petazzoni wrote:
> 
> > Sorry, I forgot to add a smiley or something. To be "how useful
> > BerkleyDB can be with PHP" was ironic, so I was actually meaning that I
> > don't think PHP+BerkeleyDB is so useful, so that to me, the first
> > option is perfectly acceptable.
> 
> Seems to be useful to Jerome maybe since he cared about fixing it.
> That being said the license is rotten and not only for PHP, we should
> just stick away from bdb6 IMHO.

Ok, so as discussed on IRC, my proposal would be:

 * Downgrade the berkeleydb package to the last known non-AGPL version
   (i.e essentially revert commit
   4c478de2e76ffc1d0a6dc413475307fd44a0a595). This way, all existing
   packages in Buildroot that rely on berkeleydb continue to work with
   no change, and don't create a legal issue. Add a comment in the
   berkeleydb.mk file that explains why it shouldn't be bumped to v6 of
   the project.

 * If someone cares, integrate an additional berkeleydb6 package that
   packages the v6 of berkeleydb under AGPL.

J?r?me, are you interested in doing such work?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
