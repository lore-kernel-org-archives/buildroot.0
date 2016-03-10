From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 11:12:00 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <56E143C3.4080809@mind.be>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
 <56E0B5F5.9040109@mind.be> <3817786.Ntra8H592Z@sagittea>
 <20160310103934.0aaef6d1@free-electrons.com>
 <56E143C3.4080809@mind.be>
Message-ID: <20160310111200.29a9e9a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 10:52:03 +0100, Arnout Vandecappelle wrote:

>   This bit could easily be done in generic-package. I definitely don't like 
> direct manipulation of global variables in a package.mk.

You mean like TARGET_FINALIZE_HOOKS ? :-)

package/google-breakpad/google-breakpad.mk:TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
package/luarocks/luarocks.mk:TARGET_FINALIZE_HOOKS += LUAROCKS_FINALIZE_TARGET
package/perl/perl.mk:TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
package/python/python.mk:TARGET_FINALIZE_HOOKS += PYTHON_FINALIZE_TARGET
package/python3/python3.mk:TARGET_FINALIZE_HOOKS += PYTHON3_FINALIZE_TARGET
...

>   It's incredible how much discussion we have about such a corner feature :-)
> I guess we just need _something_ to disagree about :-P

Yes, I agree it's incredible. But I personally don't like Yann's
solution, it is too much over-engineered IMO, and is in fact less
flexible than simpler solutions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
