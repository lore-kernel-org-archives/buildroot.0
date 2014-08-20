From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Aug 2014 15:42:13 +0200
Subject: [Buildroot] [PATCHv2] package/gcc: cleanup arch/cpu combinations
In-Reply-To: <53F49408.3050701@zacarias.com.ar>
References: <1408482998-24200-1-git-send-email-gustavo@zacarias.com.ar>
 <20140820142417.31c93ef2@free-electrons.com>
 <53F49408.3050701@zacarias.com.ar>
Message-ID: <20140820154213.00c239a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 20 Aug 2014 09:26:48 -0300, Gustavo Zacarias wrote:

> I thought about that but it really doesn't help in this scenario in a
> complete way, since a given gcc may be broken (like 4.9.x was for ppc
> e500) even though it includes support because of bitrot or bugs, like
> some sparc targets, or blackfin for that matter.

Right, but I believe it's two different (but related) matters:

 * On one hand, Mischa's approach is good to specify starting from
   which gcc version this or that architecture or architecture variant
   was supported. It allows to encode the "theory".

 * On the other hand, additional 'depends on' can be added
   exceptionally to prevent certain gcc versions from being selected,
   when they are supposed to work in theory, but in practice do not
   work due to bugs (that are likely to be fixed in the next point
   release).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
