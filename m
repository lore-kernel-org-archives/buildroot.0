From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 May 2013 09:21:38 +0200
Subject: [Buildroot] [PATCH] automake version update 1.12.4
In-Reply-To: <51854C29.2050902@zacarias.com.ar>
References: <1352464469-22784-1-git-send-email-alexander@mezon.ru>
 <51854C29.2050902@zacarias.com.ar>
Message-ID: <20130506092138.55d479bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Alexander,

On Sat, 04 May 2013 14:58:01 -0300, Gustavo Zacarias wrote:
> On 11/09/2012 09:34 AM, Alexander Khryukin wrote:
> 
> > -AUTOMAKE_VERSION = 1.11.6
> > +AUTOMAKE_VERSION = 1.12.4
> 
> I must say nack to using the automake 1.12.x series for now.
> There are a few packages that fail with the 1.12.x series which i
> considered when bumping/testing automake to the 1.11.x series because of
> deprecated/removed features.
> These packages need to be fixed before (example: neardal), otherwise the
> bump would just introduce build errors.

For this kind of fairly sensitive transitions, I think it'd be great to
do a allyespackageconfig build first, discard all the failing packages
(they are not too many packages failing at this point), and redo the
same experience with automake bumped. So we have a list of which
packages have to be fixed, and progressively go through each of them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
